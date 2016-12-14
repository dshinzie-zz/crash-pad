class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    create_table :users do |t|
      t.citext :email
      t.string :phone
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.text :api_key
      t.string :avatar_url
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
