class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.date :creation_date
      t.integer :score, default: 1
      t.string :character_id

      t.timestamps
    end
  end
end
