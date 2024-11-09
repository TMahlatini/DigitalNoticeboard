class AddFieldsToUser < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      t.string :provider
      t.string :uid
    end
  end
end
