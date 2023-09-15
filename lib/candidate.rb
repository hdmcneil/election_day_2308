require 'pry'

class Candidate
  attr_reader :info,
              :name,
              :party,
              :votes

  def initialize(info)
    # binding.pry
    @info = info
      @name = info[:name]
      @party = info[:party]
    @votes = 0
    end

    def vote_for!
      @votes += 1
    end
end