class ChangeWinToFloat < ActiveRecord::Migration
  def change
  	change_column :users, :win_percent, :float, default:0.0
  end
end
