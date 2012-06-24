class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.string :name
      t.string :email
      t.string :location
      t.string :jobtype
      t.text :description
      t.references :user
      t.timestamps
    end
    add_index:quotations, [:user_id,:created_at]
  end
end
