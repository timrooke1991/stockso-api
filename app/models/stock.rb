class Stock < ApplicationRecord
  has_many :posts

  def to_param
    ticker
  end

end
