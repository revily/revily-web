class Service
  include Revily::Model
  
  has_many :incidents

  attributes :name
end
