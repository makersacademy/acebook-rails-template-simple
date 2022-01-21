class HomeController < ApplicationController

  before_action :cannot_go_home

  def index
  end
end