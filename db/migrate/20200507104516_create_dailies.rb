class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.text :note, null: false
      t.timestamps
    end
    add_reference :dailies, :user, foreign_key: true
  end
end
