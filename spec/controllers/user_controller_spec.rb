require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    let!(:signed_in_user) { FactoryGirl.create(:user) }

    before do
      # stub a method on ApplicationController
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(signed_in_user)
    end

    describe "GET #index" do
      it "assigns @users" do
        all_users = User.last(24)
        get :index
        expect(assigns(:users)).to eq(all_users)
      end

      it "renders the :index view" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET #new" do
      it "assigns @user" do
        get :new
        expect(assigns(:user)).to be_instance_of(User)
      end

      it "renders the :new view" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      context "success" do
        it "adds new upvote to current_user" do
          users_count = User.count
          post :create, user: {password: "testtest", first_name: 'Jon', last_name: 'Snow',
            email: 'email2@email.email', userName: 'user2Name'
}
          expect(users_count).to eq(users_count + 1)
        end

        # it "redirects to 'user_path' after successful create" do
        #   post :create, article: {title: "blah", content: "blah"}
        #   expect(response.status).to be(302)
        #   expect(response.location).to match(/\/articles\/\d+/)
        # end
      end

    #   context "failure" do
    #     it "redirects to 'new_article_path' when create fails" do
    #       # create blank article (assumes validations are set up in article model for presence of title and content)
    #       post :create, article: { title: nil, content: nil}
    #       expect(response).to redirect_to(new_article_path)
    #     end
    #   end
    # end
  end
end