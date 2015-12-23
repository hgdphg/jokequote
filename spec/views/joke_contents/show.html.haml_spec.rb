require 'rails_helper'

RSpec.describe "joke_contents/show", :type => :view do
  before(:each) do
    @joke_content = assign(:joke_content, JokeContent.create!(
      :title => "Title",
      :content => "MyText",
      :like_count => 1,
      :dislike_count => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
