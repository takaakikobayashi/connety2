class AddColumnOfferApplications < ActiveRecord::Migration[5.2]
  def change
  	add_column :offer_applications, :offer_application_status, :integer, default: 0, null: false
  end
end
