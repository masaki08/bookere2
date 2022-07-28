class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])

     if @users.update(users_params)
     flash[:notice] ="successfully"
     redirect_to user_path(@users.id)

    else
     render :edit
    end
  end

  def index
   @users = User.all
   @user = current_user
  end

private

  def users_params
    params.require(:user).permit(:name, :image, :introducrion)
  end
end
