require 'pry'
require 'benchmark'
require 'typhoeus'
require 'dotenv'
require 'json'
require './lib/errbit_loader'

Dotenv.load('.env')

results = {
  creates: [],
  searches: []
}

run_report = ->(report){
  report.prepare

  beforetime = Time.now
  report.run
  aftertime = Time.now

  report.report.merge(
    name: report.class.name,
    concurrency: report.concurrency,
    count: report.count,
    total_time: aftertime - beforetime
  )
}

run_create = ->(){
  CreateNoticesTest.new(
    count: ENV['CREATE_NOTICES_COUNT'].to_i,
    concurrency: ENV['CREATE_NOTICES_CONCURRENCY'].to_i,
    host: ENV['ERRBIT_HOST'],
    key: ENV['ERRBIT_APP_KEY']
  )
}

run_search = ->(){
  SearchNoticesTest.new(
    count: ENV['SEARCH_NOTICES_COUNT'].to_i,
    concurrency: ENV['SEARCH_NOTICES_CONCURRENCY'].to_i,
    host: ENV['ERRBIT_HOST'],
    username: ENV['ERRBIT_USERNAME'],
    password: ENV['ERRBIT_PASSWORD']
  )
}

100.times do |count|
  puts "Run #{count + 1}"
  # results[:creates] << run_report.call(run_create.call)
  # results[:searches] << run_report.call(run_search.call)
  # File.write("results/#{count}.json", JSON.pretty_generate(results))

  creates = run_report.call(run_create.call)
  searches = run_report.call(run_search.call)
  File.write("results/#{count + 1}.json", JSON.pretty_generate({
    creates: creates,
    searches: searches
  }))
end
