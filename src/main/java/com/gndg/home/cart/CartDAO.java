package com.gndg.home.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.gndg.home.cart.CartDAO.";
	
	//카트 중복
	public Long getDulCart(CartDTO cartDTO)throws Exception{
	    return sqlSession.selectOne(NAMESPACE+"getDulCart", cartDTO);
	}
	
	//카트추가
	public int setAddCart(CartDTO cartDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddCart", cartDTO);
	}
	
	//카트목록
	public List<CartDTO> getItemList(CartDTO cartDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getItemList",cartDTO);
	}
	//카트 회원정보
	public CartDTO getMemberCart(CartDTO cartDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberCart", cartDTO);
	}
	//카트 수량 체크
	public Long getCountCart(CartDTO cartDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCountCart", cartDTO); 
	}
	
	//카트 수량 수정
	public int setUpdateCart(CartDTO cartDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdateCart", cartDTO);
	}
	
	//카트삭제
	public int setDeleteCart(CartDTO cartDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteCart", cartDTO);
	}
}
