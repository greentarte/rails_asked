class User < ActiveRecord::Base
  #bycrpt 사용
  has_secure_password
  # post model에 연결
  has_many :posts
end
