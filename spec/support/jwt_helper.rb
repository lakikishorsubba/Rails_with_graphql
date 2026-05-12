module JwtHelper
  def generate_token(user)
    JWT.encode({ sub: user.id, exp: 24.hours.from_now.to_i }, Rails.application.credentials.secret_key_base, "HS256") # 3 arguement passed
  end
end
