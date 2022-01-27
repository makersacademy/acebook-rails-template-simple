class HomeController < ApplicationController

  before_action :cannot_go_home

  layout "home"

  def index
  end
end