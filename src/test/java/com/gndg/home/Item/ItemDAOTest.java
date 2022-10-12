package com.gndg.home.Item;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.gndg.home.AbstractTest;
import com.gndg.home.Item.ItemDTO;
import com.gndg.home.Item.ItemReviewDTO;
import com.gndg.home.gnItem.GnItemDTO;
import com.gndg.home.util.Category;

public class ItemDAOTest extends AbstractTest {

	@Autowired
	public ItemDAO ItemDAO;
	
	//@Test
	public void getCategoryTest() throws Exception {
		List<Category> ar = ItemDAO.getCategory();
		assertEquals(153, ar.size());
	}
	
	//@Test
	public void setAddTest() throws Exception {
		
		for(int i=1; i<60; i++) {
			GnItemDTO ItemDTO = new ItemDTO();
			ItemDTO.setCate_num("1234");
			ItemDTO.setUser_id("11");
			ItemDTO.setItem_title("아이폰"+i+" Pro Max");
			ItemDTO.setItem_contents("상품내용");
			ItemDTO.setItem_price(10000000L+i);
			int result = ItemDAO.setAdd(ItemDTO);
		}
		System.out.println("Finish");
	}
	
	//@Test
	public void setAddFileTest() throws Exception {
		ItemFileDTO ItemFileDTO = new ItemFileDTO();
		ItemFileDTO.setFileNum(4L);
		ItemFileDTO.setItem_num(83L);
		ItemFileDTO.setFileName("123456789_img2.jpg");
		ItemFileDTO.setOriName("img2.jpg");
		int result = ItemDAO.setAddFile(ItemFileDTO);
		assertEquals(1, result);
	}
	
	//@Test
	public void setUpdateTest() throws Exception {
		ItemDTO ItemDTO = new ItemDTO();
		ItemDTO.setCate_num("1234");
		ItemDTO.setItem_title("test");
		ItemDTO.setItem_contents("test");
		ItemDTO.setItem_price(1234L);
		ItemDTO.setItem_num(121L);
		int result = ItemDAO.setUpdate(ItemDTO);
		assertEquals(1, result);
	}
	
	@Test
	public void setDeleteTest() throws Exception {
		ItemDTO ItemDTO = new ItemDTO();
		ItemDTO.setItem_num(489L);
		int result = ItemDAO.setDelete(ItemDTO);
		assertEquals(1, result);
	}
	
//	===========용원 test 파일
   public void getReply() throws Exception {
        List<ItemReviewDTO> r = ItemDAO.getReply(261L);
        for(ItemReviewDTO rr: r) {
            
            System.out.println("ㅇㅈ : "  + rr.getRv_title());
            
        }
        assertNotNull(r);
    }
    

    public void getCategoryTest() throws Exception {
        List<Category> ar = ItemDAO.getCategory();
        for(Category ca : ar) {
            System.out.println("category : " + ca.getCate_name());
        }
        assertEquals(201, ar.size());
        
    }
	
}
