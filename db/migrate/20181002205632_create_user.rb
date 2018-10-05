class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
    end
  end
end
