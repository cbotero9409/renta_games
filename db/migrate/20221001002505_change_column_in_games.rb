class ChangeColumnInGames < ActiveRecord::Migration[7.0]
  def change
    change_column :games, :available, :boolean, default: true
  end
end
