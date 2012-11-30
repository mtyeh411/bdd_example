class AddSuitToCard < ActiveRecord::Migration
  def change
    add_column :cards, :suit, :string
  end
end
