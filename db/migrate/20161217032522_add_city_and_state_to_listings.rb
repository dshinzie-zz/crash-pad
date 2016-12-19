class AddCityAndStateToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :city, :string
    add_column :listings, :state, :string
  end
end
