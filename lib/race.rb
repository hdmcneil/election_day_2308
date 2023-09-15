require 'pry'

class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(info)
  
  candidate = Candidate.new(info)
  @candidates << info
  candidate
  end
end