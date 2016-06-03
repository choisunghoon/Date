package login.bean;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch11.logon.*;

@Controller
public class InputBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("inputForm.nhn")
	public String inputForm() throws Exception{
		
		return "/dc/inputForm.jsp";
	}
	
	@RequestMapping("inputPro.nhn")
	public String inputPro(LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		String nomal=request.getParameter("hidden");
		System.out.println("input nomal"+nomal);
		if(nomal.equals("fb")){
			String id=request.getParameter("fbid");
			dto.setId(id);	
		}
		sqlMapper.insert("insertMember", dto);
		return "/dc/inputPro.jsp";
	}
	
	@RequestMapping("confirmId.nhn")
	public String confirmId(String id,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmId",id);
	    request.setAttribute("id", id);
	    request.setAttribute("check", check);
		return "/dc/confirmId.jsp";
	}
	@RequestMapping("confirmNickname.nhn")
	public String confirmNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/confirmNickname.jsp";
	}
	@RequestMapping("searchNickname.nhn")
	public String searchNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/searchNickname.jsp";
	}
	@RequestMapping("confirmCoupleName.nhn")
	public String confirmCoupleName(String coupleName,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmCoupleName",coupleName);
	    request.setAttribute("coupleName", coupleName);
	    request.setAttribute("check", check);
		return "/dc/confirmCoupleName.jsp";
	}
	
	
	@RequestMapping("modifyForm.nhn")
	public String modifyForm(HttpServletRequest request,HttpSession session) throws Exception{
				
		String id = (String)session.getAttribute("memId");
		LogonDataBean dto = new LogonDataBean();
		String check =(String)session.getAttribute("fbcheck");
		System.out.println("ㅁ인 체크값"+check);
		request.setAttribute("check", check);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		
	    request.setAttribute("dto", dto);
	    
		return "/dc/modifyForm.jsp";
	}
	
	@RequestMapping("modifyPro.nhn")
	public String modifyPro(HttpSession session,LogonDataBean dto) throws Exception{
		String id = (String)session.getAttribute("memId");
		dto.setId(id);
		int check=(Integer)sqlMapper.queryForObject("getCouple", id);
		if(check==1){dto.setCouple("1");}
		else{dto.setCouple("0");}
		
		sqlMapper.update("updateMember", dto);
		return "/dc/modifyPro.jsp";
	}
	
	@RequestMapping("deleteForm.nhn")
	public String deleteForm() throws Exception{
		
		return "/dc/deleteForm.jsp";
	}
	@RequestMapping("deletePro.nhn")
	public String deletePro(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("memId");
		String pw  = request.getParameter("pw");
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int check = (Integer)sqlMapper.queryForObject("userCheck", dto);
	    
	    if(check==1){
	    	session.invalidate();
	    	sqlMapper.update("deleteMember", id);
	    }
	    request.setAttribute("check", new Integer(check));
		return "/dc/deletePro.jsp";
	}
	@RequestMapping("mypage.nhn")
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception{
		String check =(String)session.getAttribute("fbcheck");
		String id =request.getParameter("id");
		System.out.println("마페 체크값"+check);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		System.out.println("마페아이디"+id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleinfo.nhn")
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=request.getParameter("id");
		System.out.println("커플아이디"+id);
		LogonDataBean dto=new LogonDataBean();
		int check1 = (Integer)sqlMapper.queryForObject("coupleCheck1", id);
		int check2 = (Integer)sqlMapper.queryForObject("coupleCheck2", id);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		request.setAttribute("id", id);
		request.setAttribute("couple", dto);
		request.setAttribute("check1", check1);
		request.setAttribute("check2", check2);
		return "/dc/coupleinfo.jsp";
	}
	@RequestMapping("coupleSearchPro.nhn")
	public String coupleSearchPro(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=request.getParameter("id");
		System.out.println("커플서치 아이디"+id);
		String nickname=request.getParameter("nickname");
		String coupleName=request.getParameter("coupleName");
		LogonDataBean dto=new LogonDataBean();
		dto = (LogonDataBean)sqlMapper.queryForObject("getMemberbyn", nickname);
		System.out.println("dto아이디"+dto.getId());
		CoupleDataBean cdto=new CoupleDataBean();
		cdto.setId1(id);
		cdto.setId2(dto.getId());
		
		return "/dc/coupleSearchPro.jsp";
	}
}
