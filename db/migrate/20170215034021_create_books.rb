class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.belongs_to :user, foreign_key: true
      t.string :item_url
      t.string :provider

      t.timestamps
    end
  end
end
