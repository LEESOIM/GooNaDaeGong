package com.gndg.home.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//find페이지 css 갈아엎은 후 test
	@RequestMapping(value="findtest")
	public String findtest()throws Exception{
		return "member/findtest";
	}
	//login페이지 css 갈아엎은 후 test
	@RequestMapping(value="logintest")
	public String logintest()throws Exception{
		return "member/logintest";
	}
	
	
//	//test
	@RequestMapping(value="test")
	public String testPage()throws Exception{
		return "/member/test";
	}
	//아이디 중복검사
	@RequestMapping(value="ajaxID",method = RequestMethod.POST)
	@ResponseBody
	public Long ajaxID(MemberDTO memberDTO)throws Exception{
		Long result = memberService.getDuplicationID(memberDTO);
		return result;
	}
	//이메일 중복검사
	@RequestMapping(value="ajaxEmail", method = RequestMethod.POST)
	@ResponseBody
	public Long ajaxEmail(MemberDTO memberDTO)throws Exception{
		Long result = memberService.getDuplicationEmail(memberDTO);
		return result;
	}

	//회원가입
	@RequestMapping(value="join")
	public String setJoin()throws Exception{
		return "/member/join";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String setJoin(MemberDTO memberDTO, MultipartFile userfile, HttpSession session)throws Exception{
		memberService.setJoin(memberDTO,userfile,session.getServletContext());
		
		System.out.println("회원가입 controller");
		
		return "redirect:./login";
	}
	
	//카카오 로그인
	@RequestMapping(value="/kakao")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code)throws Exception{
		System.out.println("code======="+code);
		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> userInfo= memberService.getUserInfo(access_Token);
		System.out.println("####access_Token###"+access_Token);
		System.out.println("###userInfo### : "+ userInfo.get("email"));
		System.out.println("###nickname### : " + userInfo.get("nickname") );
		System.out.println("###id### : " +userInfo.get("id"));
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUser_id((String)userInfo.get("id"));
		memberDTO.setUser_name((String)userInfo.get("nickname"));
		memberDTO.setUser_email((String)userInfo.get("email"));
		
		memberService.setKakaoJoin(memberDTO);
		
		return "redirect:/";
	} 
	
	//구글 로그인
	@RequestMapping(value="google")
	public String googleLogin()throws Exception{
		return "/member/google";
	}
	
	//네이버 로그인
	@RequestMapping(value="/naver")
	public String naverLogin()throws Exception{
		return "callback";
	}
	
	//로그인
	@RequestMapping(value="login")
	public String getLogin()throws Exception{
		return "/member/login";
	}
	@RequestMapping(value="login", method = RequestMethod.POST)
	public ModelAndView getLogin(MemberDTO memberDTO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getLogin(memberDTO);
		session.setAttribute("member", memberDTO);
		
		
		int result = 0;
		String message = "로그인 실패";
		String url = "./login";
		if(memberDTO != null) {
			result = 1;
			message ="로그인 성공";
			url ="/";
		}
		
		mv.addObject("url", url);
		mv.addObject("message", message);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//아이디찾기
	@RequestMapping(value="findID")
	public String getFindID()throws Exception{
		return "/member/findID";
	}
	@RequestMapping(value="findID", method = RequestMethod.POST)
	@ResponseBody
	public String getFindID(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String userID = memberService.getFindID(memberDTO);
		mv.addObject("findID", memberDTO);
		mv.setViewName("/member/result");
		return userID;
	}
	
	
	//비밀번호찾기
	@RequestMapping(value="findPW")
	public String getFindPW()throws Exception{
		return"/member/findPW";
	}

	//비밀번호 찾기
	@RequestMapping(value="findPW", method=RequestMethod.POST)
	@ResponseBody
	public String getFindPWCheck(MemberDTO memberDTO, HttpServletResponse response)throws Exception{
		System.out.println("비밀번호 찾기 controller1");
		try {
		memberService.getFindPWCheck(memberDTO,response);
		}catch (Exception e) {
            // TODO: handle exception
		    e.printStackTrace();
        }
		System.out.println("비밀번호 찾기 controller2");
		System.out.println("비밀번호=="+memberDTO.getUser_pw());
		
		return memberDTO.getUser_pw();
	}
	
	//로그아웃
	@RequestMapping(value="logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	
	
}
