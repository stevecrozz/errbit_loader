class CreateNoticeTest
  attr_reader :results

  def initialize(count:, concurrency:, host:, key:)
    @count = count
    @concurrency = concurrency
    @host = host
    @key = key
    @hydra = Typhoeus::Hydra.new(max_concurrency: @concurrency)
    @results = {}

    prepare
  end

  def prepare
    @count.times do
      r = request
      r.on_complete(&method(:on_complete))
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
    if response.timed_out?
      add_timeout
    else
      add_code(response.code)
    end
  end

  def add_timeout
    @results['timeout'] ||= 0
    @results['timeout'] += 1
  end

  def add_code(code)
    @results[code] ||= 0
    @results[code] += 1
  end
end
