class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :women_candidates
      t.integer :men_candidates
      t.integer :women_elected
      t.integer :men_elected
      t.decimal :women_patrimony
      t.decimal :men_patrimony
      t.decimal :women_revenue
      t.decimal :men_revenue

      t.timestamps
    end
  end
end
