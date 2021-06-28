class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.boolean :like_status
      t.belongs_to :user, null: true, foreign_key: true
      t.belongs_to :character, null: true, foreign_key: true

      t.timestamps
    end
  end
end
