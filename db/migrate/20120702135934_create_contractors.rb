class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :email
      t.string :jobtype
      t.string :location

      t.timestamps
    end
  end
end
