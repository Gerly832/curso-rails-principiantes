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
      redirect_to products_path, notice: 'Tu producto se ha creado correctamente'
      else
        render :new, status: :unprocessable_entity #Permite renderizar
      end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path, notice: 'Su producto se ha actualizado correctamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Su producto ha sido eliminado', status: :see_other

  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
