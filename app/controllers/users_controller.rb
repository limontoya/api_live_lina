class UsersController < ApplicationController

  # muestra todos los usuarios: GET /users.json
  def index
    @users = User.all
    # render json:
  end

  # muestra un usuario: GET /users/1.json
  def show
    @user = User.find(params[:id])
  end


  # crear un nuevo usuario: POST /users/ con los parametros y nuevos datos
  def create
    user = User.new(user_params)
    if user.save
      render json: {status: "Se ha creado el usuario"}, status: :ok
    else
      # el estatus :unprocessable_entity es el error #422
      render json: {status: "Error creando el usuario", errors: user.errors}, status: :unprocessable_entity
    end
  end

  # eliminar un usuario
  def delete
    user = User.find(params[:id])
    if user.delete
      render json: {status: "Se ha eliminado el usuario"}, status: :ok
    else
      render json: {status: "Error eliminando el usuario", errors: user.errors}, status: :unprocessable_entity
    end
  end

  # actualizar un usuario
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {status: "Se ha actualizado el usuario"}, status: :ok
    else
      render json: {status: "Error actualizando el usuario", errors: user.errors}, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end

end
