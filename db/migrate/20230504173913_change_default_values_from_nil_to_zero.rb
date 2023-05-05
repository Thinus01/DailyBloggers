class ChangeDefaultValuesFromNilToZero < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :comments_counter, to: 0
    change_column_default :posts, :likes_counter, to: 0
    change_column_default :users, :posts_counter, to: 0
  end
end
