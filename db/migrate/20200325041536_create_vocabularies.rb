class CreateVocabularies < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabularies do |t|
      t.string :word, :null => false
      t.string :meaning, :null => false
      t.string :example
    end
    add_index :vocabularies, :word, unique: true
    add_reference :vocabularies, :user, foreign_key: true, unique: true
  end
end
