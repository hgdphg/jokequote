require 'rails_helper'

RSpec.describe "joke_contents/edit", :type => :view do
  before(:each) do
    @joke_content = assign(:joke_content, JokeContent.create!(
      :title => "MyString",
      :content => "MyText",
      :like_count => 1,
      :dislike_count => 1
    ))
  end

  it "renders the edit joke_content form" do
    render

    assert_select "form[action=?][method=?]", joke_content_path(@joke_content), "post" do

      assert_select "input#joke_content_title[name=?]", "joke_content[title]"

      assert_select "textarea#joke_content_content[name=?]", "joke_content[content]"

      assert_select "input#joke_content_like_count[name=?]", "joke_content[like_count]"

      assert_select "input#joke_content_dislike_count[name=?]", "joke_content[dislike_count]"
    end
  end
end
