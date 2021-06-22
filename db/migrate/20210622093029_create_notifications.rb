class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.text :content
      t.string :type
      t.boolean :read
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
