class Incident
  include Revily::Model

  attributes :message, :description, :details, :key

  belongs_to :service
  belongs_to :current_user, class_name: "User"
  belongs_to :current_policy_rule, class_name: "PolicyRule"

  validates :message, presence: true

  resource_path "incidents/:id"
end