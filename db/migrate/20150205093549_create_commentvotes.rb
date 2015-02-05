class CreateCommentvotes < ActiveRecord::Migration

  def change
    create_table :commentvotes do |v|
      v.integer :votecount, default: 0
      v.integer :user_id
      v.integer :comment_id

      v.timestamps null: false
    end
  end

end
