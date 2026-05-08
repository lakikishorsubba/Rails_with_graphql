class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def sign_up(resource_name, resource)
  end
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: "User created successfully",
        user: {
          id: resource.id,
          email: resource.email
        }
      },
      status: :ok
    else
      render json: {
        error: resource.errors.full_messages
      },
      status: :unprocessable_entity
    end
  end
end
