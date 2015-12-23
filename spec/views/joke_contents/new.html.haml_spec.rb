require 'rails_helper'

RSpec.describe "joke_contents/new", :type => :view do
  before(:each) do
    assign(:joke_content, JokeContent.new(
      :title => "MyString",
      :content => "MyText",
      :like_count => 1,
      :dislike_count => 1
    ))
  end

  it "renders new joke_content form" do
    render

    assert_select "form[action=?][method=?]", joke_contents_path, "post" do

      assert_select "input#joke_content_title[name=?]", "joke_content[title]"

      assert_select "textarea#joke_content_content[name=?]", "joke_content[content]"

      assert_select "input#joke_content_like_count[name=?]", "joke_content[like_count]"

      assert_select "input#joke_content_dislike_count[name=?]", "joke_content[dislike_count]"
    end
  end
end
