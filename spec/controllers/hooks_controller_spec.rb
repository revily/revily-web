# require 'spec_helper'

# describe HooksController do

#   # This should return the minimal set of attributes required to create a valid
#   # Hook. As you add validations to Hook, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) { {  } }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # HooksController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all hooks as @hooks" do
#       hook = Hook.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:hooks).should eq([hook])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested hook as @hook" do
#       hook = Hook.create! valid_attributes
#       get :show, {:id => hook.to_param}, valid_session
#       assigns(:hook).should eq(hook)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new hook as @hook" do
#       get :new, {}, valid_session
#       assigns(:hook).should be_a_new(Hook)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested hook as @hook" do
#       hook = Hook.create! valid_attributes
#       get :edit, {:id => hook.to_param}, valid_session
#       assigns(:hook).should eq(hook)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Hook" do
#         expect {
#           post :create, {:hook => valid_attributes}, valid_session
#         }.to change(Hook, :count).by(1)
#       end

#       it "assigns a newly created hook as @hook" do
#         post :create, {:hook => valid_attributes}, valid_session
#         assigns(:hook).should be_a(Hook)
#         assigns(:hook).should be_persisted
#       end

#       it "redirects to the created hook" do
#         post :create, {:hook => valid_attributes}, valid_session
#         response.should redirect_to(Hook.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved hook as @hook" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Hook.any_instance.stub(:save).and_return(false)
#         post :create, {:hook => {  }}, valid_session
#         assigns(:hook).should be_a_new(Hook)
#       end

#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         Hook.any_instance.stub(:save).and_return(false)
#         post :create, {:hook => {  }}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested hook" do
#         hook = Hook.create! valid_attributes
#         # Assuming there are no other hooks in the database, this
#         # specifies that the Hook created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         Hook.any_instance.should_receive(:update).with({ "these" => "params" })
#         put :update, {:id => hook.to_param, :hook => { "these" => "params" }}, valid_session
#       end

#       it "assigns the requested hook as @hook" do
#         hook = Hook.create! valid_attributes
#         put :update, {:id => hook.to_param, :hook => valid_attributes}, valid_session
#         assigns(:hook).should eq(hook)
#       end

#       it "redirects to the hook" do
#         hook = Hook.create! valid_attributes
#         put :update, {:id => hook.to_param, :hook => valid_attributes}, valid_session
#         response.should redirect_to(hook)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the hook as @hook" do
#         hook = Hook.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Hook.any_instance.stub(:save).and_return(false)
#         put :update, {:id => hook.to_param, :hook => {  }}, valid_session
#         assigns(:hook).should eq(hook)
#       end

#       it "re-renders the 'edit' template" do
#         hook = Hook.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         Hook.any_instance.stub(:save).and_return(false)
#         put :update, {:id => hook.to_param, :hook => {  }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested hook" do
#       hook = Hook.create! valid_attributes
#       expect {
#         delete :destroy, {:id => hook.to_param}, valid_session
#       }.to change(Hook, :count).by(-1)
#     end

#     it "redirects to the hooks list" do
#       hook = Hook.create! valid_attributes
#       delete :destroy, {:id => hook.to_param}, valid_session
#       response.should redirect_to(hooks_url)
#     end
#   end

# end
