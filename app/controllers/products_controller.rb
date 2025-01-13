#Modelo -> Realiza consultas, validaciones y relaciones.
#Vista -> Devuelve al usuario ya sea HTML, PDF, CSV o JSON.
#Controlador -> lleva consigo la lógica.

class ProductsController < ActionController::Base 
  #ActionController es el controlador base donde 
  #heredan todos los demás controladores.

  def index #Definición de Metodo.
    @products = Product.all
  end

  def show #Definición de Metodo
    @product = Product.find(params[:id])
  end 

end 