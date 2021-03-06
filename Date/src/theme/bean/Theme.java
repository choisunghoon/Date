package theme.bean;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import themeDTO.LikeCountDataBean;
import themeDTO.LocationDataBean;
import themeDTO.ReplyDataBean;
import upload.bean.PointDataBean;
import ch11.logon.LogonDataBean;
import share.pagingDTO;

@Controller
public class Theme {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("addCtg.nhn")	//카테고리를 추가하는 view페이지
	public String addCtg(HttpServletRequest request){
		
		int ctg_num = (Integer)sqlMap.queryForObject("selectCtgNum",null);	//ctg_num을 불러오는 쿼리문
		
		request.setAttribute("ctg_num", ctg_num);
		return "/theme/addCtg.jsp";
	}
	
	@RequestMapping("addCtgPro.nhn")	//파일 업로드, addCtg 페이지에서 입력한 정보를 DB에 입력하는 페이지
	public String addCtgPro(MultipartHttpServletRequest request,CtgDataBean dto) throws Exception{
		
		MultipartFile file = request.getFile("save");	//파일 업로드
		String orgName = file.getOriginalFilename();
		String RealPath = request.getRealPath("theme");
		File copy = new File(RealPath+"/"+orgName);
		
		file.transferTo(copy);
		request.setAttribute("pic", orgName);
		dto.setCtg_img(orgName);
		
		sqlMap.insert("insertCtg", dto);	//카테고리 정보를 DB에 입력하는 쿼리
		
		request.setAttribute("dto", dto);
		
		return "/theme/addCtgPro.jsp";
	}
	
	@RequestMapping("addCtgView.nhn")	//카테고리 view 페이지
	public String addCtgView(HttpServletRequest request,HttpSession session){
		session = request.getSession();
		String id = (String)session.getAttribute("id");	//id값을 세션으로 가져온다.
		
		CtgDataBean dto = new CtgDataBean();
		List ctgList = new ArrayList();
		int count = 0;
		
		String pageNum = request.getParameter("pageNum");	//페이징
		int pageSize = 6;
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("startRow", startRow);
		num.put("endRow", endRow);
		
		String[] srclist = null;
		String path = request.getContextPath() +"/theme/themeimg/";
		ctgList = sqlMap.queryForList("getCtgList", num);	// 입력된 카테고리 정보를 불러오는 쿼리문
		count = (Integer)sqlMap.queryForObject("ctgCount", null);	//ctg DB의 count를 가져오는 쿼리문
		
		for(int i=0; i<ctgList.size(); i++){
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
		request.setAttribute("id", id);
		
		return "/theme/addCtgView.jsp";
	}
	
	@RequestMapping("ctgModify.nhn")	//카테고리 수정페이지
	public String ctgModify(HttpServletRequest request,CtgDataBean dto){
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		
		dto = (CtgDataBean)sqlMap.queryForObject("getCtg", ctg_num);	//카테고리 정보를 가져오는 쿼리문
		
		request.setAttribute("dto", dto);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/ctgModify.jsp";
	}
	
	@RequestMapping("ctgModifyPro.nhn")	// 가져온 카테고리 정보를 수정하는 페이지
	public String ctgModifyPro(MultipartHttpServletRequest request,CtgDataBean dto)throws Exception{
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		
		MultipartFile file = request.getFile("save");	//파일업로드
		String orgName = file.getOriginalFilename();
		String RealPath = request.getRealPath("theme");
		File copy = new File(RealPath+"/"+orgName);
		
		if(!file.isEmpty()){	//파일값이 없을 경우 기존에 있는 이름을 dto에 저장한다.
		file.transferTo(copy);
		request.setAttribute("pic", orgName);
		dto.setCtg_img(orgName);
		dto.setCtg_num(ctg_num);
		sqlMap.update("ctgModify", dto);	//카테고리를 수정하는 쿼리문
		}else{	//입력된 파일 값이 있을경우 입력된 파일값을 dto에 입력한다.
		dto.setCtg_num(ctg_num);
		sqlMap.update("ctgModify1", dto);	
		}
		request.setAttribute("ctg_num", ctg_num);
		return "/theme/ctgModifyPro.jsp";
		
	}
	
	@RequestMapping("ctgDel.nhn")	//카테고리를 삭제 뷰 페이지
	public String ctgDel(HttpSession session,HttpServletRequest request,LogonDataBean dto){
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		session = request.getSession();
		String id = (String)session.getAttribute("id");

		request.setAttribute("id", id);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/ctgDel.jsp";
	}
	
	@RequestMapping("ctgDelPro.nhn")	//카테고리를 삭제하는 페이지
	public String ctgDelPro(HttpSession session,HttpServletRequest request,LogonDataBean dto,CtgDataBean dto1){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));

		dto.setId(id);
		dto.setPw(pw);

		int check = (Integer)sqlMap.queryForObject("deleteProck",dto);	//로그인된 아이디가 DB에 있는지 확인하는 쿼리문
		if(check == 1){
			sqlMap.delete("deleteCtg",dto1);	//카테고리를 삭제하는 쿼리문
		}
		request.setAttribute("check", check);
		return "/theme/ctgDelPro.jsp";
	}
	
	@RequestMapping("addCourse.nhn")	//코스를 입력하는 뷰페이지
	public String addCourse(HttpServletRequest request){
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		
		int cos_num = (Integer)sqlMap.queryForObject("selectCosNum",null);	//cos_num값을 가져오는 쿼리문
		
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		return "/theme/addCourse.jsp";
	}
	
	@RequestMapping("addCoursePro.nhn")	//입력받은 정보를 course DB에 입력하는 페이지
	public String addCoursePro(HttpServletRequest request,CourseDataBean dto) throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;// 파일업로드
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[2];
		String path = "C:\\Users\\sam3\\git\\Date\\Date\\WebContent\\theme\\themeimg";
		int i = 0;
		while(iterator.hasNext()){	//값이 있는지 반복자로 확인후 src배열에 집어넣는다.
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			originalFileName = multipartFile.getOriginalFilename();
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
	        i++;
	    }
		
		dto.setCos_img(src[0]);	//배열에 저장된 첫번째 값을 dto에 저장한다.
		dto.setMap_img(src[1]); //배열에 저장된 두번쨰 값을 dto에 저장한다.
		dto.setCtg_num(ctg_num);
		
		sqlMap.insert("insertCos", dto);	//코스를 DB에 저장하는 쿼리문
		
		request.setAttribute("dto", dto);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/addCoursePro.jsp";
	}
	
	@RequestMapping("course.nhn") //코스를 보여주는 뷰페이지
	public String course(HttpServletRequest request,HttpSession session){
		
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		
		CourseDataBean dto = new CourseDataBean();
		List courseList = null;
		int count = 0;
		int cos_num;
		
		String[] srclist = null;
		String path = request.getContextPath() +"/theme/themeimg/";
		courseList = sqlMap.queryForList("getCourseList", ctg_num);	//코스 DB에 저장된 정보를 가져오는 쿼리문
		count = (Integer)sqlMap.queryForObject("courseCount", ctg_num);	//DB에 저장된 count값을 가져오는 쿼리문
		
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
		request.setAttribute("id", id);

		return "/theme/course.jsp";
	}
	
	@RequestMapping("courseModify.nhn")	//코스를 수정하는 뷰페이지
	public String courseModify(HttpServletRequest request,CourseDataBean dto){
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("ctg_num", ctg_num);
		num.put("cos_num", cos_num);
		
		dto = (CourseDataBean)sqlMap.queryForObject("getCourse", num);	//코스정보를 가져오는 쿼리문
		
		request.setAttribute("dto", dto);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/courseModify.jsp";
	}
	
	@RequestMapping("courseModifyPro.nhn")	//코스를 수정하는 페이지
	public String courseModifyPro(HttpServletRequest request,CourseDataBean dto)throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		String cos_img = request.getParameter("cos_img");
		String map_img = request.getParameter("map_img");
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;	//파일업로드
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[2];
		String path = "C:\\Users\\sam3\\git\\Date\\Date\\WebContent\\theme\\themeimg";
		int i = 0;
		String[] srclist = new String[2];
		CourseDataBean dto1 = new CourseDataBean();

			while(iterator.hasNext()){
				multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				if(multipartFile.isEmpty()){
					dto1 = (CourseDataBean) sqlMap.queryForObject("getCosImg", cos_num);	//cos_img를 가져오는 쿼리문
					srclist[0] = dto1.getMap_img();
					srclist[1] = dto1.getCos_img();
					originalFileName = srclist[i];
				}else{
				originalFileName = multipartFile.getOriginalFilename();
				}
				multipartFile.transferTo(new File(path + originalFileName));
				src[i] = originalFileName;
		        i++;
		    }
			
			dto.setMap_img(src[0]);
			dto.setCos_img(src[1]);
			dto.setCtg_num(ctg_num);
			dto.setCos_num(cos_num);
		
			sqlMap.update("courseModify", dto);	//코스를 수정하는 쿼리문
		
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/courseModifyPro.jsp";
	}
	
	@RequestMapping("cosDel.nhn")	//코스를 삭제하는 뷰페이지
	public String cosDel(HttpServletRequest request){
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/cosDel.jsp";
	}
	
	@RequestMapping("cosDelPro.nhn")	//코스를 삭제하는 페이지
	public String cosDelPro(HttpSession session,HttpServletRequest request,LogonDataBean dto,CourseDataBean dto1){
		
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		dto.setId(id);
		dto.setPw(pw);
		dto1.setCtg_num(ctg_num);
		dto1.setCos_num(cos_num);
		
		int check = (Integer)sqlMap.queryForObject("deleteProck",dto);	//DB에 아이디 값이 있으면 check값이 1이 된다.
		if(check == 1){
			sqlMap.delete("deleteCos",dto1);	//check값이 1일때 코스를 삭제하는 쿼리문
		}
		request.setAttribute("check", check);
		request.setAttribute("ctg_num", ctg_num);
		
		return "/theme/cosDelPro.jsp";
	}
	
	@RequestMapping("place.nhn")	//코스 상세정보를 보여주는 페이지
	public String place(HttpSession session,HttpServletRequest request,LocationDataBean dto,CourseDataBean dto1){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		List placeList = null;
		int checkNum = 0;
		
		LikeCountDataBean dto3 = new LikeCountDataBean();
		dto3.setId(id);
		dto3.setCos_num(cos_num);
		dto3.setCtg_num(ctg_num);

		int count = (Integer) sqlMap.queryForObject("getLikeCount", dto3);
		
		if(id != null){
			LikeCountDataBean dto2 = new LikeCountDataBean();
			dto2.setId(id);
			dto2.setCtg_num(ctg_num);
			dto2.setCos_num(cos_num);
		
			if(count > 0){ 
				checkNum = (Integer) sqlMap.queryForObject("getCheckNum", dto2);
			}else if(count == 0){
				checkNum = 0;
			}
		}
		
		int placeCount = (int) sqlMap.queryForObject("getPlaceCount", cos_num);
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("ctg_num", ctg_num);
		num.put("cos_num", cos_num);
		
		sqlMap.update("cosReadcount", cos_num);
		dto1 = (CourseDataBean)sqlMap.queryForObject("getCos" , cos_num);
		
		String[] srclist = null;
		String path = request.getContextPath() +"/theme/themeimg/";
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
		request.setAttribute("checkNum", checkNum);
		request.setAttribute("placeCount", placeCount);
		request.setAttribute("id", id);
		
		return "/theme/place.jsp";
	}
	
	@RequestMapping("addPlace.nhn")	//장소를 추가하는 뷰페이지
	public String addPlace(HttpServletRequest request,LocationDataBean dto) throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int count = 0;
		
		HashMap<String, Integer> num = new HashMap<String, Integer>();
		num.put("ctg_num", ctg_num);
		num.put("cos_num", cos_num);
		
		count = (Integer)sqlMap.queryForObject("placeCount", num);
		
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		request.setAttribute("count", (Integer)count);
		
		return "/theme/addPlace.jsp";
		
	}
	
	@RequestMapping("addPlacePro.nhn")	//장소를 추가하는 페이지
	public String addPlacePro(HttpServletRequest request,LocationDataBean dto) throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int loc_num = 0;
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[4];
		String path = "C:\\Users\\sam3\\git\\Date\\Date\\WebContent\\theme\\themeimg";
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
		dto.setLoc_pic2(src[2]);
		dto.setLoc_pic3(src[3]);
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
	
	
	@RequestMapping("placeView.nhn")	//상세정보를 보여주는 뷰페이지
	public String PlaceView(HttpServletRequest request,LocationDataBean dto){
		int loc_num = Integer.parseInt(request.getParameter("loc_num"));
		
		sqlMap.update("locReadcount", loc_num);
		dto = (LocationDataBean)sqlMap.queryForObject("getPlace1" , loc_num);
		
		request.setAttribute("loc_num", loc_num);
		request.setAttribute("dto", dto);
		return "/theme/placeView.jsp";
	}
	
	@RequestMapping("placeModify.nhn")	//상세정보를 수정하는 뷰페이지
	public String placeModify(HttpServletRequest request,LocationDataBean dto){
		
		int loc_num = Integer.parseInt(request.getParameter("loc_num"));
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		
		dto = (LocationDataBean)sqlMap.queryForObject("getPlace1", loc_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("loc_num", loc_num);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
			
		return "/theme/placeModify.jsp";
	}
	
	@RequestMapping("placeModifyPro.nhn")	//장소를 수정하는 페이지
	public String placeModifyPro(HttpServletRequest request,LocationDataBean dto) throws Exception{
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int loc_num = Integer.parseInt(request.getParameter("loc_num"));
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[4];
		String path = "C:\\Users\\sam3\\git\\Date\\Date\\WebContent\\theme\\themeimg";
		int i = 0;
		String[] srclist = new String[4];
		LocationDataBean dto1 = new LocationDataBean();
		
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()){
				dto1 = (LocationDataBean)sqlMap.queryForObject("getLocImg", loc_num);
				srclist[0] = dto1.getLoc_pic();
				srclist[1] = dto1.getLoc_pic1();
				srclist[2] = dto1.getLoc_pic2();
				srclist[3] = dto1.getLoc_pic3();
				originalFileName = srclist[i];
			}else{
			originalFileName = multipartFile.getOriginalFilename();
			}
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
	        i++;
	    }
		
		dto.setLoc_pic(src[0]);
		dto.setLoc_pic1(src[1]);
		dto.setLoc_pic2(src[2]);
		dto.setLoc_pic3(src[3]);
		dto.setCtg_num(ctg_num);
		dto.setCos_num(cos_num);
		dto.setLoc_num(loc_num);
		
		sqlMap.update("placeModify", dto);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		request.setAttribute("loc_num", loc_num);
		
		return "/theme/placeModifyPro.jsp";
	}
	
	@RequestMapping("placeDel.nhn")	//장소를 삭제하는 뷰페이지
	public String placeDel(HttpServletRequest request){
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int loc_num = Integer.parseInt(request.getParameter("loc_num"));	
		
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		request.setAttribute("loc_num", loc_num);
		
		return "/theme/placeDel.jsp";
	}
	
	@RequestMapping("placeDelPro.nhn")	//장소를 삭제하는 페이지
	public String placeDelPro(HttpSession session,HttpServletRequest request,LogonDataBean dto,LocationDataBean dto1){
		
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int loc_num = Integer.parseInt(request.getParameter("loc_num"));
		dto.setId(id);
		dto.setPw(pw);
		dto1.setCtg_num(ctg_num);
		dto1.setCos_num(cos_num);
		dto1.setLoc_num(loc_num);
		
		int check = (Integer)sqlMap.queryForObject("deleteProck",dto);
		if(check == 1){
			sqlMap.delete("deleteLoc",dto1);
		}
		request.setAttribute("check", check);
		request.setAttribute("ctg_num", ctg_num);
		request.setAttribute("cos_num", cos_num);
		
		return "/theme/placeDelPro.jsp";
	}
	
	@RequestMapping("likeCount.nhn")	//좋아요를 처리하는 페이지
	public String likeCount(HttpSession session,HttpServletRequest request){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int ctg_num = Integer.parseInt(request.getParameter("ctg_num"));
		int cos_num = Integer.parseInt(request.getParameter("cos_num"));
		int checkNum = Integer.parseInt(request.getParameter("checkNum"));
		
		LikeCountDataBean dto = new LikeCountDataBean();
		CourseDataBean dto1 = new CourseDataBean();
		
		dto.setId(id);
		dto.setCtg_num(ctg_num);
		dto.setCos_num(cos_num);
		dto1.setCtg_num(ctg_num);
		dto1.setCos_num(cos_num);
		
		int count = (Integer) sqlMap.queryForObject("getLikeCount", dto);
		
		LikeCountDataBean dto2 = new LikeCountDataBean();
		dto2.setId(id);
		dto2.setCtg_num(ctg_num);
		dto2.setCos_num(cos_num);
		
		if(count > 0){
			checkNum = (Integer) sqlMap.queryForObject("getCheckNum", dto2);
		}else if(count == 0){
			checkNum = 0;
		}

		int check = (Integer)sqlMap.queryForObject("cosLikeCount",dto);
		if(check == 1){
			sqlMap.update("cosLikeCountDown", dto1);
			sqlMap.delete("deleteCosLike", dto);
		}else{
			sqlMap.update("cosLikeCountUp", dto1);
			sqlMap.insert("insertCosLike",dto);
		}
		
			dto1 = (CourseDataBean) sqlMap.queryForObject("getCosLikeCount",dto1);
			request.setAttribute("dto1", dto1);
			request.setAttribute("checkNum", checkNum);
			request.setAttribute("ctg_num", ctg_num);
			request.setAttribute("cos_num", cos_num);
		
		return "/theme/cosLikeCount.jsp";
	}
	

}