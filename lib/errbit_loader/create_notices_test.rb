class CreateNoticeTest
  attr_reader :results

  def initialize(count:, concurrency:, host:, key:)
    @count = count
    @concurrency = concurrency
    @host = host
    @key = key
    @hydra = Typhoeus::Hydra.new(max_concurrency: @concurrency)
    @results = {}
    @requests = {}

    prepare
  end

  def prepare
    @count.times do
      r = request
      r.on_complete(&method(:on_complete))
      @results[r.object_id] = { started_at: Time.now }
      @hydra.queue r
    end
  end

  def request
    Typhoeus::Request.new(@host,
      method: :post,
      body: ErrbitLoader::Notice.generate(@key).to_xml,
      #params: { field1: "a field" },
      #headers: { Accept: "text/html" }
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
      result[:ended_at] = Time.now
      result[:response_time] = result[:ended_at] - result[:started_at]
    end
  end

  def report
    response_times = @results.values.map { |r| r[:response_time] }.sort

    {
      max: response_times.max,
      min: response_times.min,
      avg: response_times.inject(0.0) { |sum, el| sum + el } / response_times.size,
      p90: response_times[(0.90 * response_times.size).round - 1],
      p95: response_times[(0.95 * response_times.size).round - 1],
      p99: response_times[(0.99 * response_times.size).round - 1],
    }
  end
end
