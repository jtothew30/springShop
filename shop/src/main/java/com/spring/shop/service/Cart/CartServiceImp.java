package com.spring.shop.service.Cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Cart.CartDao;
import com.spring.shop.vo.Cart;

@Service("CartService")
public class CartServiceImp implements CartService{
	@Inject
	CartDao cartDao;
	
	@Override
	public void addCart(List<Cart> cartlist) throws Exception{
		cartDao.addCart(cartlist);
	}
	
	@Override
	public List<Cart> getCartList(String customer) throws Exception{
		return cartDao.getCartList(customer);
	}
	
	@Override
	public void deleteCart(Cart cart) throws Exception{
		cartDao.deleteCart(cart);
	}
}
