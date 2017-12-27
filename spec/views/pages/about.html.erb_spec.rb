require 'rails_helper'

RSpec.describe "pages/about.html.erb" do
  it 'displays about page content' do
    render
    expect(rendered).to have_content("Being healthy doesn't excite me. If it did, I'd probably be content cooking something different every night.")
  end
end
