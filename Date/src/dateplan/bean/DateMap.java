package dateplan.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DateMap {
	
	
	@RequestMapping("DateMap.nhn")
	public String dateMap() throws Exception{
		return "/dateplan/dateMap.jsp";
	}
	@RequestMapping("datePlan.nhn")
	public String dateMap2(HttpServletRequest request,DTO dto) throws Exception{
		request.setAttribute("dto", dto);
		return "/dateplan/datePlan.jsp";
	}
}
