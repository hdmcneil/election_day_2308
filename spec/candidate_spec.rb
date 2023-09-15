require './lib/candidate'
require 'pry'

RSpec.describe Candidate do
  before :each do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end
  
  it '#initializes' do
    expect(@diana.name).to eq("Diana D")
    expect(@diana.party).to eq(:democrat)
    expect(@diana.votes).to eq(0)
  end

  it 'can count votes' do
    @diana.vote_for!
    @diana.vote_for!
    @diana.vote_for!

    expect(@diana.votes).to eq(3)

    @diana.vote_for!

    expect(@diana.votes).to eq(4)
  end
end