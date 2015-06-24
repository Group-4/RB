class RemovePointsFromGuesses < ActiveRecord::Migration
  def change
  	remove_column :guesses, :points, :integer
  end
end
