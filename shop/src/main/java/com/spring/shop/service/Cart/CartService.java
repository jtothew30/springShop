package com.spring.shop.service.Cart;

import java.util.List;

import com.spring.shop.vo.Cart;

public interface CartService {
	public void addCart(List<Cart> cartlist) throws Exception;
	public List<Cart> getCartList(String customer) throws Exception;
	public void deleteCart(Cart cart) throws Exception;
}