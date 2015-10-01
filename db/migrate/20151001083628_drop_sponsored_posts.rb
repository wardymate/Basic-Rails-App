class DropSponsoredPosts < ActiveRecord::Migration
  def up
    drop_table :sponsored_posts
  end

  def down
    create_table :sponsored_posts do |t|
      t.string   "title"
      t.text     "body"
      t.integer  "price"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "topic_id"  
    end
    add_index :tablenames, :anothertable_id
  end
end
