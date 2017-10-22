class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :sentiment, :holder, :stock_id, :user_id
end
