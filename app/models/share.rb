class Share < ApplicationRecord
  

  def to_param
    ticker
  end

end
