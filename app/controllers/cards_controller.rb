class CardsController < ApplicationController
  #respond_to :html

  def index
    @cards = Card.all
    #respond_with(@cards)
  end
end
