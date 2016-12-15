class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.text :image_url
      t.float :latitude
      t.float :longitude
      t.float :price
      t.integer :accomodation

      t.timestamps
    end
  end
end
