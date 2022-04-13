class CreateGenders < ActiveRecord::Migration[5.2]
  def change
    create_table :genders do |t|
      t.string :name
      t.string :image
      t.string :movie_id

      t.timestamps
    end
  end
end
