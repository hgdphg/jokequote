class User < ActiveRecord::Base
  has_many :joke_contents, dependent: :destroy

  has_secure_password
end
