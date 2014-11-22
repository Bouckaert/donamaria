class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :occupation
      t.string :gender
      t.string :voter_registration

      t.references :user

      t.timestamps
    end
  end
end
