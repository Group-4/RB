class ChangeSolutionTypeInPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :solved, 'integer USING CAST(solved AS integer)'
  end
end
