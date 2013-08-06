class AddVariablesToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :name, :string
    add_column :usuarios, :email_address, :string
    add_column :usuarios, :password, :string
    add_column :usuarios, :password_confirmation, :string
    add_column :usuarios, :password_digest, :string
    add_column :usuarios, :remember_token, :string
  end
end
