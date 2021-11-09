require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      date_created: "Date Created",
      date_updated: "Date Updated",
      type: "Type",
      image: "Image",
      text: "Text",
      user_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Date Created/)
    expect(rendered).to match(/Date Updated/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/2/)
  end
end
