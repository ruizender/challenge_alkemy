class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.integer :weight
      t.string :history
      t.string :movie_id

      t.timestamps
    end
  end
end
