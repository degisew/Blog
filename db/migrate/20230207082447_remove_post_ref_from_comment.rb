class RemovePostRefFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :posts, null: false, foreign_key: true
  end
end
