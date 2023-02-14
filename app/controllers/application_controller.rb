class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #configure_permitted_parametersが記述してあるDeviseコントローラーで作動

  private

  def after_sign_in_path_for(resource)
    public_user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  def configure_permitted_parameters #新規登録の際にnameカラムを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  

end
