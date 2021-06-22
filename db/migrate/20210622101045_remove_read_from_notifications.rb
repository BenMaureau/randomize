class RemoveReadFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :read, :boolean
  end
end
