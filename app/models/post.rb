class Post < ActiveRecord::Base
  # VO
  # user에 post가 속한다.
  belongs_to :user
end
