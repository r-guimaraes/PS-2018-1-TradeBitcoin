class User < ActiveRecord::Base
  has_one :client
  accepts_nested_attributes_for :client
end
