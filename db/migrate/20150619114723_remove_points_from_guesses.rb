class RemovePointsFromGuesses < ActiveRecord::Migration
  def up
  	remove_column :guesses, :points, :integer
  end

  def down
  	add_column :guesses, :points
  end
end
