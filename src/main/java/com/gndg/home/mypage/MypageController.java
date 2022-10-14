package com.gndg.home.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gndg.home.item.ItemDTO;
import com.gndg.home.item.ItemLikeDTO;
import com.gndg.home.item.ItemReviewDTO;
import com.gndg.home.item.ItemService;
import com.gndg.home.member.MemberDTO;
import com.gndg.home.member.MemberFileDTO;
import com.gndg.home.member.MemberService;
import com.gndg.home.order.OrderDTO;
import com.gndg.home.orders.OrdersDTO;
import com.gndg.home.qna.QnaDTO;
import com.gndg.home.util.MypagePager;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ItemService ItemService;
	
	//test
	@RequestMapping(value="myLike")
	public ModelAndView myLike(MypagePager mypagePager,HttpSession session)throws Exception{
	    ModelAndView mv = new ModelAndView();
        MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
        mypagePager.setUser_id(memberDTO.getUser_id());
        List<ItemLikeDTO> al = mypageService.getMyLike(mypagePager);
        
        //해당 게시글 좋아요 컬러
//        ItemLikeDTO gnItemLikeDTO = new ItemLikeDTO();
//        ItemLikeDTO.setUser_id(mypagePager.getUser_id());
//        ItemLikeDTO = ItemService.getLikeUser(ItemLikeDTO);
//        mv.addObject("heart", gnItemLikeDTO);
//        
        mv.addObject("like", al);
        mv.addObject("pager", mypagePager);
        mv.setViewName("/mypage/myLike");
        return mv;
	}
	   //좋아요 등록&취소
    @PostMapping("heart")
    @ResponseBody
    public int setLike(ItemLikeDTO ItemLikeDTO) throws Exception {
        int result = 0;
        ItemLikeDTO likeDTO = ItemService.getLikeUser(ItemLikeDTO);
        if(likeDTO == null) {
            return ItemService.setLikeAdd(ItemLikeDTO);
        }else {
            ItemService.setLikeDelete(ItemLikeDTO);
        }
        return result;
    }
	
	//마이페이지 메인
	@RequestMapping(value="mypage")
	public String mypage()throws Exception{
		return "/mypage/mypage";
	}
	
	//내 찜목록
//	@RequestMapping(value="myHeart")
//	public ModelAndView myHeart(ItemLikeDTO ItemLikeDTO,HttpSession session)throws Exception{
//	    ModelAndView mv = new ModelAndView();
//	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//	    ItemLikeDTO.setUser_id(memberDTO.getUser_id());
//	    List<ItemLikeDTO> al = mypageService.getMyLike(ItemLikeDTO);
//	    
//	    mv.addObject("like", al);
//	    mv.setViewName("/mypage/myHeart");
//		return mv;
//	}
	
	//내 주문내역
	@RequestMapping(value="myOrder")
	public ModelAndView myOrder(MypagePager mypagePager, HttpSession session)throws Exception{
	    ModelAndView mv = new ModelAndView();
	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	    mypagePager.setUser_id(memberDTO.getUser_id());
	    
	    List<OrderDTO> al = mypageService.getMyOrder(mypagePager);
	    mv.addObject("order", al);
	    mv.addObject("pager", mypagePager);
	    mv.setViewName("/mypage/myOrder");
	    
		return mv;
	}
	
	//내 주문 상세내역
	@RequestMapping(value="myOrderDetail")
	public ModelAndView myOrderDetail(OrdersDTO ordersDTO,HttpSession session,ModelAndView mv)throws Exception{
	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	    ordersDTO.setUser_id(memberDTO.getUser_id());
	    ordersDTO = mypageService.getMyOrderDetail(ordersDTO);
	    
//	    System.out.println("파일 가져와지나 ===="+orderDTO.getGnItemFileDTOs().get(0).getFileName());
	    
	    mv.addObject("detail", ordersDTO);
	    mv.setViewName("/mypage/myOrderDetail");
	    return mv;
	}
	
	//내 QNA내역
	@RequestMapping(value="myQNA")
	public ModelAndView myQNA(MypagePager mypagePager, HttpSession session)throws Exception{
	        ModelAndView mv =new ModelAndView();
	        MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	        mypagePager.setUser_id(memberDTO.getUser_id());
	        List<QnaDTO> al = mypageService.getMyQna(mypagePager);
	        
	        mv.addObject("qna", al);
	        mv.addObject("pager", mypagePager);
	        mv.setViewName("/mypage/myQNA");
	    
		return mv;
	}
	
    //내 QNA삭제
    @RequestMapping(value="delmyQNA", method = RequestMethod.POST)
    @ResponseBody
    public int myQnaDelete(QnaDTO qnaDTO)throws Exception{
       int result = mypageService.setMyQnaDelete(qnaDTO);
       return result;
    }
	
	//내 후기내역
	@RequestMapping(value="myReview")
	public ModelAndView myReview(MypagePager mypagePager, HttpSession session)throws Exception{
	    ModelAndView mv = new ModelAndView();
	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	    mypagePager.setUser_id(memberDTO.getUser_id());
	    List<ItemReviewDTO> al = mypageService.getMyReview(mypagePager);
	    
	    for(int i=0; i<al.size(); i++) {
	        System.out.println(i+"번 째== "+al.get(i).getRv_title());
	        System.out.println(i+"번 째== "+al.get(i).getRv_contents());
	        System.out.println(i+"번 째== "+al.get(i).getRv_date());
	    }
	    
	    mv.addObject("review", al);   
	    mv.addObject("pager", mypagePager);   
	    mv.setViewName("/mypage/myReview");
	    
	    
		return mv;
	}
	
	//내 후기삭제
	@RequestMapping(value="delmyReview", method = RequestMethod.POST)
	@ResponseBody
	public int myReviewDelete(ItemReviewDTO itemReviewDTO)throws Exception{
	    int result = mypageService.setMyReviewDelete(itemReviewDTO);
	    return result;
	}
	
	//내 판매내역
	@RequestMapping(value="mySale")
	public ModelAndView mySale(ItemDTO ItemDTO,HttpSession session)throws Exception{
	    ModelAndView mv = new ModelAndView();
	    MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	    ItemDTO.setUser_id(memberDTO.getUser_id());
	    List<ItemDTO> al = mypageService.getMySale(ItemDTO);
	    
	    mv.addObject("sale", al);
	    mv.setViewName("/mypage/mySale");
	    
		return mv;
	}
	//회원정보 수정
   @RequestMapping(value="myUpdate")
    public ModelAndView myUpdate(HttpSession session)throws Exception{
       ModelAndView mv = new ModelAndView();
       MemberDTO memberDTO = new MemberDTO();
       System.out.println();
       
      MemberDTO memberDTO2 =  (MemberDTO)session.getAttribute("member");
       memberDTO.setUser_id(memberDTO2.getUser_id());
      System.out.println("개인정보 수정 아이딘== "+memberDTO.getUser_id());
     memberDTO =  mypageService.getMyInfo(memberDTO);
     System.out.println(memberDTO.getUser_id());
     System.out.println(memberDTO.getUser_pw());
     System.out.println(memberDTO.getUser_name());
     System.out.println(memberDTO.getUser_email());
     System.out.println(memberDTO.getUser_phone());
     System.out.println(memberDTO.getUser_post());
     System.out.println(memberDTO.getUser_addr());
     System.out.println(memberDTO.getUser_addr2());
//	     System.out.println(memberDTO.getMemberFileDTO().getFileName());
     MemberFileDTO memberFileDTO = new MemberFileDTO();
     memberFileDTO.setUser_id(memberDTO2.getUser_id());
     memberFileDTO =  mypageService.getMyInfoFile(memberFileDTO);
//	     System.out.println(memberFileDTO.getFileName());
         mv.addObject("update", memberDTO);
         mv.addObject("fileupdate", memberFileDTO);
         mv.setViewName("/mypage/myUpdate");
     
        return mv;
    }
	
	@RequestMapping(value="myUpdate", method = RequestMethod.POST)
	public String myUpdate(MemberDTO memberDTO, MultipartFile userfile, HttpSession session)throws Exception{
		memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setUser_id(memberDTO.getUser_id());
	    mypageService.setMyUpdate(memberDTO, userfile, session.getServletContext());
		
		return "redirect:./mypage";
	}
	
	//회원정보 탈퇴
	@RequestMapping(value="myDelete" , method = RequestMethod.POST)
	@ResponseBody
	public int myDelete(HttpSession session)throws Exception{
	    MemberDTO memberDTO = new MemberDTO();
	    MemberDTO memberDTO2 =  (MemberDTO)session.getAttribute("member");
	    memberDTO.setUser_id(memberDTO2.getUser_id());
	    int result = mypageService.setMyDelete(memberDTO);
	    session.invalidate();
		return result;
	}

}
