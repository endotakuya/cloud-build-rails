class User < ApplicationRecord
  def adult?
    age >= 20
  end
end
