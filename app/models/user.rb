class User < ActiveRecord::Base
  has_many :phonebooks
end
