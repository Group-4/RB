class AddSolvedByToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :solved_by, :string
  end
end
