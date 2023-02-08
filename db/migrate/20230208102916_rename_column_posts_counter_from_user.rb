class RenameColumnPostsCounterFromUser < ActiveRecord::Migration[7.0]
  def change
    rename_column(:users, :posts_ounter, :posts_counter)
  end
end
