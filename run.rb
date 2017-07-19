require_relative "minimum_spread_reader"

data_sources = [
  {
    path: "weather.dat",
    regex: /\s+(?<key>\d+)\s+(?<first>\d+)\s+(?<second>\d+)/
  },
  {
    path: "football.dat",
    regex: /\s+\d+\.\s(?<key>\w+)(.+?)(?<first>\d+)\s+\-\s+(?<second>\d+)/
  }
]

data_sources.each do |data_source|
  min_spread = MinimumSpreadReader.read(
    path: data_source[:path],
    regex: data_source[:regex]
  )
  puts "#{min_spread[0]} #{min_spread[1]}"
end
