#Modelo -> Realiza consultas, validaciones y relaciones.
#Vista -> Devuelve al usuario ya sea HTML, PDF, CSV o JSON.
#Controlador -> lleva consigo la lógica.

class ProductsController < ApplicationController
  #ActionController es el controlador base donde 
  #heredan todos los demás controladores.

  def index #Definición de Metodo.
    @products = Product.all.with_attached_photo
  end

  def show #Definición de Metodo
    product
  end 

  def new
    @product = Product.new
  end

  #Página creación | Añadir producto
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = t('.created')
      redirect_to @product #Esto redirige a la página del producto recién creado
      else
        render :new, status: :unprocessable_entity #Permite renderizar
      end
  end

  def edit
    product
  end

  def update

    if product.update(product_params)
      flash[:notice] = t('.updated')
      redirect_to @product 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: t('.destroyed'), status: :see_other
  end

  #Crea la variable y devuelve el producto
  def product
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo)
  end
end
