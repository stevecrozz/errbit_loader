class CreateNoticesTest
  attr_reader :results
  attr_reader :count
  attr_reader :concurrency

  def initialize(count:, concurrency:, host:, key:)
    @count = count
    @concurrency = concurrency
    @host = host
    @location = host + '/notifier_api/v2/notices'
    @key = key
    @hydra = Typhoeus::Hydra.new(max_concurrency: @concurrency)
    @results = {}
    @requests = {}
  end

  def prepare
    @count.times do
      r = request
      r.on_complete(&method(:on_complete))
      @results[r.object_id] = {}
      @hydra.queue r
    end
  end

  def request
    Typhoeus::Request.new(@location,
      method: :post,
      body: ErrbitLoader::Notice.generate(@key).to_xml
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
