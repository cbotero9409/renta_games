class AddColumnToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :description, :text
  end
end
