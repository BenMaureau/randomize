class RenameTypeColumnInNotifications < ActiveRecord::Migration[6.0]
  def change
    rename_column :notifications, :type, :category
  end
end
