class Session
  attr_reader :auth_token, :id

  def initialize(attrs={})
    @auth_token = attrs[:auth_token]
    @id         = attrs[:id] 
  end

  def self.authenticate(email, password)
    return unless email && password
    auth_hash = Revily::Web.api.post("/users/sign_in", { email: email, password: password }).body[:data]
    return unless auth_hash && auth_hash[:auth_token]
    
    new(auth_hash)
  end

end