class CreateCompliments < ActiveRecord::Migration
  def change
    create_table :compliments do |t|
      t.string :compliment
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
