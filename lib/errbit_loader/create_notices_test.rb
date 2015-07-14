require 'net/http'

class CreateNoticesTest
  attr_reader :results
  attr_reader :count
  attr_reader :concurrency

  def initialize(count:, concurrency:, host:, key:)
    @count = count
    @concurrency = concurrency
    @host = host
    @location = '/notifier_api/v2/notices'
    @key = key
    @hydra = Typhoeus::Hydra.new(max_concurrency: @concurrency)
    @results = {}
    @requests = {}
    @threads = []
    @mutex = Mutex.new
    @notices = []
  end

  def prepare
    @count.times do
      @notices << ErrbitLoader::Notice.generate(@key).to_xml
    end
  end

  def request
    Typhoeus::Request.new(@location,
      method: :post,
      body: ErrbitLoader::Notice.generate(@key).to_xml
    )
  end

  def run
    @concurrency.times do
      t = Thread.new do
        while @count > 0 do
          @count -= 1
          notice = @mutex.synchronize { @notices.pop }

          started_at = Time.now
          req = Net::HTTP.new('127.0.0.1', '8080')
          res = req.post(@location, notice, {
            'Content-Type' => 'text/xml'
          })
          on_complete(req, res, started_at)
        end
      end
      puts t
      @threads << t
    end
    @threads.each(&:join)
  end

  def on_complete(req, response, started_at)
    @results[req] = {
      status: response.code.to_i,
      response_time: Time.now - started_at
    }
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
