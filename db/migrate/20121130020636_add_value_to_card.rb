class AddValueToCard < ActiveRecord::Migration
  def change
    add_column :cards, :value, :string
  end
end
