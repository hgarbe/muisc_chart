class AddBillboardRefToArtist < ActiveRecord::Migration[5.2]
  def change
    add_reference :artists, :billboard, foreign_key: true
  end
end
