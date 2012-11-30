require 'spec_helper'

describe Card do
  subject { FactoryGirl.build(:card)}
  let(:attrs) { FactoryGirl.attributes_for(:card)}

  it "exists" do
    should_not be_nil
  end

  its(:value) { should == 'A'}
  its(:suit) { should == 'spades'}

  it "validates the allowed values of 'value'" do
    should ensure_inclusion_of(:value).in_array(['2'..'10']|['J','Q','K','A'])
  end

  it "validates the allowed values of 'suit'" do
    should ensure_inclusion_of(:suit).in_array(['hearts', 'spades', 'clubs', 'diamonds']) 
  end

  it { should belong_to(:deck)}

  context "is a two of hearts" do
    subject { FactoryGirl.build(:card, value:"2", suit:"hearts")}  
    
    it { should be_even }
  end

  context "is a part of a Deck" do
    before :each do
      deck = mock_model(Deck)
      subject.deck = deck
      deck.stub(:shuffled?) { is_shuffled }
    end   

    describe "that is shuffled" do
      let(:is_shuffled) { true }
      it { should be_dealable }
    end

    describe "that is not shuffled" do 
      let(:is_shuffled) { false }
      it { should_not be_dealable }
    end
  end
end
