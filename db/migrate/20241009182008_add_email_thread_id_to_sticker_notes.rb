class AddEmailThreadIdToStickerNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :sticker_notes, :email_thread_id, :string
  end
end
