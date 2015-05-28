class CreatePromissories < ActiveRecord::Migration
  def change
    create_table :promissories do |t|
      t.references :proposal, index: true
      t.references :user, index: true
      t.integer :installment
      t.decimal :amount
      t.integer :expiration_day

      t.timestamps
    end
  end
end
