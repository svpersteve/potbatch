require 'rails_helper'

RSpec.describe "recipes/index.html.erb" do
  let(:recipes) { [recipe] }
  let(:recipe)  { double(:recipe, title: 'Beef stew', image_url: 'image-url.com') }

  before do
    assign(:recipes, recipes)
    allow(view).to receive(:image_tag).with(recipe.image_url).and_return('image-url.com')
    allow(view).to receive(:instant_pot_link).and_return('instant-pot-amazon-link')
  end

  it 'introduces the page' do
    render
    expect(rendered).to have_content('Effortless nutrition every day')
  end

  it 'displays an instant pot referral link' do
    render
    expect(rendered).to have_link('Instant Pot', href: 'instant-pot-amazon-link')
  end

  it 'displays an image for each recipe' do
    render
    expect(rendered).to have_content('image-url.com')
  end

  it 'displays a link to each recipe' do
    render
    expect(rendered).to have_link('Beef stew', href: recipe_path(recipe))
  end

  it 'displays the title of each recipe' do
    render
    expect(rendered).to have_content('Beef stew')
  end
end
