require 'pry'
require 'benchmark'
require 'typhoeus'
require 'dotenv'
require './lib/errbit_loader'

Dotenv.load('.env')

create_notices = CreateNoticeTest.new(
  count: ENV['CREATE_NOTICES_COUNT'].to_i,
  concurrency: ENV['CREATE_NOTICES_CONCURRENCY'].to_i,
  host: ENV['ERRBIT_HOST'],
  key: ENV['ERRBIT_APP_KEY']
)

Benchmark.bm do |x|
  x.report { create_notices.run }
end

puts create_notices.results
