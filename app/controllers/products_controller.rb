#Modelo -> Realiza consultas, validaciones y relaciones.
#Vista -> Devuelve al usuario ya sea HTML, PDF, CSV o JSON.
#Controlador -> lleva consigo la lógica.

class ProductsController < ApplicationController
  #ActionController es el controlador base donde 
  #heredan todos los demás controladores.

  def index #Definición de Metodo.
    @products = Product.all
  end

  def show #Definición de Metodo
    @product = Product.find(params[:id])
  end 

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
      else
        render :new, status: :unprocessable_entity #Permite renderizar
      end
  end

private

def product_params
  params.require(:product).permit(:title, :description, :price)
  end
end
