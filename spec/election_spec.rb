require './lib/race'
require './lib/candidate'
require './lib/election'
require 'pry'

RSpec.describe Election do
  before :each do
    @election1 = Election.new("2024")
  end

  it 'initalizes' do
    expect(@election1).to be_an_instance_of(Election)
    expect(@election1.year).to eq("2024")
    expect(@election1.race).to eq([])

    @election1.add_race("Governor")

    expect(@election1.race).to eq(["Governor"])

    @election1.add_race("Secretary of State")
    @election1.add_race("State Treasurer")

    expect(@election1.race).to eq(["Governor", "Secretary of State", "State Treasurer"])

    @election1.add_candidates("Governor", {name: "Bob Ross", party: :democrat})

    @election1.add_candidates("Governor", {name: "Oscar the Grouch", party: :republican})

    @election1.add_candidates("Governor", {name: "Scrooge McDuck", party: :republican})

    @election1.add_candidates("Secretary of State", {name: "Eeyore Wood", party: :democrat})

    @election1.add_candidates("Secretary of State", {name: "Yosemite Sam", party: :independent})

    expect(@election1.candidates).to eq([{:race=>"Governor", :candidates=>{:name=>"Bob Ross", :party=>:democrat}},
    {:race=>"Governor", :candidates=>{:name=>"Oscar the Grouch", :party=>:republican}},
    {:race=>"Governor", :candidates=>{:name=>"Scrooge McDuck", :party=>:republican}},
    {:race=>"Secretary of State", :candidates=>{:name=>"Eeyore Wood", :party=>:democrat}},
    {:race=>"Secretary of State", :candidates=>{:name=>"Yosemite Sam", :party=>:independent}}])

    @election1.vote("Yosemite Sam")
    @election1.vote("Bob Ross")
    @election1.vote("Bob Ross")
    @election1.vote("Eeyore Wood")
    @election1.vote("Scrooge McDuck")
    @election1.vote("Scrooge McDuck")
    @election1.vote("Oscar the Grouch")

    expect(@election1.vote_counts).to eq({"Yosemite Sam"=>1, "Bob Ross"=>2, "Eeyore Wood"=>1, "Scrooge McDuck"=>2, "Oscar the Grouch"=>1})
  end

end