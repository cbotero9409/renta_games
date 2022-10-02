class DeleteColumnFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :available
  end
end
