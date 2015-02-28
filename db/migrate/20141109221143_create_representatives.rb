class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :name
      t.string :occupation
      t.string :gender
      t.string :voter_registration
      t.string :mcn_id
      t.string :type

      t.references :user

      t.timestamps
    end
  end
end
