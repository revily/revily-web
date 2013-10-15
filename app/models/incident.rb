class Incident
  include Model

  attributes :message, :description, :details, :key

  belongs_to :service
  belongs_to :current_user, class_name: "User"
  # belongs_to :current_policy_rule, class_name: "PolicyRule"

  validates :message, presence: true

  resource_path "incidents/:id"

  def current_user
    @current_user ||= User.new self.attribute(:current_user)
  end

  def current_policy_rule
    @current_policy_rule ||= PolicyRule.new self.attribute(:current_policy_rule)
  end

  # after_find do |incident|
    # incident.service.fetch
  # end

end