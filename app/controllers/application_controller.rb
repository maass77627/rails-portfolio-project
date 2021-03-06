class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def load_book
    @book = Book.find(params[:id])
  end
  
  def load_review
    @review = Review.find(params[:id])
  end
  
  def load_user
    @user = User.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :admin?])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :admin?])
  end
  
  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end
  
end
