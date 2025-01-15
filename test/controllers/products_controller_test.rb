require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
      get products_path

      assert_response :success
      assert_select '.product', 2
    end

    test 'render a detailed product page' do
      get product_path(products:play5)

      assert_responde :success
      assert_select '.title', 'Consola PlayStation 5'
      assert_select '.description', 'Color: Blanco, Capacidad: 1 TB, Memoria RAM: 26 GB, Edición: Standard'
      assert_select '.price', '2650000'
    end

    #Página New
    test 'render a new product form' do
        get new_product_path

        assert_responde :success
        assert_select 'form'
    end

    #Página Create | Añadir producto
    test 'allow to create a new product' do
      post products_path, params: {
        product: {
          title: '1',
          description: '2',
          price: 3
        }
      }

      assert_redirected_to product_path
      assert_equal flash[:notice], 'Tu producto se ha creado correctamente'

    end

    #Página Update
    test 'allow to update a product' do
      patch products_path(products(:play5)), params: {
        product: {
          price: 2400000
        }
      }

      assert_redirected_to product_path
      assert_equal flash[:notice], 'Tu producto se ha actualizado correctamente'
    end
        #Página Update 2
        test 'does not allow to update a product with an invalid field' do
          patch products_path(products(:play5)), params: {
            product: {
              price: nil #Nil declarar la ausencia de valor
            }
          }
    
          assert_redirected_to product_path
          assert_equal flash[:notice], 'Tu producto se ha actualizado correctamente'
        end


    test 'does not allow to create a new product with empty fields' do
      post products_path, params: {
        product: {
          title: '',
          description: 'hola',
          price: 3
        }
      }

      assert_response :unprocessable_entity
    end

    test 'render an edit product form' do
      get edit_product_path(products(:play5))

      assert_responde :success
      assert_select 'form'
  end

  test 'can delete products' do
    assert_difference('Product.count' -1) do 
    delete product_path(products(:play5))
  end

  assert_redirect_to products_path
  assert_equal flash[:notice], 'Tu producto ha sido eliminado exitosamente'
  end 
end
