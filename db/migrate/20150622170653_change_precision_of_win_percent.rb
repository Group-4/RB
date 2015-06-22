class ChangePrecisionOfWinPercent < ActiveRecord::Migration
  def change
  	change_column :users, :win_percent, :float, :precision => 4, :scale => 1
  end
end
