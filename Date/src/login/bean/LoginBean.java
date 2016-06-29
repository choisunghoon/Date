package login.bean;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch11.logon.AlertDataBean;
import ch11.logon.CoupleDataBean;
import ch11.logon.LogonDataBean;

@Controller
public class LoginBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("main.nhn")//메인페이지가 호출될때 실행되는 함수
	public String main(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id = (String)session.getAttribute("id");

			int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //로그인한 회원의 nickname이 null인 경우 1을 추출 
			session.setAttribute("id", id);
			request.setAttribute("nickcheck", nickcheck);
			
			int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//로그인 유무 확인
			if(nc==1){
				
				String nickname=(String) sqlMapper.queryForObject("getNick", id); //로그인한 회원의 nickname을 추출
				session.setAttribute("nickname", nickname);
				int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname); //로그인한 회원의 nickname을 통해 읽지 않은 알림이 있는지 검색.미확인 알림이 있을경우 1을 추출
			
			
				if(checkAlert!=0){
					AlertDataBean adto=new AlertDataBean();
					adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname); //로그인한 회원의 nickname을 통해 알림의 내용을 추출
					session.setAttribute("adto", adto);
					
					
					System.out.println(adto.getContent());
					
					int ca=(Integer)sqlMapper.queryForObject("getCouple",id); //로그인한 회원의 id를 통해 회원이 커플, 혹은 커플신청을 한 회원인지 검색 결과값이 있다면 1을 추출 
					request.setAttribute("ca", ca);
			}
				int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); // 로그인한 회원의 id를 통해 알림을 검색. 상대방에게 보낸 커플신청 메시지를 상대방이 확인했을때 1을 추출
				System.out.println("메인 체크알럿1"+checkAlert1);
				if(checkAlert1!=0){
					LogonDataBean dto=new LogonDataBean();
					dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
					System.out.println("메인 if dto.getCouple"+dto.getCouple());
					
					
					if(dto.getCouple().equals("1")){	//	로그인한 회원의 커플 컬럼값이 1이라면 상대방이 커플수락을 했음을 의미
						request.setAttribute("couple1", "couple1");
					}
				}
				else
					request.setAttribute("couple1", "end");	// 상대방이 커플 수락을 거부했음을 의미
				}
			
			
			
			return "/sy0526/main.jsp";
		
		
	}
	
	@RequestMapping("loginPro.nhn")//로그인이 실행될때 호출되는 함수
	public String loginPro(HttpSession session,LogonDataBean dto,HttpServletRequest request) throws Exception{
		String nomal=request.getParameter("hidden");	// 히든값을 통해 로그인하는 회원이 페이스북으로 로그인했는지 일반 로그인을 했는지 판별
		String id=(String) request.getParameter("id");
		System.out.println("아이디:"+id);
		System.out.println("페북판별값:"+nomal);
		int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //로그인하는 회원의 별명이 없을때 1을 추출 
		request.setAttribute("nickcheck", nickcheck);
		
		if(nomal.equals("nomal")){ //일반 로그인 회원인경우
			int check = (Integer)sqlMapper.queryForObject("userCheck", dto); //id와 pw가 일치 하는지 검사. 일치하면 1을 추출
			System.out.println(dto.getId()+dto.getPw());
			if(check==1){
				session.setAttribute("id",dto.getId());
				session.setAttribute("check", "no");	// 일반 회원인경우 check 값에 no를 넣는다.
				
				return "redirect:main.nhn";
			}
			
			request.setAttribute("check", check);	//check값이 0일 경우 loginPro.jsp로 이동하여 비밀번호와 아이디를 확인하라는 경고창을 띄움
		}
		else{	//페북 로그인 회원인 경우
			int check = (Integer)sqlMapper.queryForObject("FBuserCheck", id);//페이스북 아이디가 db에 저장되어있다면 1을 추출. 저장되어있지 않다면 0을 추출
			session.setAttribute("id", id);
			session.setAttribute("check", "yes"); //페북 회원인 경우 check 값에 yes를 넣는다.
			if(check==1){//저장되어있다면 메인페이지로 이동
				return "redirect:main.nhn";
			}
			else{//저장되어있지 않다면 db에 페북 회원의 정보를 저장하기 위한 페이지로 이동
				return "redirect:inputPro.nhn?id="+id+"&hidden=fb";
			}
		}
		return "/dc/loginPro.jsp";
	}
	
	@RequestMapping("logout.nhn") //로그아웃
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return  "redirect:main.nhn";
	}
	
	
	@RequestMapping("loginForm.nhn") //로그인폼
	public String loginForm(HttpSession session,HttpServletRequest request) throws Exception{
		
		return "/dc/loginForm.jsp";
	}
	@RequestMapping("/couple.nhn") //커플페이지 실행시 호출되는 함수
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		String chk = request.getParameter("chk");
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//로그인 유무 확인
		if(nc==1){
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
			
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("메인 체크알럿1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("메인 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		request.setAttribute("chk", chk);
		return "/sy0526/couple.jsp";
	}
	
	@RequestMapping("/share.nhn") //공유 페이지 실행시 호출되는 함수
	public String share(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//로그인 유무 확인
		if(nc==1){
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("메인 체크알럿1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("메인 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/share.jsp";
	}
	
	@RequestMapping("/theme.nhn") //테마 페이지 호출될때 실행되는 함수
	public String theme(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//로그인 유무 확인
		if(nc==1){
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("메인 체크알럿1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("메인 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/theme.jsp";
	}
	
	@RequestMapping("/event.nhn") //이벤트 페이지 호출될때 실행되는 함수
	public String event(HttpSession session,HttpServletRequest request) throws Exception{
		String check = request.getParameter("check");
		request.setAttribute("check",check);
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//로그인 유무 확인
		if(nc==1){
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("메인 체크알럿1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("메인 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/event.jsp";
	}
	
	@RequestMapping("/personal.nhn") // 개인페이지 실행될때 호출되는 함수
	public String personal(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//로그인 유무 확인
		if(nc==1){
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("메인 체크알럿1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("메인 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}

		return "/sy0526/personal.jsp";
	}
	
}
