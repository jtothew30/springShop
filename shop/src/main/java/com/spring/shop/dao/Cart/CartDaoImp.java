package com.spring.shop.dao.Cart;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Cart;
import com.spring.shop.vo.Production;

@Repository
public class CartDaoImp implements CartDao {
	@Inject
	SqlSession sqlSession;
	
	private final static String CartMapper = "com.spring.shop.mapper.CartMapper";
	
	@Override
	public void addCart(List<Cart> cartlist) {
		
		for(Cart cart : cartlist) {
			sqlSession.insert(CartMapper+".insert", cart);
		}	
		System.out.println("cart insert success");
	}
	
	@Override
	public List<Cart> getCartList(String customer){
		System.out.println("daoimp getCartList 진입 check");
		List<Cart> cartlist = sqlSession.selectList(CartMapper+".getCartList", customer);
		System.out.println("daoimp getCartList check : " + cartlist.size());
		return cartlist;
	}
	
	@Override
	public void deleteCart(Cart cart) {
		sqlSession.delete(CartMapper+".deleteCart", cart);
		System.out.println("cart delete success");
	}
	
	@Override
	public List<Production> getOptions(int pbno){
		List<Production> prolist = sqlSession.selectList(CartMapper+".getOptions", pbno);
		return prolist;
	}
	
	@Override
	public void changeOption(Map<String, Object> map) {
		sqlSession.update(CartMapper+".changeOption", map);
		System.out.println("cart changeOption success");
	}
}
