class ChangeCitytoCitextinListings < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    change_column :listings, :city, :citext
    change_column :listings, :state, :citext
  end
end
