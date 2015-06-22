class AddTimesSolvedToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :times_solved, :integer, default:0
  end
end
