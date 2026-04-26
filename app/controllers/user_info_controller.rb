class UserInfoController < ApplicationController
  allow_unauthenticated_access

  def index
  end

  def recipe
    @recipe_id = params[:id]
  end

  def view_acc
    # Action for viewing account
  end
end
