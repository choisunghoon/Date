package project.bean;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ch11.logon.CoupleDataBean;



@Controller
public class Projectbean {
	@Autowired
	private SqlMapClientTemplate sqlMap;// �뜝�뙓�벝�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�뙣�뼲�삕�뜝�룞�삕
	/*
	 * @SuppressWarnings("null")
	 * 
	 * @RequestMapping("a.nhn") public String test(){ return "/project/a.jsp"; }
	 */

	@RequestMapping("eventTeb.nhn")
	public String eventTab(HttpServletRequest request, HttpSession session) {		
		String id = (String)session.getAttribute("id");
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		String tab = request.getParameter("tab");
		if (tab == null)
			tab = "1";
		int count = 0;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() + "/project/ei/";
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);
		eventList = sqlMap.queryForList("eventIng", row);
		count = (Integer) sqlMap.queryForObject("countIng", null);
		for (int i =0; i < eventList.size(); i++) {
			eto = (EventDataBean) eventList.get(i);
			srclist = eto.getEimg().split(",");
			eto.setEimg(path + srclist[0]);
		}
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("tab", (tab));
		return "/project/eventTeb.jsp";
	}

	@RequestMapping("end_event.nhn")
	public String event_end(HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("id");
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		String tab = request.getParameter("tab");
		int count = 0;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() + "/project/ei/";
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);
		eventList = sqlMap.queryForList("eventEnd", row);
		count = (Integer) sqlMap.queryForObject("countEnd", null);
		for (int i = 0; i < eventList.size(); i++) {
			eto = (EventDataBean) eventList.get(i);
			srclist = eto.getEimg().split(",");
			eto.setEimg(path + srclist[0]);
		}
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("tab", (tab));
		return "/project/eventTeb.jsp";
	}

	@RequestMapping("upcoming_event.nhn")
	public String upcoming_event(HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("id");
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		String tab = request.getParameter("tab");
		int count = 0;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() + "/project/ei/";
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);
		eventList = sqlMap.queryForList("upcomingEvent", row);
		count = (Integer) sqlMap.queryForObject("upcomingCount", null);
		for (int i = 0; i < eventList.size(); i++) {
			eto = (EventDataBean) eventList.get(i);
			srclist = eto.getEimg().split(",");
			eto.setEimg(path + srclist[0]);
		}
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("tab", (tab));
		return "/project/eventTeb.jsp";
	}

	@RequestMapping("w_event.nhn")
	public String w_event(HttpServletRequest request,HttpSession session){
		String id = (String)session.getAttribute("id");
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		String tab = request.getParameter("tab");
		int count = 0;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		
		String path = request.getContextPath() + "/project/ei/";
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);
		eventList = sqlMap.queryForList("eventEnd", row);
		count = (Integer) sqlMap.queryForObject("countEnd", null);
		for (int i = 0; i < eventList.size(); i++) {
			eto = (EventDataBean) eventList.get(i);
			srclist = eto.getEimg().split(",");
			eto.setEimg(path + srclist[0]);
		}		
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);	
		request.setAttribute("count", new Integer(count));
		request.setAttribute("tab", (tab));
		return "/project/eventTeb.jsp";
	}
	
	@RequestMapping("addEvent.nhn")
	public String addEvent() {
		return "/project/addEvent.jsp";
	}

	@RequestMapping("addEventPro.nhn")
	public String addEvent(HttpServletRequest request, EventDataBean eto) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[2];
		//String path = "C:\\Users\\user2\\git\\Date\\Date\\WebContent\\project\\ei\\";
		//String path = request.getContextPath() + "/WebContent/project/ei/";
		String path = "C:\\Users\\ss\\git\\Date\\Date\\Date\\WebContent\\project\\ei\\";
		int i = 0;
		while (iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			originalFileName = multipartFile.getOriginalFilename();
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
			i++;
		}
		eto.setEimg(src[0] + "," + src[1]);
		sqlMap.insert("addEvent", eto);
		return "/project/addEventPro.jsp";
	}

	@RequestMapping("eventContent.nhn")
	public String eventContent(HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("id");
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		String tab = request.getParameter("tab");
		if (tab == null)
			tab = "1";
		EventDataBean eto = new EventDataBean();
		String[] srclist = null;
		String[] wclist = null;
		List appList = null;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
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
		String path = request.getContextPath() + "/project/ei/";
		eto = (EventDataBean) sqlMap.queryForObject("eventContent", enumber);
		srclist = eto.getEimg().split(",");
		if(eto.getWcouples() != null){
		wclist = eto.getWcouples().split(",");
		}	
		eto.setEimg(path + srclist[1]);
		appList = sqlMap.queryForList("eventApp", row);
		count = (Integer) sqlMap.queryForObject("eventAppCount", enumber);	
		
		int countCN = (Integer)sqlMap.queryForObject("countCN", id); //�뚣끋逾놅옙�뵥揶쏉옙
		if(countCN>0){
		String couplen = (String)sqlMap.queryForObject("selectCouplename", id); //�뚣끋逾놅옙�뵠�뵳袁⑦맖疫뀐옙
		EventDataBean eto2 = new EventDataBean();	
		eto2.setCouplename(couplen);
		eto2.setEnumber(enumber);
		EventDataBean eto3 = new EventDataBean();	
		int checkcount = (Integer)sqlMap.queryForObject("checkcount2", eto2); //占쎈르�뵳�눘�뱽 癰귣�源됵옙援�
			if(checkcount>0){
				eto3 = (EventDataBean)sqlMap.queryForObject("checkW2", eto2);	//checknum占쎌넇占쎌뵥			
				if(eto3.getChecknum()==0){
					sqlMap.update("checknumU", eto2);
				}
			}
		}	
		
		request.setAttribute("eto", eto);
		request.setAttribute("appList", appList);
		request.setAttribute("wclist", wclist);
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("tab", tab);
		return "/project/eventContent.jsp";
	}

	@RequestMapping("addApp.nhn")
	public String addApp(HttpServletRequest request,HttpSession session) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getCouplename",id);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("couplename", couplename);
		return "/project/addApp.jsp";
	}

	@RequestMapping("addAppPro.nhn")
	public String addAppPro(HttpServletRequest request, EventDataBean eto,HttpSession session) {
		String id = (String)session.getAttribute("id");
		int test = 0;
		int enumber = Integer.parseInt(request.getParameter("enumber"));
	
		System.out.println(eto.getAppimg());
		
		// String cn = "而ㅵ뜝�룞�삕�뜝�룞�삕";
		//HashMap<String, Integer> row = new HashMap<String, Integer>();
		//row.put("couplename", eto.getCouplename());
		//row.put("enumber", eto.getEnumber());
		test = (Integer) sqlMap.queryForObject("cnCon", eto);		
		if (test == 0) {
			sqlMap.insert("addApp", eto);
		}
		request.setAttribute("test", new Integer(test));
		request.setAttribute("enumber", new Integer(enumber));
		return "/project/addAppPro.jsp";
		
		
	}

	@RequestMapping("appContent.nhn")
	public String appContent(HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("id");
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		String tab = request.getParameter("tab");
		String pageNum = request.getParameter("pageNum");
		//String memid = "admin";
		//String id = "gnn";
		EventDataBean app = new EventDataBean();
		app = (EventDataBean) sqlMap.queryForObject("getAppContent", appnumber);
		String path = request.getContextPath() + "/project/ee/";
		app.setAppimg(path+app.getAppimg());
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("id", id);
		//request.setAttribute("memid", memid);
		request.setAttribute("app", app);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("tab", tab);
		return "/project/appContent.jsp";
	}
	
	@RequestMapping("appContentAdmin.nhn")
	public String appContentAdmin(HttpServletRequest request) {
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int w = Integer.parseInt(request.getParameter("w"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int Cwcount = Integer.parseInt(request.getParameter("Cwcount"));
		String tab = request.getParameter("tab");
		String pageNum = request.getParameter("pageNum");
		String memid = "admin";
		//String id = "gnn";
		EventDataBean app = new EventDataBean();
		app = (EventDataBean) sqlMap.queryForObject("getAppContent", appnumber);
		String path = request.getContextPath() + "/project/ee/";
		app.setAppimg(path+app.getAppimg());
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("Cwcount", new Integer(Cwcount));
		//request.setAttribute("id", id);
		request.setAttribute("memid", memid);
		request.setAttribute("app", app);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("tab", tab);
		request.setAttribute("w",new Integer(w));
		return "/project/appContentAdmin.jsp";
	}

	@RequestMapping("test.nhn") // �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
	public String test(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("pageNum", pageNum);
		return "/project/test.jsp";
	}

	@RequestMapping("modifyEvent.nhn")
	public String modifyEvent(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		EventDataBean eto = new EventDataBean();
		String[] srclist = null;
		String path = request.getContextPath() + "/project/ei/";
		eto = (EventDataBean) sqlMap.queryForObject("eventContent", enumber);
		srclist = eto.getEimg().split(",");
		String src1 = path + srclist[0];
		String src2 = path + srclist[1];
		request.setAttribute("eto", eto);
		request.setAttribute("src1", src1);
		request.setAttribute("src2", src2);
		request.setAttribute("enumber", new Integer(enumber));
		return "/project/modifyEvent.jsp";
	}

	@RequestMapping("modifyEventPro.nhn")
	public String modifyEvent(HttpServletRequest request, EventDataBean eto) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		String setsrc = null;
		String[] srclist = null;
		String[] src = new String[2];
		String path = "C:\\Users\\user2\\workspace\\Spring\\WebContent\\project\\ei";
		int i = 0;
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty()) {
				setsrc = (String) sqlMap.queryForObject("eventImg", enumber);
				srclist = setsrc.split(",");
				originalFileName = srclist[i];
			} else {
				originalFileName = multipartFile.getOriginalFilename();
			}
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
			i++;
		}
		eto.setEimg(src[0] + "," + src[1]);
		sqlMap.update("modifyEvent", eto);
		return "/project/modifyEventPro.jsp";
	}

	@RequestMapping("deleteEvent.nhn")
	public String deleteEvent(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		sqlMap.delete("deleteEvent", enumber);
		return "/project/deleteEvent.jsp";
	}

	@RequestMapping("eventW.nhn")
	public String eventW(HttpServletRequest request) {
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		int count = 0;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() + "/project/ei/";
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow); 
		row.put("endRow", endRow);
		eventList = sqlMap.queryForList("eventEnd", row);
		count = (Integer) sqlMap.queryForObject("countEnd", null);
		for (int i = 0; i <eventList.size(); i++) {
			eto = (EventDataBean) eventList.get(i);
			srclist = eto.getEimg().split(",");
			eto.setEimg(path + srclist[0]);
		}
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		return "/project/eventW.jsp";
	}

	@RequestMapping("wWay.nhn")
	public String wWay(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int w = Integer.parseInt(request.getParameter("w"));
		int count = (Integer) sqlMap.queryForObject("eventAppCount", enumber);
		int wcount = 0;
		String wcouplesN = (String) sqlMap.queryForObject("wcount", enumber);
		if(wcouplesN==null){
		wcount  = 0;
		}else {
			String[] wlist = wcouplesN.split(",");
			wcount = wlist.length;
			
		}
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber",new Integer(wnumber));
		request.setAttribute("w",new Integer(w));
		request.setAttribute("count", count);
		request.setAttribute("wcount", new Integer(wcount));
		return "/project/wWay.jsp";
	}

	@RequestMapping("choice.nhn")
	public String choice(HttpServletRequest request) {
		int w = Integer.parseInt(request.getParameter("w"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int Cwcount = Integer.parseInt(request.getParameter("Cwcount"));
		EventDataBean eto = new EventDataBean();
		List appList = null;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
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
		int count = (Integer) sqlMap.queryForObject("eventAppCount", enumber);
		appList = sqlMap.queryForList("eventApp", row);
		request.setAttribute("appList", appList);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("Cwcount", new Integer(Cwcount));
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("w",new Integer(w));
		return "/project/choice.jsp";
	}

	@RequestMapping("appW.nhn")
	public String appW(HttpServletRequest request) {
		int w = Integer.parseInt(request.getParameter("w"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int Cwcount = Integer.parseInt(request.getParameter("Cwcount"));
		String pageNum = request.getParameter("pageNum");
		String couplename = request.getParameter("couplename");
		EventDataBean app = new EventDataBean();
		app = (EventDataBean) sqlMap.queryForObject("eventContent", enumber);

			if (app.getWcouples() == null) {
				app.setWcouples(couplename);
			} else {
				app.setWcouples(app.getWcouples() + "," + couplename);
			}
			app.setEnumber(enumber);
			if ((Cwcount - 1) == 0) {
				app.setW(1);
			}
			sqlMap.update("addW", app);
			EventDataBean eto2 = new EventDataBean();
			eto2.setCouplename(couplename);
			eto2.setEnumber(enumber);
			sqlMap.insert("insertA", eto2);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("w",new Integer(w));
		request.setAttribute("Cwcount", new Integer(Cwcount-1));
		return "/project/appW.jsp";
	}

	@RequestMapping("appModify.nhn")
	public String appModify(HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("id");
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		EventDataBean app = new EventDataBean();
		app = (EventDataBean) sqlMap.queryForObject("getAppContent", appnumber);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("app", app);
		return "/project/appModify.jsp";
	}

	@RequestMapping("appModifyPro.nhn")
	public String appModifyPro(HttpServletRequest request, EventDataBean app,HttpSession session) {
		String id = (String)session.getAttribute("id");
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		request.setAttribute("enumber", new Integer(enumber));
		sqlMap.update("appModify", app);
		return "/project/appModifyPro.jsp";
	}

	@RequestMapping("appDelete.nhn")
	public String appDelete(HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("id");
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		sqlMap.delete("appDelete", appnumber);
		request.setAttribute("enumber", new Integer(enumber));
		return "/project/appDelete.jsp";
	}
	
	@RequestMapping("confirmPw.nhn")
	public String confirmPw(HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("id");
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int tab = Integer.parseInt(request.getParameter("tab"));
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("tab", new Integer(tab));
		request.setAttribute("pageNum", pageNum);
		return "/project/confirmPw.jsp";
	}
	
	@RequestMapping("confirmPwPro.nhn")
	public String confirmPwPro(HttpServletRequest request, EventDataBean eto,HttpSession session) {		
		String id = (String)session.getAttribute("id");
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int tab = Integer.parseInt(request.getParameter("tab"));	
		String pageNum = request.getParameter("pageNum");
		int check = (Integer) sqlMap.queryForObject("confirmPw", eto);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("tab", new Integer(tab));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("eto", eto);
		request.setAttribute("check", new Integer(check));
		return "/project/confirmPwPro.jsp";
	}

	@RequestMapping("eventWS.nhn")
	public String eventwSearch(HttpServletRequest request){
		int w = Integer.parseInt(request.getParameter("w"));		
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		int count = 0;
		String pageNum = request.getParameter("pageNum");
		int pageSize = 9;
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String[] srclist = null;
		String path = request.getContextPath() + "/project/ei/";
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow); 
		row.put("endRow", endRow);
		row.put("w", w);
		eventList = sqlMap.queryForList("eventEndS", row);
		count = (Integer) sqlMap.queryForObject("countEndS", w);
		for (int i = 0; i <eventList.size(); i++) {
			eto = (EventDataBean) eventList.get(i);
			srclist = eto.getEimg().split(",");
			eto.setEimg(path + srclist[0]);
		}
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", new Integer(count));
		request.setAttribute("w", new Integer(w));
		return "/project/eventWS.jsp";
	}
	
	@RequestMapping("modifyWcouples.nhn")
	public String modifyWcouples(HttpServletRequest request){
		int enumber = Integer.parseInt(request.getParameter("enumber"));	
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int w = Integer.parseInt(request.getParameter("w"));
		String wcouples = request.getParameter("wcouples");
		String app = (String)sqlMap.queryForObject("eventAppAdmin", enumber);
		String[] wcList = app.split(",");
		List appList = new ArrayList();
		for(int i = 0;i<wcList.length;i++){
			EventDataBean eto = new EventDataBean();
			eto.setCouplename(wcList[i]);
			eto.setEnumber(enumber);
			eto = (EventDataBean)sqlMap.queryForObject("selectCh", eto);
			appList.add(eto);
		}
		
		int Lsize = wcList.length;
		request.setAttribute("appList", appList);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("Lsize", new Integer(Lsize));
		request.setAttribute("wcouples", wcouples);
		request.setAttribute("wnumber",new Integer(wnumber));
		request.setAttribute("w",new Integer(w));
		return "/project/modifyWcouples.jsp";
	}
	
	@RequestMapping("deleteWcouples.nhn")
	public String deleteWcouples(HttpServletRequest request){
		int enumber = Integer.parseInt(request.getParameter("enumber"));		
		String wcouples = request.getParameter("wcouples");
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wcouples", wcouples);
		return "/project/deleteWcouples.jsp";
	}
	
	@RequestMapping("deleteWcouplesPro.nhn")
	public String deleteWcouplesPro(HttpServletRequest request){
		int enumber = Integer.parseInt(request.getParameter("enumber"));		
		String Cwcouples = request.getParameter("wcouples");
		/*System.out.println("개짜증난다"+Cwcouples);
		String wName = (String) sqlMap.queryForObject("eventAppAdmin", enumber);
		System.out.println(wName);
		EventDataBean app = new EventDataBean();
		String[] wcList = null;
		wcList = wName.split(",");
		List list = new ArrayList();
		for(int i=0; i<wcList.length; i++){
			if(!(wcList[i].equals(Cwcouples))){				
				list.add(wcList[i]);
			}
		}
		String wc = (String)list.get(0);
		if (list.size() != 1) {
			for (int i = 1; i < list.size(); i++) {
				wc = wc + "," + (String) list.get(i);
				System.out.println("wc"+wc);
			}
		}
		app.setEnumber(enumber);
		app.setWcouples(wc);
		
		sqlMap.update("deleteWcouples", app);*/
		
		
		String wName = (String) sqlMap.queryForObject("eventAppAdmin", enumber);
		System.out.println(wName);
		EventDataBean app = new EventDataBean();
		String[] wcList = null;
		wcList = wName.split(",");
		List list = new ArrayList();
		for(int i=0; i<wcList.length; i++){
			if(!(wcList[i].equals(Cwcouples))){				
				list.add(wcList[i]);
			}
		}
		String wc = null;
		if(!(list.isEmpty())){
		wc = (String)list.get(0);
		if (list.size() != 1) {
			for (int i = 1; i < list.size(); i++) {
				wc = wc + "," + (String) list.get(i);
			}
		}}
		if(list.isEmpty()){
			wc = "";
		}
		app.setEnumber(enumber);
		app.setWcouples(wc);
		sqlMap.update("deleteWcouples", app);
		app.setCouplename(Cwcouples);
		sqlMap.delete("deleteW", app);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("Cwcouples", Cwcouples);
		return "/project/deleteWcouplesPro.jsp";
	}

	@RequestMapping("WcoupleA.nhn")
	public String WcoupleA(HttpServletRequest request, @RequestParam(value="checkArray[]") List<Integer> arrayParams){
		List checkArray =arrayParams;
		int enumber = Integer.parseInt(request.getParameter("enumber"));		
		EventDataBean w = new EventDataBean();
		w.setEnumber(enumber);
		for(int i=0; i<checkArray.size();i++){
			w.setEnumber(enumber);
			w.setAnumber((Integer)checkArray.get(i));
			sqlMap.update("updateWn", w);
		}
		return "/project/modifyWcouples.jsp";
	}
}
