class CreatePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.date :date
      t.date :due_date
      t.references :inning, foreign_key: true
    end
  end
end
