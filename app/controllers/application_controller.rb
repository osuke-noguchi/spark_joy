class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :name,
        :gender,
        :age
        ])
  end

  def after_sign_in_path_for(resource)
    case resource
        when Admin
           admins_root_path
         when User
            items_path
        end
  end
     # ログアウト後に遷移するページ
  def after_sign_out_path_for(resource_or_root)
       root_path
  end
end
