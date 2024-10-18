class AddConfirmableToDevise < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      # These columns already exist, so we'll skip them
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at

      # This column doesn't exist yet, so we'll add it
      t.string   :unconfirmed_email unless column_exists?(:users, :unconfirmed_email)
    end

    # This index already exists, so we'll skip it
    # add_index :users, :confirmation_token, unique: true
  end
end
