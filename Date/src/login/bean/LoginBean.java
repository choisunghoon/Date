package login.bean;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch11.logon.LogonDataBean;

@Controller
public class LoginBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("main.nhn")
	public String main(HttpSession session,LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		String id = (String)session.getAttribute("memId");
		String check =(String)session.getAttribute("fbcheck");
		System.out.println("ㅁ인 체크값"+check);
		request.setAttribute("check", check);
		
			request.setAttribute("id", id);
		
			int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id);
		
			request.setAttribute("nickcheck", nickcheck);
		
			return "/dc/main.jsp";
		
		
	}
	
	@RequestMapping("loginPro.nhn")
	public String loginPro(HttpSession session,LogonDataBean dto,HttpServletRequest request) throws Exception{
		String nomal=request.getParameter("hidden");
		String fb=request.getParameter("fbid");
		System.out.println("페북아이디:"+fb);
		System.out.println("노말값:"+nomal);
		if(nomal.equals("nomal")){
			int check = (Integer)sqlMapper.queryForObject("userCheck", dto);
			System.out.println(dto.getId()+dto.getPw());
			if(check==1){
				session.setAttribute("memId",dto.getId());
				session.setAttribute("fbcheck", "no");
				if(dto.getId().equals("undefined")){
					session.invalidate();
				}
				return "redirect:couple.nhn";
			}
			
			request.setAttribute("check", check);
		}
		else{
			int check = (Integer)sqlMapper.queryForObject("FBuserCheck", fb);
			session.setAttribute("memId", fb);
			session.setAttribute("fbcheck", "yes");
			if(check==1){
				return "redirect:main.nhn";
			}
			else{
				return "redirect:inputPro.nhn?fbid="+fb+"&hidden=fb";
			}
		}
		return "/dc/loginPro.jsp";
	}
	
	@RequestMapping("logout.nhn")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return  "redirect:main.nhn";
	}
	
	
	@RequestMapping("loginForm.nhn")
	public String loginForm(HttpSession session,HttpServletRequest request) throws Exception{
		
		return "/dc/loginForm.jsp";
	}
	
	
}
