class ChangeMappingOnStats < ActiveRecord::Migration
  def up
    change_column :stats, :mapping, :text
  end

  def down
    change_column :stats, :mapping, :string
  end
end
