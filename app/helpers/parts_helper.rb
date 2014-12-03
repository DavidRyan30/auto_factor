module PartsHelper

  def make_current_cart (cart)
    cookies.permanent[:cart_token] = cart.cart_token
    self.current_cart = cart
  end

  def current_cart=(cart)
    @current_cart = cart
  end

  def current_cart
    if @current_cart.nil?
      @current_cart =
          Cart.find_by_cart_token(cookies[:cart_token])
    end
    @current_cart
  end
end
