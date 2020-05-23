class CreateOfferApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_applications do |t|

      t.timestamps
    end
  end
end
