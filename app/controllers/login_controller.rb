class LoginController < ApplicationController
  respond_to :json
  def login
    @users=OhrmUser.login(params[:user_name],params[:password])
    respond_with(@users.add_time)
  end
  #def query
  #  @users=OhrmAttendanceRecord.query(params[:emp_id])
   # respond_with(@users.to_s)
  #end
end