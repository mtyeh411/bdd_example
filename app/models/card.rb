class Card < ActiveRecord::Base
  # attr_accessible :title, :body
 
  validates :value, :inclusion => { :in => ['2'..'10']|['J','Q','K','A']}

  validates :suit, :inclusion => { :in => ['hearts', 'spades', 'clubs', 'diamonds'] }

  belongs_to :deck

  def even? 
    (self.value.to_i % 2) == 0
  end

  def dealable?
    self.deck.shuffled?
  end
end
