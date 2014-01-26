class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
before_filter :fetch_user, :except => [:index, :create]
respond_to :json, :xml
 def fetch_user
    @user = User.find_by_id(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
    #@users = User.where("name = ? or email = ?", params[:name], params[:email])
    #respond_to do |format|
     # format.json { render json: @users }
      #format.xml { render xml: @users }
   # end
  end

  def show
    @user = User.find(params[:id])
    #respond_to do |format|
     # format.json { render json: @user }
      #format.xml { render xml: @user }
    #end
  end

  def new
    @user = User.new
  end
	
  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

	def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Panda Tutor!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :avatar)
    end

    # Before filters

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
