class OhrmUsersController < ApplicationController
       respond_to :json
	def index
         @user=OhrmUser.compare(params[:user_name])
	  respond_with(@user)
	end
end
