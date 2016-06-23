package project.bean;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Projectbean {
	@Autowired
	private SqlMapClientTemplate sqlMap;// 자동으로 값 받아줌
	/*
	 * @SuppressWarnings("null")
	 * 
	 * @RequestMapping("a.nhn") public String test(){ return "/project/a.jsp"; }
	 */

	@RequestMapping("eventTeb.nhn")
	public String eventTab(HttpServletRequest request) {
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
		String path = request.getContextPath() + "/project/";
		HashMap<String, Integer> row = new HashMap<String, Integer>();
		row.put("startRow", startRow);
		row.put("endRow", endRow);
		eventList = sqlMap.queryForList("eventIng", row);
		// if(tab=="2") eventList = sqlMap.queryForList("eventEnd",row);
		// if(tab=="3")eventList = sqlMap.queryForList("upcomingEvent",row);
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
	public String event_end(HttpServletRequest request) {
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
		String path = request.getContextPath() + "/project/";
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
	public String upcoming_event(HttpServletRequest request) {
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
		String path = request.getContextPath() + "/project/";
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
	public String w_event(HttpServletRequest request){
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
		
		String path = request.getContextPath() + "/project/";
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
		String path = "C:\\Users\\user2\\workspace\\Spring\\WebContent\\project";
		int i = 0;
		while (iterator.hasNext()) {
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
	public String eventContent(HttpServletRequest request) {
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
		String path = request.getContextPath() + "/project/";
		eto = (EventDataBean) sqlMap.queryForObject("eventContent", enumber);
		srclist = eto.getEimg().split(",");
		if(eto.getWcouples() != null){
		wclist = eto.getWcouples().split(",");}
	
		eto.setEimg(path + srclist[1]);
		appList = sqlMap.queryForList("eventApp", row);
		count = (Integer) sqlMap.queryForObject("eventAppCount", enumber);
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
	public String addApp(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		
		request.setAttribute("enumber", new Integer(enumber));
		return "/project/addApp.jsp";
	}

	@RequestMapping("addAppPro.nhn")
	public String addAppPro(HttpServletRequest request, EventDataBean eto) {
		int test = 0;
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		// String cn = "커플잉";
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
	public String appContent(HttpServletRequest request) {
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		String tab = request.getParameter("tab");
		String pageNum = request.getParameter("pageNum");
		String memid = "admin";
		//String id = "gnn";
		EventDataBean app = new EventDataBean();
		app = (EventDataBean) sqlMap.queryForObject("getAppContent", appnumber);
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("enumber", new Integer(enumber));
		//request.setAttribute("id", id);
		request.setAttribute("memid", memid);
		request.setAttribute("app", app);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("tab", tab);
		return "/project/appContent.jsp";
	}
	
	@RequestMapping("appContentAdmin.nhn")
	public String appContentAdmin(HttpServletRequest request) {
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		String tab = request.getParameter("tab");
		String pageNum = request.getParameter("pageNum");
		String memid = "admin";
		//String id = "gnn";
		EventDataBean app = new EventDataBean();
		app = (EventDataBean) sqlMap.queryForObject("getAppContent", appnumber);
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("enumber", new Integer(enumber));
		//request.setAttribute("id", id);
		request.setAttribute("memid", memid);
		request.setAttribute("app", app);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("tab", tab);
		return "/project/appContentAdmin.jsp";
	}

	@RequestMapping("test.nhn") // 임의의 관리자 페이지
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
		String path = request.getContextPath() + "/project/";
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
		String path = "C:\\Users\\user2\\workspace\\Spring\\WebContent\\project";
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
		String path = request.getContextPath() + "/project/";
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
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		return "/project/wWay.jsp";
	}
	// 여기까지 git

	@RequestMapping("random.nhn")
	public String random(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		EventDataBean eto = new EventDataBean();
		List appList = null;
		appList = sqlMap.queryForList("eventAppAll", enumber);
		int[] wList = new int[wnumber];
		String[] rList = new String[wnumber];
		int count = (Integer) sqlMap.queryForObject("eventAppCount", enumber);
		Random ran = new Random();
		String wname = null;
		count = (Integer) sqlMap.queryForObject("eventAppCount", enumber);
		appList = sqlMap.queryForList("eventAppAll", enumber);
		if(count>0){
		for (int i = 0; i < wList.length; i++) {
			wList[i] = ran.nextInt(count) + 1;
			for (int j = 0; j < i; j++) {
				if (wList[i] == wList[j]) {
					i--;
					break;
				}
			}
			eto = (EventDataBean) appList.get(wList[i]);
			rList[i] = eto.getCouplename();
		}
		for (int i = 0; i < rList.length; i++) {
			if (i == 0) {
				wname = rList[i];
			}
			if (i != 0) {
				wname = wname + "," + rList[i];
			}
		}
		EventDataBean eto1 = new EventDataBean();
		eto1.setWcouples(wname);
		eto1.setEnumber(enumber);
	    eto1.setW(1);
		sqlMap.update("addW", eto1);
		}
		request.setAttribute("appList", appList);
		request.setAttribute("rList", rList);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("count", new Integer(count));
		return "/project/random.jsp";
	}

	@RequestMapping("choice.nhn")
	public String choice(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
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
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("count", new Integer(count));
		return "/project/choice.jsp";
	}

	@RequestMapping("appW.nhn")
	public String appW(HttpServletRequest request) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
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
		//int a = 1;
		if((wnumber-1)==0){
		app.setW(1);}
		sqlMap.update("addW", app);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber - 1));
		request.setAttribute("pageNum", pageNum);
		// request.setAttribute("appnumber", new Integer(appnumber));
		return "/project/appW.jsp";
	}

	@RequestMapping("appModify.nhn")
	public String appModify(HttpServletRequest request) {
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		EventDataBean app = new EventDataBean();
		app = (EventDataBean) sqlMap.queryForObject("getAppContent", appnumber);
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("app", app);
		return "/project/appModify.jsp";
	}

	@RequestMapping("appModifyPro.nhn")
	public String appModifyPro(HttpServletRequest request, EventDataBean app) {
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		request.setAttribute("enumber", new Integer(enumber));
		sqlMap.update("appModify", app);
		return "/project/appModifyPro.jsp";
	}

	@RequestMapping("appDelete.nhn")
	public String appDelete(HttpServletRequest request) {
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		sqlMap.delete("appDelete", appnumber);
		request.setAttribute("enumber", new Integer(enumber));
		return "/project/appDelete.jsp";
	}
	
	@RequestMapping("confirmPw.nhn")
	public String confirmPw(HttpServletRequest request) {
		int appnumber = Integer.parseInt(request.getParameter("appnumber"));
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int wnumber = Integer.parseInt(request.getParameter("wnumber"));
		int tab = Integer.parseInt(request.getParameter("tab"));
		//int apppw = Integer.parseInt(request.getParameter("apppw"));
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("appnumber", new Integer(appnumber));
		request.setAttribute("enumber", new Integer(enumber));
		request.setAttribute("wnumber", new Integer(wnumber));
		request.setAttribute("tab", new Integer(tab));
	//	request.setAttribute("apppw", new Integer(apppw));
		request.setAttribute("pageNum", pageNum);
		return "/project/confirmPw.jsp";
	}
	
	@RequestMapping("confirmPwPro.nhn")
	public String confirmPwPro(HttpServletRequest request, EventDataBean eto) {		
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
		String path = request.getContextPath() + "/project/";
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
}
