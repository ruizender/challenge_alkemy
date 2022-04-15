class DeleteCharactersIdFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :character_id
  end
end
