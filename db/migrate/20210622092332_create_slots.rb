class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.date :start_date
      t.date :end_date
      t.integer :max_number_of_people
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
