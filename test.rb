require 'pry'
require 'benchmark'
require 'typhoeus'
require 'dotenv'
require './lib/errbit_loader'

Dotenv.load('.env')

reports = []

reports << CreateNoticesTest.new(
  count: ENV['CREATE_NOTICES_COUNT'].to_i,
  concurrency: ENV['CREATE_NOTICES_CONCURRENCY'].to_i,
  host: ENV['ERRBIT_HOST'],
  key: ENV['ERRBIT_APP_KEY']
)

reports << SearchNoticesTest.new(
  count: ENV['SEARCH_NOTICES_COUNT'].to_i,
  concurrency: ENV['SEARCH_NOTICES_CONCURRENCY'].to_i,
  host: ENV['ERRBIT_HOST'],
  username: ENV['ERRBIT_USERNAME'],
  password: ENV['ERRBIT_PASSWORD']
)

reports.each do |report|
  puts report.class.name
  puts '----------------------------------------------------------------------'
  puts "Concurrency: #{report.concurrency}"
  puts "Count: #{report.count}"
  puts

  report.prepare

  beforetime = Time.now
  report.run
  aftertime = Time.now

  report.report.each do |k,v|
    spaces = 20 - k.length
    if v.is_a? Float
      puts sprintf("#{k}%#{spaces}f", v)
    else
      puts sprintf("#{k}%#{spaces}d", v)
    end
  end
  puts
  puts "Total time taken: #{aftertime - beforetime} seconds"
  puts '----------------------------------------------------------------------'

  puts
end
