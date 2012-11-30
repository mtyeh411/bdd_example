require 'spec_helper'

describe CardsController do
  it do
    get('/cards').should route_to('cards#index')
  end 
end
