class AddDateSentToStickerNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :sticker_notes, :date_sent, :datetime
  end
end
