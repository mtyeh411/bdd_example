require 'spec_helper'

describe CardsController do
  context "GET index" do
    let!(:card) { FactoryGirl.create(:card)  }

    before :each do
      get :index
    end

    it { should render_template(:index)}

    it { should respond_with(:success)}

    it { expect(assigns(:cards)).to eq([card]) }
  end
end
