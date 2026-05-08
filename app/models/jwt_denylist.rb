class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
  self.JwtDenylist = "jwt_denylists"
end
