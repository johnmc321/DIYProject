class AddColumnToQuotations < ActiveRecord::Migration
  def change
    add_column :quotations, :contractor_id, :int
  end
end
