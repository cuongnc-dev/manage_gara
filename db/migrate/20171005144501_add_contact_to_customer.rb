class AddContactToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :contact, :string
  end
end
