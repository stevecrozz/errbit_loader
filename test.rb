require 'pry'
require 'benchmark'
require 'typhoeus'
require 'dotenv'
require './lib/errbit_loader'

Dotenv.load('.env')

reports = []

reports << CreateNoticeTest.new(
  count: ENV['CREATE_NOTICES_COUNT'].to_i,
  concurrency: ENV['CREATE_NOTICES_CONCURRENCY'].to_i,
  host: ENV['ERRBIT_HOST'],
  key: ENV['ERRBIT_APP_KEY']
)


reports.each do |report|
  puts report.class.name
  puts '----------------------------------------------------------------------'

  report.run
  report.report.each do |k,v|
    spaces = 20 - k.length
    puts sprintf("#{k}%#{spaces}f", v)
  end
end
