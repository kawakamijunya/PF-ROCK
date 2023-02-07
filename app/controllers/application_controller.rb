class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]

  private

  def after_sign_in_path_for(resource)
    public_user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
