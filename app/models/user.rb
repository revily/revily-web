class User
  include Revily::Model

  attributes :name, :email
  
  has_many :contacts
end
