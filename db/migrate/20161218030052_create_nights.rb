class CreateNights < ActiveRecord::Migration[5.0]
  def change
    create_table :nights do |t|
      t.date :date
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
