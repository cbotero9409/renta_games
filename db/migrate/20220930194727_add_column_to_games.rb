class AddColumnToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :photo, :string
  end
end
