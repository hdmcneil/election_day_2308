class Election
  attr_reader :year,
              :race,
              :candidates,
              :name,
              :count

  def initialize(year = " ")
    @year = year
    @race = []
    @candidates = []
    @vote_counts = Hash.new { |hash, key| hash[key] = 0 }
    
    

  end

  def new(year)
    election = Election.new(year)
    election
  end

  def year
    @year
  end

  def add_race(race)
    election = Election.new(year)
    @race << race
    election
  end

  def add_candidates(race, candidates)
    @candidates << { race: race, candidates: candidates }
    candidates
    
  end

  def candidates
    @candidates 
  end

  def vote(candidate)
    @vote_counts[candidate] += 1
    puts @vote_counts
  end

  def vote_counts
    @vote_counts
  end
end