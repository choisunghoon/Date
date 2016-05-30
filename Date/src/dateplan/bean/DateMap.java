package dateplan.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DateMap {
	
	
	@RequestMapping("DateMap.nhn")
	public String dateMap() throws Exception{
		return "/dateplan/dateMap.jsp";
	}
	@RequestMapping("DateMap2.nhn")
	public String dateMap2() throws Exception{
		return "/dateplan/dateMap2.jsp";
	}
}
