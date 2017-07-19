class MinimumSpreadReader

  def self.read(*args)
    new(*args).read
  end

  def initialize(path:, regex:)
    @file = File.new(path, "r")
    @regex = regex
    @spread = {}
  end

  def read
    while(line = file.gets)
      if(@matched_line = line.match(regex))
        calculate_spread
      end
    end
    file.close
    min_spread
  end

  private

  attr_reader :file, :matched_line, :spread, :regex

  def min_spread
    spread.select{ |key, value| value == spread.values.min }.to_a.flatten
  end

  def calculate_spread
    key = matched_line[:key]
    first = matched_line[:first].to_i
    second = matched_line[:second].to_i
    spread[key] = (first - second).abs
  end

end
