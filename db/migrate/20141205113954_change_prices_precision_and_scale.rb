class ChangePricesPrecisionAndScale < ActiveRecord::Migration
  def up
    remove_column :revenues, :price
    remove_column :patrimonies, :price
    add_column :revenues, :price, :decimal
    add_column :patrimonies, :price, :decimal
  end

  def down
    remove_column :revenues, :price
    remove_column :patrimonies, :price
    add_column :revenues, :price, :decimal, precision: 10, scale: 2
    add_column :patrimonies, :price, :decimal, precision: 10, scale: 2
  end
end
