class AddDetailsStickerNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :sticker_notes, :requested_date, :date
    add_column :sticker_notes, :requesting_ride, :boolean
    add_column :sticker_notes, :location_request, :string

  end
end
