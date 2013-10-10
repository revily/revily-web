class HooksController < ApplicationController
  respond_to :html

  before_action :authenticate!
  before_action :hooks

  # GET /hooks
  def index
    @hooks = hooks.fetch

    respond_with @hooks
  end

  # GET /hooks/1
  def show
    @hook = hooks.find(params[:id])

    respond_with @hook
  end

  # GET /hooks/new
  def new
    @hook = hooks.build

    respond_with @hook
  end

  # POST /hooks
  def create
    @hook = hooks.build(hook_params)

    if @hook.save
      respond_with @hook, notice: 'Hook was successfully created.'
    else
      render action: 'new'
    end
  end
  
  # GET /hooks/1/edit
  def edit
    @hook = hooks.find(params[:id])

    respond_with @hook
  end

  # PATCH/PUT /hooks/1
  def update
    @hook = hooks.find(params[:id])

    if @hook.update(hook_params)
      respond_with @hook, notice: 'Hook was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /hooks/1
  def destroy
    @hook = hooks.find(params[:id])

    @hook.destroy
    respond_with @hook, notice: 'Hook was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def hooks
      @hooks = Hook.all
    end

    # Only allow a trusted parameter "white list" through.
    def hook_params
      params.permit(:name, :config, :events)
    end
end
