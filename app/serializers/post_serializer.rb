class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :sentiment, :holder, :share_id, :user_id
end
