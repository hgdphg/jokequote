class HomePageController < ApplicationController
  def index
    has_content_checks = cookies[:joke_content_has_checked] ? cookies[:joke_content_has_checked].split(",").map(&:to_i) : []

    if !has_content_checks.any?
      @joke_content = JokeContent.first
    else
      @joke_content = JokeContent.where('id NOT IN (?)',has_content_checks).first
    end
  end

end
