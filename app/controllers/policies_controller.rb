class PoliciesController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :policies

  # GET /policies
  def index
    @policies = policies.fetch

    respond_with @policies
  end

  # GET /policies/1
  def show
    @policy = policies.find(params[:id])

    respond_with @policy
  end

  # GET /policies/new
  def new
    @policy = policies.build

    respond_with @policy
  end

  # POST /policies
  def create
    @policy = policies.build(policy_params)

    if @policy.save
      respond_with @policy, notice: 'Policy was successfully created.'
    else
      render action: 'new'
    end
  end
  
  # GET /policies/1/edit
  def edit
    @policy = policies.find(params[:id])

    respond_with @policy
  end

  # PATCH/PUT /policies/1
  def update
    @policy = policies.find(params[:id])

    if @policy.update(policy_params)
      respond_with @policy, notice: 'Policy was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /policies/1
  def destroy
    @policy = policies.find(params[:id])

    @policy.destroy
    respond_with @policy, notice: 'Policy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def policies
      @policies = Policy.all
    end

    # Only allow a trusted parameter "white list" through.
    def policy_params
      params.permit(:name, :loop_limit)
    end
end
