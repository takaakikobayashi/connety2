class RenameOfferAplicationColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
  	rename_column :notifications, :offer_application_id, :offer_id
  end
end
