class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.string :street
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
