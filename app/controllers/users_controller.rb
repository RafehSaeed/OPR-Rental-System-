class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :check_admin,   only: [:create]

@@visitingList = Array.new

  def new
  @user = User.new 
  end




  def edit
  	@user = User.find(params[:id])

  end

  def showproperties

    @user = current_user
    @property = current_user.properties
  end

  def update

    @user = User.find(params[:id])
 if @user.update_attributes(user_params)
  flash[:success]="Profile Updated"
  redirect_to @user
      # Handle a successful update.
    else
      render 'edit'


  end

end

  def show
  	  @user = User.find(params[:id])
  end

    def addtovisitinlist

    @@visitingList << params[:property]

    @list = @@visitingList.uniq




    end

  def create
  	 @user = User.new(user_params)    # Not the final implementation!

    if @user.save
    	
   	 flash[:success] = "Registeration Successful!"
      redirect_to @user
    else
      render 'new'
    end

  end

  	private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:usertype)
    end

     # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def check_admin
      return current_user =="admin"
    end




end
