class RemovePostRefFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :posts, null: false, foreign_key: true
  end
end
