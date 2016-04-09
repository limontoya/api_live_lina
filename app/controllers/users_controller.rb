class UsersController < ApplicationController
  # crear un nuevo usuario:
  def create
    user = User.new(params[:user])
    if user.save
      render json: {status: "Se ha creado el usuario"}, status: :ok
    else
      # el estatus :unprocessable_entity es el error #422
      render json: {status: "Error creando el usuario", errors: user.errors}, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end
end
