class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :rate, index: true
      t.references :post, index: true
      t.references :topic, index: true

      t.references :rateable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :ratings, :rates
    add_foreign_key :ratings, :posts
    add_foreign_key :ratings, :topics
  end
end
