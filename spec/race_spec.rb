require './lib/candidate'
require './lib/race'
require 'pry'

RSpec.describe Race do
  before :each do
    @race = Race.new("Texas Governor")
    
  end
  it '#initializes' do
  expect(@race.office).to eq("Texas Governor")
  expect(@race.candidates).to eq([])

  @candidate1_info = {name: "Diana D", party: :democrat}
  @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})

  expect(@candidate1.class).to be(Candidate)
  expect(@candidate1.name).to eq("Diana D")
  expect(@candidate1.party).to eq(:democrat)

  @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

  expect(@race.candidates).to eq([{name: "Diana D", party: :democrat},{name: "Roberto R", party: :republican}])
  end
end