class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.string :thumbnail
      t.string :urls
      t.string :comics
      t.string :events
      t.string :series
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
