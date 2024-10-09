class AddSenderEmailToStickerNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :sticker_notes, :sender_email, :string
  end
end
