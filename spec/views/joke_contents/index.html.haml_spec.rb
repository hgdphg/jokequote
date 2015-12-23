require 'rails_helper'

RSpec.describe "joke_contents/index", :type => :view do
  before(:each) do
    assign(:joke_contents, [
      JokeContent.create!(
        :title => "Title",
        :content => "MyText",
        :like_count => 1,
        :dislike_count => 2
      ),
      JokeContent.create!(
        :title => "Title",
        :content => "MyText",
        :like_count => 1,
        :dislike_count => 2
      )
    ])
  end

  it "renders a list of joke_contents" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
