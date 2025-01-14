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

    test 'render a new product form' do
        get new_product_path

        assert_responde :success
        assert_select 'form'
    end

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
  end
