package admin.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch11.logon.LogonDataBean;
import upload.bean.PointDataBean;

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

	@RequestMapping("AdminMember.nhn")
	public String memberPro(HttpServletRequest request) throws Exception{
		
		
		return "/AdminMember/member.jsp";
	}
	
	@RequestMapping("point.nhn")
	public String point(HttpServletRequest request,HttpSession session,PointDataBean dto) throws Exception{
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		List pointList = null;
		int count = 0;
		
		String pageNum = request.getParameter("pageNum");
		int pageSize = 10;
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		pointList = sqlMap.queryForList("getPointList", null);
		count = (Integer)sqlMap.queryForObject("pointCount", null);
		
		for(int i=0; i<count; i++){
			dto = (PointDataBean)pointList.get(i);
		}
		
		request.setAttribute("pointList", pointList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow",startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("id", id);
		
		return "/admin/point.jsp";
	}
	

}
