class Contact
  include Revily::Model

  belongs_to :user
  collection_path "users/:user_id/contacts"
end
