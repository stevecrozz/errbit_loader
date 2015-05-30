require 'http-cookie'
require 'uri'

class SearchNoticesTest
  attr_reader :results
  attr_reader :count
  attr_reader :concurrency

  def initialize(count:, concurrency:, host:, username:, password:)
    @count = count
    @concurrency = concurrency
    @host = host
    @username = username
    @password = password
    @hydra = Typhoeus::Hydra.new(max_concurrency: @concurrency)
    @results = {}
    @requests = {}
  end

  def log_in
    @cookie_jar = HTTP::CookieJar.new
    response = Typhoeus.get(@host + '/users/sign_in')
    @cookie_jar.parse(response.headers['Set-Cookie'], @host)
    cookie = HTTP::Cookie.cookie_value(@cookie_jar.cookies(@host))

    @csrf_token = Nokogiri::HTML(response.body).
      css('[name=authenticity_token]').
      attr('value').
      text

    response = Typhoeus.post(@host + '/users/sign_in',
      # followlocation: true,
      body: {
        'utf8' => '✓',
        'authenticity_token' => @csrf_token,
        'user[email]' => @username,
        'user[password]' => @password,
        'user[remember_me]' => '0'
      },
      headers: {
        'Content-Type'=> "application/x-www-form-urlencoded",
        'Cookie' => cookie
      })

    @cookie_jar.parse(response.headers['Set-Cookie'], @host)

    cookie = HTTP::Cookie.cookie_value(@cookie_jar.cookies(@host))
    response = Typhoeus.get(@host, headers: { 'Cookie' => cookie })

    raise "Failed login" unless response.body.match('Signed in successfully')
  end

  def prepare
    log_in

    words = ErrbitLoader::Notice::ERROR_MESSAGES.join(" ").split(/\W+/)

    @count.times do
      r = search(words.sample)
      r.on_complete(&method(:on_complete))
      @results[r.object_id] = {}
      @hydra.queue r
    end
  end

  def search(terms)
    Typhoeus::Request.new(
      (@host + '/problems/search?utf8=%E2%9C%93&search=' << URI.escape(terms)),
      method: :get,
      headers: { 'Cookie' => HTTP::Cookie.cookie_value(@cookie_jar.cookies(@host)) }
    )
  end

  def run
    @hydra.run
  end

  def on_complete(response)
    result = @results[response.request.object_id]

    if response.timed_out?
      result[:status] = 'timeout'
    else
      result[:status] = response.code
      result[:response_time] = response.options[:total_time]
    end
  end

  def report
    response_times = @results.values.map { |r| r[:response_time] }.sort
    successes = @results.values.size { |r| r[:status] == 200 }

    {
      errors: response_times.size - successes,
      max: response_times.max,
      min: response_times.min,
      avg: response_times.inject(0.0) { |sum, el| sum + el } / successes,
      p90: response_times[(0.90 * successes).round - 1],
      p95: response_times[(0.95 * successes).round - 1],
      p99: response_times[(0.99 * successes).round - 1],
    }
  end
end
