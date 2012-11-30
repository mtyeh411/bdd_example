require 'spec_helper'

describe "cards/index" do
  before(:each) do
    assign(:cards, [
      stub_model(Card),
      stub_model(Card)
    ])
  end

  it "renders a list of cards" do
    render
    rendered.should have_selector('.card')
  end
end
