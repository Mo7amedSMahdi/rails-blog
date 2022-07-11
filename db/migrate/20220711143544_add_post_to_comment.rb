class AddPostToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post_id, foreign_key: {to_table: :posts}, index: true
  end
end
