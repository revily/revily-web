class PolicyRule
  include Revily::Model

  belongs_to :policy
  collection_path "policies/:policy_id/policy_rules"
end
