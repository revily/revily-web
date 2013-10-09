class User
  include Model

  attributes :name, :email
  
  has_many :contacts
end
