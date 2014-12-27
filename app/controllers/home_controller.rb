class HomeController < ApplicationController
  def index
  	#@things = current_user.things
  	@users = User.all
  end
end
