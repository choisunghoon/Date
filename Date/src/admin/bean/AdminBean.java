package admin.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.bean.EventDataBean;
import ch11.logon.LogonDataBean;
import upload.bean.PointDataBean;

@Controller
public class AdminBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;//ï¿½Úµï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½Þ¾ï¿½ï¿½ï¿½
	
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


	
	@RequestMapping("point.nhn")
	public String point(HttpServletRequest request,HttpSession session,PointDataBean dto) throws Exception{
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		List pointList = new ArrayList();
		int count = 0;
		
		String pageNum = request.getParameter("pageNum");
		int pageSize = 10;
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("startRow", startRow);
		num.put("endRow", endRow);
		
		pointList = sqlMap.queryForList("getPointList", num);
		count = (Integer)sqlMap.queryForObject("pointCount", null);
		
		for(int i=0; i<pointList.size(); i++){
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
	
	@RequestMapping("adminEvent.nhn")
	public String event(HttpServletRequest request,HttpSession session)throws Exception{
		session = request.getSession();
		String id = (String)session.getAttribute("id");		
		List eventList = new ArrayList();
		List WList = new ArrayList();
		int count = 0;		
		String pageNum = request.getParameter("pageNum");
		int pageSize = 10;
		if(pageNum == null){
			pageNum = "1";
		}	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("startRow", startRow);
		num.put("endRow", endRow);		
		eventList = sqlMap.queryForList("getWinEventList", num);
		count = (Integer)sqlMap.queryForObject("winEventCount", null);
		EventDataBean wto = new EventDataBean();
		for(int i = 0;i<eventList.size();i++){
			wto = (EventDataBean)eventList.get(i);
			System.out.println(wto.getWcouples());
			if(wto.getWcouples()==null){				
				wto.setWc(0);
			}
			else if(!(wto.getWcouples().isEmpty())){
				String[] wlist = wto.getWcouples().split(",");
				wto.setWc(wto.getWnumber()-wlist.length);
			}
			WList.add(wto);
		}	
		request.setAttribute("WList", WList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow",startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("id", id);
	
		return "/admin/adminEvent.jsp";
	}
	
	@RequestMapping("adminEvent1.nhn")
	public String adminEvent1(HttpServletRequest request,HttpSession session,EventDataBean dto){		
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		List WList = new ArrayList();
		List eventList = new ArrayList();
		int count = 0;
		
		String pageNum = request.getParameter("pageNum");
		int pageSize = 10;
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("startRow", startRow);
		num.put("endRow", endRow);		
		
		eventList = sqlMap.queryForList("getWinEventList", num);
		count = (Integer)sqlMap.queryForObject("winEventCount", null);
		EventDataBean wto = new EventDataBean();
		for(int i = 0;i<eventList.size();i++){
			wto = (EventDataBean)eventList.get(i);
			if(wto.getWcouples()==null){				
				wto.setWc(0);
			}
			else if(!(wto.getWcouples().isEmpty())){
				String[] wlist = wto.getWcouples().split(",");
				wto.setWc(wto.getWnumber()-wlist.length);
			}
			WList.add(wto);
		}	
		request.setAttribute("WList", WList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow",startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("id", id);
	
		
		return "/admin/adminEvent1.jsp";
	}
	
	@RequestMapping("adminEventPro.nhn")
	public String adminEventPro(HttpServletRequest request, EventDataBean edb){
		System.out.println("aadfasdfsaf");
		String keyword = request.getParameter("keyword");
		int way = Integer.parseInt(request.getParameter("way"));
		System.out.println(keyword);
		int a = Integer.parseInt(request.getParameter("states"));
		List WList = new ArrayList();
		HashMap<Object, Object> row = new HashMap<Object, Object>();
		row.put("keyword", keyword); 		
		String[] wc;		
		if(way==3)
		{	
			if(a==1){
				WList = sqlMap.queryForList("s1", row);	
			}
			else if(a == 2){				
				WList = sqlMap.queryForList("searchWinEventListall", row);	
			}else if(a == 3){
				WList = sqlMap.queryForList("searchWinEventListall1", row);
			}
		}
		else{			
			row.put("way", way);		
			if(a==1){
				WList = sqlMap.queryForList("s2", row);	
			}
			else if(a == 2){
				WList = sqlMap.queryForList("searchWinEventList", row);	
			}else if(a == 3){
				WList = sqlMap.queryForList("searchWinEventList1", row);
			}
		}
		request.setAttribute("WList", WList);
		return "/admin/adminEvent1.jsp";
	}
	
	@RequestMapping("adminEventPro1.nhn")
	public String adminEventPro1(HttpServletRequest request, EventDataBean edb){
		int b = Integer.parseInt(request.getParameter("pick"));
		edb.setW(b);
		List eventList = new ArrayList();
		
		eventList = sqlMap.queryForList("searchWinEventList3", edb);
		
		request.setAttribute("eventList", eventList);
		
		
		return "/admin/adminEvent1.jsp";
	}
	
	@RequestMapping("pointPro.nhn")
	public String pointPro(HttpServletRequest request, PointDataBean pdb){
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		int a = Integer.parseInt(request.getParameter("states"));
		String place = "";
		if(a == 1){
			place = "Æ÷ÅäºÏ";
		}else if(a == 2){
			place = "´ÙÀÌ¾î¸® °øÀ¯";
		}else{
			place = "ÄÚ½º °øÀ¯";
		}
		
		System.out.println(a);
		pdb.setCouplename(keyword);
		pdb.setPlace(place);
		List pointList = new ArrayList();
		
		pointList = sqlMap.queryForList("searchWinPointList", pdb);
		int count1 = (int) sqlMap.queryForObject("searchWinPointCount", pdb);
		
		request.setAttribute("pointList", pointList);
		request.setAttribute("count1", count1);
		
		return "/admin/point.jsp";
	}
	

}
