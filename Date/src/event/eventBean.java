package event;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import event.EventDataBean;

@Controller
public class eventBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;//자동으로 값 받아줌
/*
	@SuppressWarnings("null")
	@RequestMapping("a.nhn")
	public String test(){
		return "/event/a.jsp";
	}*/		
	
	@RequestMapping("eventTeb.nhn")	
	public String eventTab(HttpServletRequest request){
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		
		String tab = request.getParameter("tab");
		System.out.println("tab1: " + tab);
		if(tab==null) tab="1";
		System.out.println("tab2: " + tab);
		int count = 0;	
		String pageNum = request.getParameter("pageNum");
		int pageSize = 10;
    	if (pageNum == null) {
    		pageNum = "1";
    	}
    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize + 1;
    	int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() +"/event/";	
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);	
		eventList = sqlMap.queryForList("eventIng",row);			
		//if(tab=="2") eventList = sqlMap.queryForList("eventEnd",row);		
		//if(tab=="3")eventList = sqlMap.queryForList("upcomingEvent",row);		
		count = (Integer)sqlMap.queryForObject("eventCount",null);
		System.out.println(count);
		for(int i=0; i<count; i++){			
			eto =(EventDataBean)eventList.get(i);
			srclist = eto.getEimg().split(",");		
			System.out.println("srclist: " + srclist[0]);
			System.out.println("path: "+path);
		    eto.setEimg(path +srclist[0]);
		    System.out.println("eto.getEimg: "+eto.getEimg());
		}	 
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("tab", (tab));
		return "/event/eventTeb.jsp";
	}	
	
	@RequestMapping("end_event.nhn")
	public String event_end(HttpServletRequest request){
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		String tab = request.getParameter("tab");
		int count = 0;	
		String pageNum = request.getParameter("pageNum");
		int pageSize = 6;
    	if (pageNum == null) {
    		pageNum = "1";
    	}
    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize + 1;
    	int endRow = currentPage * pageSize;
    	System.out.println(pageNum +" ,"+ currentPage +" ,"+  startRow +" ,"+  endRow);
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() +"/event/";	
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);		
		eventList = sqlMap.queryForList("eventEnd",row);
		count = (Integer)sqlMap.queryForObject("eventCount",null);
		System.out.println(count);
		System.out.println("startRow: "+startRow);
		for(int i=0; i<eventList.size(); i++){			
			eto =(EventDataBean)eventList.get(i);
			srclist = eto.getEimg().split(",");		
		    eto.setEimg(path +srclist[0]);
		}	 
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("tab", (tab));
		return "/event/eventTeb.jsp";
	}
	
	@RequestMapping("upcoming_event.nhn")
	public String upcoming_event(HttpServletRequest request){
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		String tab = request.getParameter("tab");
		int count = 0;	
		String pageNum = request.getParameter("pageNum");
		int pageSize = 6;
    	if (pageNum == null) {
    		pageNum = "1";
    	}
    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize + 1;
    	int endRow = currentPage * pageSize;
    	System.out.println(pageNum +" ,"+ currentPage +" ,"+  startRow +" ,"+  endRow);
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() +"/event/";	
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);		
		eventList = sqlMap.queryForList("upcomingEvent",row);			
		count = (Integer)sqlMap.queryForObject("eventCount",null);
		System.out.println(count);
		System.out.println("startRow: "+startRow);
		for(int i=0; i<eventList.size(); i++){			
			eto =(EventDataBean)eventList.get(i);
			srclist = eto.getEimg().split(",");		
		    eto.setEimg(path +srclist[0]);
		}	 
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("tab", (tab));
		return "/event/eventTeb.jsp";
	}
	
	@RequestMapping("addEvent.nhn")
	public String addEvent(){		
		return "/event/addEvent.jsp";
	}
	
	@RequestMapping("addEventPro.nhn")
	public String addEvent (HttpServletRequest request, EventDataBean eto) throws Exception{
	    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	     
	    MultipartFile multipartFile = null;
	    String originalFileName = null;
	    String[] src = new String[2];
	    String path = "C:\\Users\\user2\\workspace\\Spring\\WebContent\\project";
	    int i = 0;	     
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			originalFileName = multipartFile.getOriginalFilename();
			System.out.println(originalFileName);
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
			i++;
		}
	    eto.setEimg(src[0]+","+src[1]);
	    sqlMap.insert("addEvent", eto);
		return "/event/addEventPro.jsp";
	}
	
	@RequestMapping("eventContent.nhn")
	public String eventContent(HttpServletRequest request){	
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		System.out.println("enumber:"+enumber);
		EventDataBean eto = new EventDataBean();
		String[] srclist = null;
		List appList = null;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 10;
		int count = 0;
    	if (pageNum == null) {
    		pageNum = "1";
    	}
    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize + 1;
    	int endRow = currentPage * pageSize;
    	HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);
		row.put("enumber", enumber);
		String path = request.getContextPath() +"/event/";	
		eto = (EventDataBean) sqlMap.queryForObject("eventContent",enumber);
		srclist = eto.getEimg().split(",");		
		eto.setEimg(path +srclist[1]);
		appList = sqlMap.queryForList("eventApp",row);
		count = (Integer)sqlMap.queryForObject("eventAppCount",enumber);
		request.setAttribute("eto", eto);
		request.setAttribute("appList", appList);
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("enumber", new Integer(enumber));
		return "/event/eventContent.jsp";
	}
	
	@RequestMapping("addApp.nhn")
	public String addApp(HttpServletRequest request){	
		int enumber = Integer.parseInt(request.getParameter("enumber"));		
		System.out.println("addapp enumber: "+enumber);
		request.setAttribute("enumber", new Integer(enumber));
		return "/event/addApp.jsp";
	}
	
	@RequestMapping("addAppPro.nhn")
	public String addAppPro(HttpServletRequest request, EventDataBean eto){	
		int test=0;
		//String cn = "커플잉";
		test = (Integer)sqlMap.queryForObject("cnCon",eto.getCouplename());	
		System.out.println(test);
		if(test==0){sqlMap.insert("addApp", eto);}
		request.setAttribute("test", new Integer(test));
		return "/event/addAppPro.jsp";
	}
	
	@RequestMapping("appContent.nhn")
	public String appContent(HttpServletRequest request){	
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));	
		EventDataBean app = new EventDataBean();
		System.out.println("appnumber: "+appnumber);
		app = (EventDataBean) sqlMap.queryForObject("getAppContent",appnumber);	
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("app", app);
		return "/event/appContent.jsp";
	}
	
	@RequestMapping("test.nhn") //임의의 관리자 페이지
	public String test(){	

		return "/event/test.jsp";
	}
	
	@RequestMapping("modifyEvent.nhn")
	public String modifyEvent(HttpServletRequest request){	
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		System.out.println("modify enumber:"+enumber);
		EventDataBean eto = new EventDataBean();
		String[] srclist = null;		
		String path = request.getContextPath() +"/event/";	
		eto = (EventDataBean) sqlMap.queryForObject("eventContent",enumber);
		srclist = eto.getEimg().split(",");		
		String src1 = path + srclist[0];		
		String src2 = path + srclist[1];			
		request.setAttribute("eto", eto);		
		request.setAttribute("src1", src1);	
		request.setAttribute("src2", src2);	
		request.setAttribute("enumber", new Integer(enumber));
		return "/event/modifyEvent.jsp";
	}
	
	@RequestMapping("modifyEventPro.nhn")
	public String modifyEvent (HttpServletRequest request, EventDataBean eto) throws Exception{
	    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();	     
	    MultipartFile multipartFile = null;
	    String originalFileName = null;
	    int enumber = Integer.parseInt(request.getParameter("enumber"));
	    String setsrc = null;	
	    String[] srclist = null;		
	    String[] src = new String[2];
	    String path = "C:\\Users\\user2\\workspace\\Spring\\WebContent\\project";
	    int i = 0;	  
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()){				
				setsrc = (String)sqlMap.queryForObject("eventImg",enumber);
				System.out.println("setsrc: "+setsrc);
				srclist = setsrc.split(",");
				originalFileName = srclist[i]; 
				System.out.println(" srclist[i]"+ srclist[i]);
			}
			else{
				originalFileName = multipartFile.getOriginalFilename();				
			}
			System.out.println(originalFileName);
			multipartFile.transferTo(new File(path+originalFileName));
			src[i] = originalFileName;
			i++;
		}
	    eto.setEimg(src[0]+","+src[1]);
	    sqlMap.update("modifyEvent", eto);
		return "/event/modifyEventPro.jsp";
	}
	
	@RequestMapping("deleteEvent.nhn")
	public String deleteEvent(HttpServletRequest request){
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		sqlMap.delete("deleteEvent",enumber);
		return "/event/deleteEvent.jsp";
	}
	
	@RequestMapping("eventW.nhn")
	public String eventW(HttpServletRequest request){
		EventDataBean eto = new EventDataBean();
		List eventList = null;		
		int count = 0;	
		String pageNum = request.getParameter("pageNum");
		int pageSize = 10;
    	if (pageNum == null) {
    		pageNum = "1";
    	}
    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize + 1;
    	int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() +"/event/";	
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);	
		eventList = sqlMap.queryForList("eventIng",row);			
		count = (Integer)sqlMap.queryForObject("eventCount",null);
		System.out.println(count);
		for(int i=0; i<count; i++){			
			eto =(EventDataBean)eventList.get(i);
			srclist = eto.getEimg().split(",");		
			System.out.println("srclist: " + srclist[0]);
			System.out.println("path: "+path);
		    eto.setEimg(path +srclist[0]);
		    System.out.println("eto.getEimg: "+eto.getEimg());
		}	 
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		return "/event/eventW.jsp";
	}
	
	@RequestMapping("wWay.nhn")
	public String wWay(HttpServletRequest request){
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		request.setAttribute("enumber", new Integer(enumber));
		return "/event/wWay.jsp";
	}	
	
}
