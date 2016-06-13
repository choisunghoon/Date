package theme.bean;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import themeDTO.CourseDataBean;
import themeDTO.CtgDataBean;
import themeDTO.LocationDataBean;
import ch11.logon.LogonDataBean;

@Controller
public class Theme {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("addCtg.nhn")
	public String addCtg(){
		return "/theme/addCtg.jsp";
	}
	
	@RequestMapping("addCtgPro.nhn")
	public String addCtgPro(MultipartHttpServletRequest request,CtgDataBean dto) throws Exception{
		
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		String RealPath = request.getRealPath("theme");
		File copy = new File(RealPath+"/"+orgName);
		
		file.transferTo(copy);
		request.setAttribute("pic", orgName);
		dto.setCtg_img(orgName);
		
		sqlMap.insert("insertCtg", dto);
		
		request.setAttribute("dto", dto);
		
		return "/theme/addCtgPro.jsp";
	}
	
	@RequestMapping("addCtgView.nhn")
	public String addCtgView(HttpServletRequest request){
		CtgDataBean dto = new CtgDataBean();
		List ctgList = null;
		int count = 0;
		
		String pageNum = request.getParameter("pageNum");
		int pageSize = 6;
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;	
		
		String[] srclist = null;
		String path = request.getContextPath() +"/theme/";
		ctgList = sqlMap.queryForList("getCtgList", null);
		count = (Integer)sqlMap.queryForObject("ctgCount", null);
		
		for(int i=0; i<count; i++){
			dto = (CtgDataBean)ctgList.get(i);
			srclist = dto.getCtg_img().split(",");
			dto.setCtg_img(path + srclist[0]);
		}
		
		request.setAttribute("ctgList", ctgList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow",startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		
		return "/theme/addCtgView.jsp";
	}
	
	@RequestMapping("ctgModify.nhn")
	public String ctgModify(HttpServletRequest request,CtgDataBean dto){
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		
		dto = (CtgDataBean)sqlMap.queryForObject("getCtg", ctg_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/ctgModify.jsp";
	}
	
	@RequestMapping("ctgModifyPro.nhn")
	public String ctgModifyPro(MultipartHttpServletRequest request,CtgDataBean dto)throws Exception{
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		String RealPath = request.getRealPath("theme");
		File copy = new File(RealPath+"/"+orgName);
		
		file.transferTo(copy);
		request.setAttribute("pic", orgName);
		dto.setCtg_img(orgName);
		dto.setCtg_num(ctg_num);
		
		sqlMap.update("ctgModify", dto);
		request.setAttribute("ctg_num", ctg_num);
		return "/theme/ctgModifyPro.jsp";
		
	}
	
	@RequestMapping("ctgDel.nhn")
	public String ctgDel(HttpSession session,HttpServletRequest request,LogonDataBean dto){
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		session = request.getSession();
		String id = (String)session.getAttribute("id");

		request.setAttribute("id", id);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/ctgDel.jsp";
	}
	
	@RequestMapping("ctgDelPro.nhn")
	public String ctgDelPro(HttpSession session,HttpServletRequest request,LogonDataBean dto,CtgDataBean dto1){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));

		dto.setId(id);
		dto.setPw(pw);

		int check = (Integer)sqlMap.queryForObject("deleteProck",dto);
		if(check == 1){
			sqlMap.delete("deleteCtg",dto1);
		}
		request.setAttribute("check", check);
		return "/theme/ctgDelPro.jsp";
	}
	
	@RequestMapping("addCourse.nhn")
	public String addCourse(HttpServletRequest request){
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		request.setAttribute("ctg_num", ctg_num);
		return "/theme/addCourse.jsp";
	}
	
	@RequestMapping("addCoursePro.nhn")
	public String addCoursePro(HttpServletRequest request,CourseDataBean dto) throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[2];
		String path = "F:\\workplace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Date\\theme";
		int i = 0;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			originalFileName = multipartFile.getOriginalFilename();
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
	        i++;
	    }
		
		dto.setCos_img(src[0]);
		dto.setMap_img(src[1]);
		dto.setCtg_num(ctg_num);
		
		sqlMap.insert("insertCos", dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/addCoursePro.jsp";
	}
	
	@RequestMapping("course.nhn")
	public String course(HttpServletRequest request){
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		System.out.println(ctg_num);
		
		CourseDataBean dto = new CourseDataBean();
		List courseList = null;
		int count = 0;
		int cos_num;
		
		String[] srclist = null;
		String path = request.getContextPath() +"/theme/";
		courseList = sqlMap.queryForList("getCourseList", ctg_num);
		count = (Integer)sqlMap.queryForObject("courseCount", ctg_num);
		
		cos_num = (Integer)dto.getCos_num();
		
		for(int i=0; i<count; i++){
			dto = (CourseDataBean)courseList.get(i);
			srclist = dto.getCos_img().split(",");
			dto.setCos_img(path + srclist[0]);
		}
		
		request.setAttribute("courseList", courseList);
		request.setAttribute("count", (Integer)count);
		request.setAttribute("cos_num", cos_num);
		request.setAttribute("ctg_num", ctg_num);

		return "/theme/course.jsp";
	}
	
	@RequestMapping("courseModify.nhn")
	public String courseModify(HttpServletRequest request,CourseDataBean dto){
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("ctg_num", ctg_num);
		num.put("cos_num", cos_num);
		
		dto = (CourseDataBean)sqlMap.queryForObject("getCourse", num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/courseModify.jsp";
	}
	
	@RequestMapping("courseModifyPro.nhn")
	public String courseModifyPro(HttpServletRequest request,CourseDataBean dto)throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[2];
		String path = "F:\\workplace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Date\\theme";
		int i = 0;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			originalFileName = multipartFile.getOriginalFilename();
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
	        i++;
	    }
		
		dto.setCos_img(src[0]);
		dto.setMap_img(src[1]);
		dto.setCtg_num(ctg_num);
		dto.setCos_num(cos_num);
		
		sqlMap.update("courseModify", dto);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/courseModifyPro.jsp";
	}
	
	@RequestMapping("cosDel.nhn")
	public String cosDel(HttpServletRequest request){
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/cosDel.jsp";
	}
	
	@RequestMapping("cosDelPro.nhn")
	public String cosDelPro(HttpSession session,HttpServletRequest request,LogonDataBean dto,CourseDataBean dto1){
		
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		dto.setId(id);
		dto.setPw(pw);
		System.out.println(ctg_num);
		System.out.println(cos_num);
		dto1.setCtg_num(ctg_num);
		dto1.setCos_num(cos_num);
		
		int check = (Integer)sqlMap.queryForObject("deleteProck",dto);
		System.out.println(check);
		if(check == 1){
			sqlMap.delete("deleteCos",dto1);
		}
		request.setAttribute("check", check);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/cosDelPro.jsp";
	}
	
	@RequestMapping("place.nhn")
	public String place(HttpServletRequest request,LocationDataBean dto,CourseDataBean dto1){
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		
		List placeList = null;
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("ctg_num", ctg_num);
		num.put("cos_num", cos_num);
		
		dto1 = (CourseDataBean)sqlMap.queryForObject("getCos" , cos_num);
		
		String[] srclist = null;
		String path = request.getContextPath() +"/theme/";
		placeList = sqlMap.queryForList("getPlace", num);
		
		for(int i=0; i == 3; i++){
			dto = (LocationDataBean)placeList.get(i);
			srclist = dto.getLoc_pic().split(",");
			dto.setLoc_pic(path + srclist[0]);
		}
		
		request.setAttribute("placeList", placeList);
		request.setAttribute("dto1", dto1);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/place.jsp";
	}
	
	@RequestMapping("addPlace.nhn")
	public String addPlace(HttpServletRequest request,LocationDataBean dto) throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int count = 0;
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("ctg_num", ctg_num);
		num.put("cos_num", cos_num);
		
		count = (Integer)sqlMap.queryForObject("placeCount", num);
		
		System.out.println(count);
		
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		request.setAttribute("count", (Integer)count);
		
		return "/theme/addPlace.jsp";
		
	}
	
	@RequestMapping("addPlacePro.nhn")
	public String addPlacePro(HttpServletRequest request,LocationDataBean dto) throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int loc_num = 0;
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[2];
		String path = "F:\\workplace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Date\\theme";
		int i = 0;
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			originalFileName = multipartFile.getOriginalFilename();
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
	        i++;
	    }
		
		dto.setLoc_pic(src[0]);
		dto.setLoc_pic1(src[1]);
		dto.setCtg_num(ctg_num);
		dto.setCos_num(cos_num);
		
		sqlMap.insert("insertLoc", dto);
		
		loc_num = (Integer)sqlMap.queryForObject("selectlocnum", null);
		
		request.setAttribute("dto", dto);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		request.setAttribute("loc_num", loc_num);
		
		
		return "/theme/addPlacePro.jsp";
	}
	
	
	@RequestMapping("placeView.nhn")
	public String PlaceView(HttpServletRequest request,LocationDataBean dto){
		int loc_num = Integer.parseInt(request.getParameter("loc_num"));
		System.out.println(loc_num);
		
		dto = (LocationDataBean)sqlMap.queryForObject("getPlace1" , loc_num);
		
		request.setAttribute("dto", dto);
		return "/theme/placeView.jsp";
	}
	

}
