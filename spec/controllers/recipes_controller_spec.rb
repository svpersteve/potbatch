require 'rails_helper'

RSpec.describe RecipesController do
  describe_action :new do
    subject(:request) { get :new }

    it 'initialises a new recipe' do
      request
      expect(assigns(:recipe)).to be_a(Recipe)
    end
  end

  describe_action :create do
    let(:recipe) { double(:recipe) }
    let(:recipe_params) {
      {
        title: 'Beef stew'
      }
    }

    subject(:request) { post :create, params: { recipe: recipe_params } }

    before do
      allow(Recipe).to receive(:new).and_return(recipe)
      allow(recipe).to receive(:save)
    end

    context 'when the recipe is valid' do
      before do
        allow(recipe).to receive(:save).and_return(true)
      end

      it 'redirects to the recipe' do
        request
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end

    context "when the recipe isn't valid" do
      before do
        allow(recipe).to receive(:save).and_return(false)
        allow(recipe).to receive_message_chain(:errors, :full_messages, :join).with(', ').and_return('Error message')
      end

      it 'renders the new template' do
        request
        expect(response).to render_template(:new)
      end

      it 'flashes the error message to the user' do
        request
        expect(flash.now[:alert]).to eq('Error message')
      end
    end
  end

  describe_action :index do
    let(:recipes) { double(:recipes) }

    subject(:request) { get :index }

    before do
      allow(Recipe).to receive(:all).and_return(recipes)
    end

    it 'finds all recipes' do
      request
      expect(assigns(:recipes)).to eql(recipes)
    end
  end

  describe_action :show do
    let(:recipe) { double(:recipe) }

    subject(:request) { get :show, params: { id: 'beef-stew' } }

    before do
      allow(Recipe).to receive(:find).with('beef-stew').and_return(recipe)
    end

    it 'assigns the recipe' do
      request
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe_action :edit do
    let(:recipe) { double(:recipe) }

    subject(:request) { get :edit, params: { id: 'beef-stew' } }

    before do
      allow(Recipe).to receive(:find).with('beef-stew').and_return(recipe)
    end

    it 'assigns the recipe' do
      request
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe_action :update do
    let(:recipe) { double(:recipe) }
    let(:recipe_params) {
      {
        title: 'Beef stew'
      }
    }

    subject(:request) { put :update, params: { id: 'beef-stew', recipe: recipe_params } }

    before do
      allow(Recipe).to receive(:find).with('beef-stew').and_return(recipe)
      allow(recipe).to receive(:update_attributes).and_return(true)
    end

    it 'assigns the recipe' do
      request
      expect(assigns(:recipe)).to eq(recipe)
    end

    context 'when the update is successful' do
      before do
        allow(recipe).to receive(:update_attributes).and_return(true)
      end

      it 'redirects to the recipe' do
        request
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end

    context 'when the update fails' do
      before do
        allow(recipe).to receive(:update_attributes).and_return(false)
        allow(recipe).to receive_message_chain(:errors, :full_messages, :join).with(', ').and_return('Error message')
      end

      it 'renders the edit view' do
        request
        expect(response).to render_template(:edit)
      end
    end
  end
end
