class DeleteMovieIdFromCharacters < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :movie_id
  end
end
