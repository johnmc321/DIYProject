class AddFieldnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :quotation_id, :integer
  end
end
