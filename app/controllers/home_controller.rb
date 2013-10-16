class HomeController < ApplicationController
  def index
    redirect_to ong_initiatives_path(ong)
  end
end
