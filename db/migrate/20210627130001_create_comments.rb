class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :description
      t.belongs_to :user, null: true, foreign_key: true
      t.belongs_to :character, null: true, foreign_key: true

      t.timestamps
    end
  end
end
