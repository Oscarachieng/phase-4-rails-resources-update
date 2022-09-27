class AddLikeToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :likes, :integer
  end
end
