class CreatePostvotes < ActiveRecord::Migration

  def change
    create_table :postvotes do |v|
      v.integer :votecount, default: 0
      v.integer :user_id
      v.integer :post_id

      v.timestamps null: false
    end
  end

end
