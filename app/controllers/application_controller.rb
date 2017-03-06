class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  ApplicationNotAuthenticated = Class.new(StandardError)

  rescue_from ApplicationNotAuthenticated do
    respond_to do |format|
      format.json { render json: { errors: [message: "401 Not Authorized"] }, status: 401 }
      format.html do
        flash[:notice] = "Not Authorized to access this page, plese log in"
        redirect_to new_session_path
      end
      format.any { head 401 }
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |format|
      format.json { render json: { errors: [message: "401 Not Authorized"] }, status: 401 }
      format.html do
        redirect_to shows_path
      end
      format.any { head 401 }
    end
  end

  def sanitize_filename(filename)
    return filename.gsub!(/[^0-9A-Za-z.\-]/, '_')
  end

  def authentication_required!
    session[:current_user] || raise(ApplicationNotAuthenticated)
  end
end
