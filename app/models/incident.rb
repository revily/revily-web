class Incident
  include Model

  belongs_to :service
  
  resource_path "incidents/:id"
end
