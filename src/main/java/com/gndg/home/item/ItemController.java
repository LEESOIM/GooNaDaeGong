package com.gndg.home.item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gndg.home.cart.CartDTO;
import com.gndg.home.cart.CartService;
import com.gndg.home.member.MemberDTO;
import com.gndg.home.util.Category;
import com.gndg.home.util.Pager;

@Controller
@RequestMapping("/item/*")
public class ItemController {

	@Autowired
	private ItemService itemService;
	@Autowired
	private CartService cartService;
	
	//카트중복
	@RequestMapping(value="dulCart", method = RequestMethod.POST)
	@ResponseBody
	public Long getDulCart(CartDTO cartDTO,HttpSession session)throws Exception{
	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	    cartDTO.setUser_id(memberDTO.getUser_id());
	    Long result = cartService.getDulCart(cartDTO);
	    
	    return result;
	}
	
    //카트 추가  
    @RequestMapping(value="AddCart", method = RequestMethod.POST)
    @ResponseBody
    public int setAddCart(CartDTO cartDTO, HttpSession session)throws Exception{
        MemberDTO member =  (MemberDTO)session.getAttribute("member");
        cartDTO.setUser_id(member.getUser_id());
        int result = cartService.setAddCart(cartDTO);
        
        return result;
    }
	
	/* HTML, CSS 테스트 */
	@GetMapping("add2")
	public String add2() throws Exception {
		System.out.println("add2 GET"); 
		
		return "item/add2";
	} 
	
	@GetMapping("update2")
	public String update2() throws Exception {
		System.out.println("add2 GET"); 
		
		return "item/update2";
	} 
	
	/* 통합 검색 */
	@GetMapping("search")
	public String getSearch() throws Exception {
		
		return "/item/list";
	}
	
	@PostMapping("search")
	public String getSearch(String search, Model model, ItemDTO itemDTO) throws Exception {
		List<ItemDTO> ar = itemService.getSearch(search);
		
		model.addAttribute("list", ar);	
		
		System.out.println("검색어 : " + search);
		
		return "/item/list";
	}
	

	//카테고리 불러오기
	@GetMapping("category")
	@ResponseBody
	public List<Category> getCategory() throws Exception {
		return itemService.getCategory();
	}

	//상품 등록
	@GetMapping("add")
	public String setAdd() throws Exception {
		return "/item/add";
	}

	@PostMapping("add")
	public ModelAndView setAdd(ItemDTO itemDTO, MultipartFile[] files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		itemDTO.setUser_id(memberDTO.getUser_id());
		int result = itemService.setAdd(itemDTO, files, session.getServletContext());
		String message = "등록실패";
		if (result > 0) {
			message = "등록되었습니다.";
		}
		mv.addObject("message", message);
		mv.addObject("url", "list?cate_num="+itemDTO.getCate_num());
		mv.setViewName("common/result");
		return mv;
	}

	//상품 리스트 조회
	@GetMapping("list")
	public ModelAndView getList(ItemDTO itemDTO,Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ItemDTO> ar = itemService.getList(itemDTO,pager);
		
		//좋아요수
		ArrayList<Long> counts = new ArrayList<Long>();
		for(int i=0; i<ar.size(); i++) {
			ItemLikeDTO itemLikeDTO = new ItemLikeDTO();
			itemLikeDTO.setItem_num(ar.get(i).getItem_num());
			Long count = itemService.getLikeItem(itemLikeDTO);
			counts.add(count);
		}
		
		Long total =  itemService.getTotal(itemDTO);
		
		mv.addObject("total", total);
		
		mv.addObject("list", ar);
		mv.addObject("count", counts);
		mv.addObject("cate_num", itemDTO.getCate_num());
		mv.setViewName("item/list");
		return mv;
	}

	//상품 상세페이지 조회
	@GetMapping("detail")
	public ModelAndView getDetail(@RequestParam("item_num")Long item_num, ItemDTO itemDTO, HttpServletRequest request, HttpSession session) throws Exception {
	    ModelAndView mv = new ModelAndView();
	    //장바구니
	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	    itemDTO.setUser_id(memberDTO.getUser_id());
	    mv.addObject("cart", itemDTO);
	    
		itemDTO = itemService.getDetail(itemDTO);
		mv.addObject("dto", itemDTO);

		//json
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(itemDTO);
		mv.addObject("json", json);
		
		//해당 상품 좋아요 컬러
		ItemLikeDTO itemLikeDTO = new ItemLikeDTO();
		itemLikeDTO.setItem_num(itemDTO.getItem_num());
		itemLikeDTO.setUser_id(itemDTO.getUser_id());
		itemLikeDTO = itemService.getLikeUser(itemLikeDTO);
		mv.addObject("like", itemLikeDTO);
				
		mv.setViewName("item/detail");
		
		session = request.getSession();
		
		/* 최근 본 상품 넣기 */
		List<Long> ar = (List<Long>)session.getAttribute("product");	
		
		if(ar == null) {
			ar = new ArrayList<Long>();
			session.setAttribute("product", ar);
		} 
			
		ar.add(item_num);
		
		Set<Long> set = new HashSet<Long>(ar);
		
		List<Long> newAr = new ArrayList<Long>(set);	
				
		/* 최근 본 상품 가져오기 */
		List<ItemFileDTO> productList = new ArrayList<ItemFileDTO>();
		
		for(Long l : newAr) {
			List<ItemFileDTO> productListdetail = itemService.getProduct(l);
			
			if (productListdetail.size()!= 0) {
				productList.add(productListdetail.get(0));
			}
			
		}
		
		
		session.setAttribute("productList", productList);
		
		mv.addObject("productList", productList);
		
		
		return mv;
	}

	//상품 수정
	@GetMapping("update")
	public ModelAndView setUpdate(ItemDTO itemDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		itemDTO = itemService.getDetail(itemDTO);
		mv.addObject("dto", itemDTO);
		mv.setViewName("item/update");
		
		System.out.println(itemDTO.getItem_contents());
		
		return mv;
	}

	@PostMapping("update")
	public String setUpdate(ItemDTO itemDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = itemService.setUpdate(itemDTO, files, session.getServletContext());
		
		return "redirect:detail?item_num=" + itemDTO.getItem_num();
	}

	//상품 수정할때 이미지파일 삭제
	@PostMapping("fileDelete")
	@ResponseBody
	public int setFileDelete(ItemFileDTO itemFileDTO, HttpSession session) throws Exception {
		int result = itemService.setFileDelete(itemFileDTO, session.getServletContext());
		return result;
	}
	
	//상품 삭제
	@GetMapping("delete")
	public String setDelete(ItemDTO itemDTO) throws Exception {
		int result = itemService.setDelete(itemDTO);
		return "redirect:list";
	}

	
	//좋아요 등록&취소
	@PostMapping("like")
	@ResponseBody
	public int setLike(ItemLikeDTO itemLikeDTO) throws Exception {
		int result = 0;
		ItemLikeDTO likeDTO = itemService.getLikeUser(itemLikeDTO);
		if(likeDTO == null) {
			return itemService.setLikeAdd(itemLikeDTO);
		}else {
			itemService.setLikeDelete(itemLikeDTO);
		}
		return result;
	}
	
	//상품당 좋아요수 조회
	@GetMapping("likeCount")
	@ResponseBody
	public Long getLikeItem(ItemLikeDTO itemLikeDTO) throws Exception {
		Long count = itemService.getLikeItem(itemLikeDTO);
		return count;
	}
	
	//후기 등록
	@PostMapping("review")
	@ResponseBody
	public int setReviewAdd(ItemReviewDTO itemReviewDTO, HttpSession session) throws Exception {
		return itemService.setReviewAdd(itemReviewDTO, session.getServletContext());
	}
	
	//후기 조회
	@GetMapping("reviewList")
	@ResponseBody
	public Map<String, Object> getReview(Pager pager, ItemReviewDTO itemReviewDTO) throws Exception {
		List<ItemReviewDTO> ar = itemService.getReview(pager, itemReviewDTO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ar);
		map.put("pager", pager);
		return map;
	}

	//후기 수정
	@PostMapping("reviewUpdate")
	@ResponseBody
	public String setReviewUpdate(ItemReviewDTO itemReviewDTO, HttpSession session) throws Exception {
		int result = itemService.setReviewUpdate(itemReviewDTO, session.getServletContext());
		return "redirect:detail?item_num=" + itemReviewDTO.getItem_num();
	}
	
	
	//상품 삭제
	@PostMapping("reviewDelete")
	@ResponseBody
	public int setReviewDelete(ItemReviewDTO itemReviewDTO) throws Exception {
		return itemService.setReviewDelete(itemReviewDTO);
	}
	
	
	//후기수
	@GetMapping("reviewCount")
	@ResponseBody
	public Long getReviewCount(ItemReviewDTO itemReviewDTO) throws Exception {
		Long count = itemService.getReviewCount(itemReviewDTO);
		return count;
	}
}
