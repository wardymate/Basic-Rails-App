require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:new_user_attributes) do
    {
        name: "Bloc Head",
        email: "blochead@bloc.io",
        password: "blochead",
        password_confirmation: "blochead"
    }
  end
  describe "GET new" do
   it "returns http success" do
     get :new
     expect(response).to have_http_status(:success)
   end

   it "instantiates a new user" do
     get :new
     expect(:user).to_not be_nil
   end
 end

 describe "POST create" do
   it "returns http success" do
     post :create, user: new_user_attributes
     expect(response).to have_http_status(:redirect)
   end

# #4
   it "creates a new user" do
     expect{
       post :create, user: new_user_attributes
     }.to change(User, :count).by(1)
   end

# #5
   it "sets user name properly" do
     post :create, user: new_user_attributes
     expect(assigns(:user).name).to eq new_user_attributes[:name]
   end

# #6
   it "sets user email properly" do
     post :create, user: new_user_attributes
     expect(assigns(:user).email).to eq new_user_attributes[:email]
   end

# #7
   it "sets user password properly" do
     post :create, user: new_user_attributes
     expect(assigns(:user).password).to eq new_user_attributes[:password]
   end

# #8
   it "sets user password_confirmation properly" do
     post :create, user: new_user_attributes
     expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
   end

    it "logs the user in after sign up" do
      post :create, user: new_user_attributes
      expect(session[:user_id]).to eq assigns(:user).id
    end
  end

  describe "not signed in" do
    #1
    let(:factory_user) { create(:user) }

    before do
      post :create, user: new_user_attributes
    end
    #2
    it "returns http success" do
      get :show, {id: factory_user.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: factory_user.id}
      expect(response).to render_template :show
    end

    it "assigns factory_user to @user" do
      get :show, {id: factory_user.id}
      expect(assigns(:user)).to eq(factory_user)
    end
  end
end
