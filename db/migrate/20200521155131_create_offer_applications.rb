class CreateOfferApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_applications do |t|
    	t.references :user, foreign_key: true
    	t.references :offer, foreign_key: true
    	t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
