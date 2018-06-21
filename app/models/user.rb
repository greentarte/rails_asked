class User < ActiveRecord::Base
  has_secure_password
  #bycrpt 사용
end
