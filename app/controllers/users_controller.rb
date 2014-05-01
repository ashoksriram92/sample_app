class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	id = Integer(params[:id])
  	@user = User.new
  	if id <= User.count
  		@user = User.find(params[:id])
  	end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
	  flash[:success] = "Profile updated"
      redirect_to @user
	else
	  render 'edit'
    end

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
