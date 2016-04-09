# utilizar jbuilder para traer el arreglo de -user-
# con los datos requeridos: nombre y telefono sin ID
json.array!(@users) do |user|
  json.(user, :name, :phone)
end