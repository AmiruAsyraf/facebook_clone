class CreatePosts < ActiveRecord::Migration

  def change
    create_table :posts do |p|
      p.string :title
      p.string :body
      p.integer :user_id

      p.timestamps null: false
    end
  end

end
