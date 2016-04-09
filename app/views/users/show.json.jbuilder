# utilizar jbuilder para traer el -user- solo con el ID y nombre
# sin telefono
json.(@user, :id, :name, :phone)