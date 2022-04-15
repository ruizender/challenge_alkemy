class CreateCharacterMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :character_movies do |t|
      t.references :character, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
