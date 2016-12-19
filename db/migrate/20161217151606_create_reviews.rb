class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
