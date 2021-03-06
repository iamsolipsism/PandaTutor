module Api
  module V1
    class LoginController < ApplicationController
#sampleLogin: http://localhost:3000/api/v1/login.json?email=SuperKawaiiDesu&password=MamiTomoe
   before_filter :fetch_user, :except => [:index, :create]
  respond_to :json, :xml
  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

 def fetch_user
    @user = User.find_by_id(params[:id])
  end

  def index
  @user= User.find_by_email(params[:email])
if(@user != nil)
  validLogin = @user.authenticate(params[:password])
if(validLogin)
  respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
  end
  else
    respond_to do |format|
      format.json { render json: "{\"error\": fail}" }
      format.xml { render xml: "{\"error\": fail}" }
    end
  end
else
respond_to do |format|
      format.json { render json: "{\"error\": fail}" }
      format.xml { render xml: "{\"error\": fail}" }
end
end
end
end
end
end
