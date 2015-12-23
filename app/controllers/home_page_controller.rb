class HomePageController < ApplicationController
  def index
    @joke_content = JokeContent.first
  end

end
