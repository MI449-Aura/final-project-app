class UserInfosController < ApplicationController
  allow_unauthenticated_access

  def index
  end

  def new
    @user_info = UserInfo.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user_info = UserInfo.new(username: @user.email_address)
      @user_info.save
      redirect_to new_session_path, notice: "Account created successfully. Please log in."
    else
      render "user_info/create-acc", status: :unprocessable_entity
    end
  end

  def show
    @user_info = UserInfo.find(params[:id])
  end

  def edit
    @user_info = UserInfo.find(params[:id])
  end

  def update
    @user_info = UserInfo.find(params[:id])
    if @user_info.update(user_info_params)
      redirect_to @user_info, notice: "User info updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @user_info = UserInfo.find(params[:id])
    @user_info.destroy
    redirect_to user_infos_path, notice: "User info deleted successfully."
  end
  def add_favorite
    if Current.user
      user_info = UserInfo.find_by(username: Current.user.email_address)
      if user_info
        user_info.recipes ||= []
        recipe_id = params[:recipe_id].to_i
        unless user_info.recipes.include?(recipe_id)
          user_info.recipes << recipe_id
          user_info.save
        end
        render json: { success: true, recipes: user_info.recipes }
      else
        render json: { error: "User info not found" }, status: :not_found
      end
    else
      render json: { error: "Not authenticated" }, status: :unauthorized
    end
  end
  private

  def user_params
    params.permit(:email_address, :password, :password_confirmation)
  end

  def user_info_params
    params.permit(:recipes, :username)  # Adjust based on your fields
  end
end
