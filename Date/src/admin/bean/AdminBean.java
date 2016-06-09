package admin.bean;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch11.logon.LogonDataBean;

@Controller
public class AdminBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;//자동으로 값 받아줌
	
	@RequestMapping("AdminMember.nhn")
	public String adminMember(HttpServletRequest request) throws Exception{
		ArrayList dto = (ArrayList)sqlMap.queryForList("selectMember",null);
		request.setAttribute("dto", dto);
		return "/AdminMember/member.jsp";
	}
	
	@RequestMapping("AdminMemberPro.nhn")
	public String adminMember2(HttpServletRequest request,LogonDataBean dto) throws Exception{
		sqlMap.delete("memberDelete", dto);
		
		
		return "/AdminMember/member.jsp";
	}
}
