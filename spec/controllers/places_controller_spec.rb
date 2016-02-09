require 'rails_helper'

RSpec.describe PlacesController, type: :controller do

  describe "GET #index" do
    it "assigns @places" do
      all_places = Place.all
      get :index
      expect(assigns(:places)).to eq(all_places)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end
