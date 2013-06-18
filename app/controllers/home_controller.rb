class HomeController < ApplicationController
  def index
    s = Capybara::Session.new(:poltergeist)
    s.visit(params[:url])
    @cookies = s.driver.cookies
  end
end
