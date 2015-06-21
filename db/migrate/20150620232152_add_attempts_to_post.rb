class AddAttemptsToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :attempts, :integer, default: 0
  end
end
