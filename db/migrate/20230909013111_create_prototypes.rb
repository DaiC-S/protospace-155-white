class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :prototype_name, null: false
      t.string :catchphrase, null: false
      t.text :concept, null: false
      t.timestamps
    end
  end
end
