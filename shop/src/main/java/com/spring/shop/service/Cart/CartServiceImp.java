package com.spring.shop.service.Cart;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.Cart.CartDao;
import com.spring.shop.vo.Cart;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.Production;

@Service("CartService")
public class CartServiceImp implements CartService{
	@Inject
	CartDao cartDao;
	
	@Override
	public void addCart(List<Cart> cartlist) throws Exception{
		cartDao.addCart(cartlist);
	}
	
	@Override
	public List<Cart> getTotalCartList(String customer) throws Exception{
		return cartDao.getTotalCartList(customer);
	}
	
	@Override
	public List<Cart> getCartList(Paging paging) throws Exception{
		return cartDao.getCartList(paging);
	}
	
	@Override
	public int countCartList(String customer) throws Exception{
		return cartDao.countCartList(customer);
	}
	
	@Override
	public void deleteCart(Cart cart) throws Exception{
		cartDao.deleteCart(cart);
	}
	
	@Override
	public List<Production> getOptions(int pbno) throws Exception{
		return cartDao.getOptions(pbno);
	}
	
	@Override
	public void changeOption(Map<String, Object> map) throws Exception{
		cartDao.changeOption(map);
	}
}
