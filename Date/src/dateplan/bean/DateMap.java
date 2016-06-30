package dateplan.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DateMap {
	@Autowired
	private SqlMapClientTemplate sqlMap;//자동으로 값 받아줌
	
	
	@RequestMapping("DateMap.nhn")
	public String dateMap(HttpServletRequest request) throws Exception{
				
		return "/dateplan/dateMap.jsp";
	}
	@RequestMapping("datepost.nhn")
	public String datepost(HttpServletRequest request,DTO dto) throws Exception{
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto= (DTO)sqlMap.queryForObject("selectcosnum",num);
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("num",num);
				
		return "/dateplan/datepost.jsp";
	}
	@RequestMapping("datePostscript.nhn")
	public String datePostscript(HttpServletRequest request,DTO dto) throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("selectcpname", id);
		List cosList = new ArrayList();
		
		cosList = sqlMap.queryForList("selectcoscop", couplename);
		
		
		request.setAttribute("cosList", cosList);
		return "/dateplan/datePostscript.jsp";
	}
	@RequestMapping("index.nhn")
	public String dateBoard(HttpServletRequest request) throws Exception{
				
		return "/dateboard/test.jsp";
	}
	@RequestMapping("dateBoard.nhn")
	public String dateBoard(HttpServletRequest request,DTO dto){
		dto= (DTO)sqlMap.queryForObject("selectcos",null);
		
		
		request.setAttribute("dto", dto);

		return "/dateboard/dateboardd.jsp";
	}
	@RequestMapping("datePlan.nhn")
	public String dateMap2(HttpServletRequest request,DTO dto) throws Exception{
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto= (DTO)sqlMap.queryForObject("selectcosnum",num);
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("num",num);
		
		return "/dateplan/datePlan.jsp";
	}
	@RequestMapping("cosSave.nhn")
	public String cosSave(HttpServletRequest request,DTO dto) throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("selectcpname", id);
		dto.setCouplename(couplename);
		sqlMap.insert("insertcos", dto);
			
		request.setAttribute("dto", dto);
		
		return "redirect:couple.nhn";
	}
	@RequestMapping("datecos.nhn")
	public String datecos(HttpServletRequest request,DTO dto){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("selectcpname", id);
		List cosList = new ArrayList();
		
		cosList = sqlMap.queryForList("selectcoscop", couplename);
		
		
		request.setAttribute("cosList", cosList);
		
		return "/dateplan/datecos.jsp";
	}
	@RequestMapping("delcos.nhn")
	public String delcos(HttpServletRequest request,DTO dto){
		
		
		return "/dateplan/datecos.jsp";
	}
	
	@RequestMapping("cosUpdate.nhn")
	public String cosUpdate(HttpServletRequest request,DTO dto) throws Exception{
			
			DTO sdto= new DTO();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			int num = Integer.parseInt(request.getParameter("num"));
			sdto = (DTO)sqlMap.queryForObject("selectcos", num);
			dto.setNum(sdto.getNum());
			
			sqlMap.update("updatecos", dto);
		
		request.setAttribute("dto", dto);
	
		return "redirect:couple.nhn";
	}
}
