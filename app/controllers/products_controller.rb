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
      flash[:notice] = 'Tu producto se ha creado correctamente'
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
      redirect_to @product, notice: 'Su producto se ha actualizado correctamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: 'Tu producto ha sido eliminado exitosamente', status: :see_other
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
