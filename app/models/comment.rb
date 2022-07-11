class Comment < ApplicationRecord
  belongs_to :author_id, class_name: "User"
  belongs_to :post_id, class_name: "Post"
end
