class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.boolean :indoor
      t.string :category
      t.integer :price_per_head
      t.string :instructions
      t.string :contact_email
      t.string :contact_phone_number
      t.string :activity_url
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end
