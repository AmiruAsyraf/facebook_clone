class CreateComments < ActiveRecord::Migration

  def change
    create_table :comments do |c|
      c.string :content
      c.integer :user_id
      c.integer :post_id

      c.timestamps null: false
    end
  end

end
