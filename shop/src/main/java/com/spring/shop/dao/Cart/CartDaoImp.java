package com.spring.shop.dao.Cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.Cart;

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
}
