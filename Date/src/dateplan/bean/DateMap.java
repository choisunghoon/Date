package dateplan.bean;

import javax.servlet.http.HttpServletRequest;

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
		
		
		dto= (DTO)sqlMap.queryForObject("selectcos",null);
		
		
		request.setAttribute("dto", dto);
		
		
		return "/dateplan/datePlan.jsp";
	}
	@RequestMapping("cosSave.nhn")
	public String cosSave(HttpServletRequest request,DTO dto) throws Exception{
			
			
			sqlMap.insert("insertcos", dto);
			
		
		request.setAttribute("dto", dto);
		
		return "/dateplan/cosSave.jsp";
	}
	@RequestMapping("cosUpdate.nhn")
	public String cosUpdate(HttpServletRequest request,DTO dto) throws Exception{
	
			DTO sdto= new DTO();
			sdto = (DTO)sqlMap.queryForObject("selectcos", null);
			dto.setNum(sdto.getNum());
			System.out.println(dto.getPlacetitle());
			sqlMap.update("updatecos", dto);
		
		request.setAttribute("dto", dto);
	
		return "/dateplan/cosUpdate.jsp";
	}
}
