class AddStatsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :guess_count, :integer, default: 0 
  	add_column :users, :incorrect_count, :integer, default: 0
  	add_column :users, :correct_count, :integer, default: 0
  	add_column :users, :win_percent, :decimal, precision:5, scale:2, default: 0
  end
end
