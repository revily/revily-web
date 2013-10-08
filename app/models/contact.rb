class Contact
  include Model

  belongs_to :user
  collection_path "users/:user_id/contacts"
end
