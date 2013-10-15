class PolicyRulesController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :policy
  before_action :policy_rules

  def index
    @policy_rules = policy_rules.page(params[:page])

    respond_with @policy_rules
  end

  def show
    @policy_rule = policy_rules.find(params[:id])

    respond_with @policy_rule
  end

  def new
    @policy_rule = policy_rules.build

    respond_with @policy_rule
  end

  def create
    @policy_rule = policy_rules.build(policy_rule_params)
    @policy_rule.save

    respond_with @policy_rule
  end

  def edit
    @policy_rule = policy_rules.find(params[:id])

    respond_with @policy_rule
  end

  def update
    @policy_rule = policy_rules.find(params[:id])
    @policy_rule.update_attributes(policy_rule_params)

    respond_with @policy_rule
  end

  def destroy
    @policy_rule = policy_rules.find(params[:id])
    @policy_rule.destroy

    respond_with @policy_rule
  end

  private

  def policy
    @policy = Policy.find(params[:policy_id]) if params[:policy_id]
  end

  def policy_rules
    @policy_rules = @policy.policy_rules
  end
end
