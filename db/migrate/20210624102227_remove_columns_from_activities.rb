class RemoveColumnsFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :latitude, :string
    remove_column :activities, :longitude, :string
  end
end
