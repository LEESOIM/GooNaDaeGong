package com.gndg.home.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gndg.home.util.OrderPager;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	public List<PayDTO> getList(OrderPager orderPager)throws Exception{
		Long totalCount = payDAO.getListCount(orderPager);
		orderPager.getNum(totalCount);
		orderPager.getRowNum();
		return payDAO.getList(orderPager);
	}

	public int addPay(PayDTO payDTO)throws Exception{
		return payDAO.addPay(payDTO);
	}
}
