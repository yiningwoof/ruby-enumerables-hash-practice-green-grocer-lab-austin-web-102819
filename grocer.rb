def consolidate_cart(cart)
  new_cart = cart.uniq
  new_cart_hash = {}
  for i in 0...new_cart.length do
    count = cart.count{|item| item == new_cart[i]}
    new_cart[i].values[0][:count] = count
    new_cart_hash[new_cart[i].keys[0]] = new_cart[i].values[0]
  end
  new_cart_hash
end

def apply_coupons(cart, coupons)
  for i in 0...coupons.length do
    name = coupons[i][:item]
    if (cart.keys.include?(name)) && (cart[name][:count] >= coupons[i][:num])
      cart[name][:count] -= coupons[i][:num]
      if cart.keys.include?("#{name} W/COUPON")
        cart["#{name} W/COUPON"][:count] += coupons[i][:num]
      else
        cart["#{name} W/COUPON"] = {}
        cart["#{name} W/COUPON"][:count] = coupons[i][:num]
        cart["#{name} W/COUPON"][:price] = coupons[i][:cost]/coupons[i][:num]
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end
      # if cart[name][:count] == 0
      #   cart.delete(name)
      # end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each{|k, v| v[:price] *= 0.8 if v[:clearance] == true}
  cart
end

def checkout(cart, coupons)
  # code here
end
