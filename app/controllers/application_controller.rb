class ApplicationController < ActionController::API
  before_action :authenticate_user!, unless: :devise_controller?

  def authenticate_user!
    token = request.headers["Authorization"]&.split(" ")&.last # concept call each function to extract the actual token

    if token.nil?
      return render json: {
        error: "Not Authenticated"
      },
      status: 401
    end

    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: "HS256")
      @current_user = User.find(decoded[0]["sub"])
    rescue JWT::DecodeError
      render json: {
        error: "Invalid Token"
      },
      status: 401
    end

    def current_user
      @current_user
    end
  end
end
