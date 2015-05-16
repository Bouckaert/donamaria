class AddCpfAndPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cpf, :string
    add_column :users, :phone, :string
  end
end
