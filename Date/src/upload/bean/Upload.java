package upload.bean;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class Upload {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/ex.nhn")
	public String ex(HttpServletRequest request){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		request.setAttribute("couplename", couplename);
		return "/sy0525/ex.jsp";
	}
	
	@RequestMapping("/upload2.nhn")
	public String upload(MultipartHttpServletRequest request,DiaryDataBean ddb, PointDataBean pidb, CoupleDataBean cdb) throws Exception{
		int w = Integer.parseInt(request.getParameter("w"));
		int h = Integer.parseInt(request.getParameter("h"));
		int wwd= 1000;
		int hhd = 1000;
		int check;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		String RealPath = request.getRealPath("\\syimage");
		if(w <= wwd && h <= hhd){
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		ddb.setImg(orgName);
		ddb.setCouplename(couplename);
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMap.insert("insertDiary",ddb);
		int getPoint = 5;
		String place="커플다이어리";
		pidb.setCouplename(couplename);
		pidb.setGetPoint(getPoint);
		pidb.setPlace(place);
		sqlMap.insert("diarypoint", pidb);
		cdb.setCouplename(couplename);
		int point = (Integer)sqlMap.queryForObject("getpoint", cdb);
		int point2 = point + 5;
		cdb.setPoint(point2);
		sqlMap.update("photopoint", cdb);
		request.setAttribute("orgName", orgName);
		check=1;
		}
		else{
			System.out.println("실패");
			check = 2;
		}
		request.setAttribute("check", check);
		return "/sy0525/upload2.jsp";
	}
	
	@RequestMapping("/diary.nhn")
	public String diary(HttpSession session,HttpServletRequest request){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		request.setAttribute("couplename", couplename);
		return "/sy0525/diary.jsp";
	}
	
	
	@RequestMapping("/diaryMenu.nhn")
	public String diaryMenu(HttpSession session,HttpServletRequest request,DiaryDataBean ddb, CoupleDataBean cdb){
		List diary =null;
		int listMore = 3;
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		System.out.println("diaryMenu.nhn :" + couplename);
		ddb.setCouplename(couplename);
		diary = sqlMap.queryForList("myDiary", ddb);
		cdb.setCouplename(couplename);
		cdb = (CoupleDataBean)sqlMap.queryForObject("diaryImage", cdb);
		int totalCnt = (Integer)sqlMap.queryForObject("myDiary1", ddb);
		
		
		request.setAttribute("couplename", couplename);
		request.setAttribute("listMore", listMore);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("diary", diary);
		request.setAttribute("cdb", cdb);
		return "/sy0525/diaryMenu.jsp";
	}
	
	@RequestMapping("/DiaryModify.nhn")
	public String DiaryModify(HttpSession session,HttpServletRequest request,DiaryDataBean ddb){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		System.out.println(couplename);
		ddb.setCouplename(couplename);
		ddb.setNum(num);
		ddb = (DiaryDataBean)sqlMap.queryForObject("modifyDiary", ddb);
		request.setAttribute("ddb", ddb);
		request.setAttribute("couplename", couplename);
		return "/sy0525/DiaryModify.jsp";
	}
	
	@RequestMapping("/DiaryModifyPro.nhn")
	public String DiaryModifyPro(HttpSession session,MultipartHttpServletRequest request,DiaryDataBean ddb)throws Exception{
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		String RealPath = request.getRealPath("\\syimage");
		int num = Integer.parseInt(request.getParameter("num"));
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		ddb.setNum(num);
		ddb.setCouplename(couplename);
		if(!file.isEmpty()){
			ddb.setImg(orgName);
			File copy = new File(RealPath+"/"+orgName);
			file.transferTo(copy);
			sqlMap.update("updateDiary", ddb);
		}else{
			sqlMap.update("updateDiary1", ddb);
		}
		
		return "/sy0525/DiaryModifyPro.jsp";
	}
	
	@RequestMapping("/DiaryDelete.nhn")
	public String DiaryDelete(HttpSession session,HttpServletRequest request,DiaryDataBean ddb){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		request.setAttribute("couplename", couplename);
		return "/sy0525/DiaryDelete.jsp";
	}
	
	@RequestMapping("/DiaryDeletePro.nhn")
	public String DiaryDeletePro(HttpSession session,HttpServletRequest request,DiaryDataBean ddb){
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		ddb.setCouplename(couplename);
		ddb.setNum(num);
		sqlMap.delete("deleteDiary", ddb);
		return "/sy0525/DiaryDeletePro.jsp";
	}
	
	@RequestMapping("/updateImage.nhn")
	public String updateImage(HttpSession session, MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);

		String RealPath = request.getRealPath("\\syimage");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		cdb.setCoupleimage(orgName);
		cdb.setCouplename(couplename);
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMap.insert("diaryimgUpdate",cdb);
		request.setAttribute("orgName", orgName);

		return "/sy0525/updateImage.jsp";
	}
	
	@RequestMapping("/photo.nhn")
	public String photo(){
		return "/sy0610/photo.jsp";
	}
	
	@RequestMapping("/photorequest.nhn")
	public String photorequest(HttpSession session,HttpServletRequest request,DiaryDataBean ddb, CoupleDataBean cdb){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		List diary = null;
		int listMore = 3;
		ddb.setCouplename(couplename);
		cdb.setCouplename(couplename);
		int point = (Integer)sqlMap.queryForObject("getpoint", cdb);
		diary = sqlMap.queryForList("myDiary", ddb);
		int totalCnt = (Integer)sqlMap.queryForObject("myDiary1", ddb);
		
		request.setAttribute("point", point);
		request.setAttribute("diary", diary);
		request.setAttribute("couplename", couplename);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("listMore", listMore);
		
		return "/sy0610/photorequest.jsp";
	}
	
	@RequestMapping("/adminphoto.nhn")
	public String adminphoto(HttpServletRequest request, DiaryDataBean ddb, PhotoDataBean pdb, CoupleDataBean cdb,PointDataBean pidb){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		String[] str = request.getParameterValues("photocheck");
		ddb.setCouplename(couplename);
		cdb.setCouplename(couplename);
		int point = (Integer)sqlMap.queryForObject("getpoint", cdb);
		int point1 = point - 300;
		cdb.setPoint(point1);
		sqlMap.update("photopoint", cdb);
		
		int usePoint= -300;
		String place="포토북";
		pidb.setCouplename(couplename);
		pidb.setUsePoint(usePoint);
		pidb.setPlace(place);
		
		sqlMap.insert("insertpoint",pidb );
		String state="신청";
		String a = "";
		String b = "";
		String c = "";
		for(int i =0;i<str.length;i++){
			ddb.setNum(Integer.parseInt(str[i]));
			ddb = (DiaryDataBean)sqlMap.queryForObject("num",ddb);
			if(i == str.length-1){
				a += ddb.getSubject();	
				b += ddb.getImg();
				c += String.valueOf(ddb.getRegdate());
			}else {
			a += ddb.getSubject()+",";	
			b += ddb.getImg()+",";
			c += String.valueOf(ddb.getRegdate())+",";
			}
			
		}
		
		pdb.setContent(a);
		pdb.setCouplename(ddb.getCouplename());
		pdb.setImg(b);
		pdb.setState(state);
		pdb.setWriteday(c);
		sqlMap.insert("photo", pdb);
		return "/sy0610/adminphoto.jsp";
	}
	
	@RequestMapping("/adphoto.nhn")
	public String adphoto(HttpServletRequest request){
		List photo = null;
		photo = sqlMap.queryForList("adphoto", null);
		request.setAttribute("photo", photo);
		return "/sy0610/adphoto.jsp";
	}
	
	@RequestMapping("/state.nhn")
	public String state(HttpServletRequest request){
		String couplename = request.getParameter("couplename");
		String regdate = String.valueOf(request.getParameter("regdate"));
		request.setAttribute("couplename", couplename);
		request.setAttribute("regdate", regdate);
		return "/sy0610/state.jsp";
	}
	
	@RequestMapping("/statepro.nhn")
	public String statepro(HttpServletRequest request,PhotoDataBean pdb){
		String couplename1 = request.getParameter("couplename1");
		System.out.println("asdasdas");
		String regdate1 = request.getParameter("regdate1");
		int state = Integer.parseInt(request.getParameter("states"));
		String states=null;
		if(state == 1){
			states = "신청";
		}else if(state == 2){
			states ="진행중";
		}else{
			states = "진행완료";
		}
		pdb.setCouplename(couplename1);
		pdb.setRegdate(Timestamp.valueOf(regdate1));
		pdb.setState(states);
		sqlMap.update("updatestate", pdb);
		return "/sy0610/statepro.jsp";
	}
	
	@RequestMapping("/photocontent.nhn")
	public String photocontent(HttpServletRequest request,PhotoDataBean pdb){
		String couplename = request.getParameter("couplename1");
		String regdate = String.valueOf(request.getParameter("regdate1"));	
		pdb.setCouplename(couplename);
		pdb.setRegdate(Timestamp.valueOf(regdate));
		pdb = (PhotoDataBean)sqlMap.queryForObject("photocontent", pdb);
		List admin = new ArrayList();
		String[] content = pdb.getImg().split(",");
		String[] content1 = pdb.getContent().split(",");
		String[] content2 = pdb.getWriteday().split(",");
		for(int i=0; i < content.length; i++){
			PhotoDataBean pdb2= new PhotoDataBean();
			pdb2.setImg(content[i]);
			pdb2.setContent(content1[i]);
			pdb2.setWriteday(content2[i]);
			admin.add(pdb2);		
		}
		
		
		
		request.setAttribute("pdb", pdb);
		request.setAttribute("admin", admin);
		
		return "/sy0610/photocontent.jsp";
	}
	
	@RequestMapping("/adminpage.nhn")
	public String adminpage(){
		return "/sy0526/AdminPage.jsp";
	}
	
	@RequestMapping("/userPhoto.nhn")
	public String userPhoto(HttpSession session, HttpServletRequest request,DiaryDataBean ddb){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		int num = Integer.parseInt(request.getParameter("num"));
		ddb.setCouplename(couplename);
		ddb.setNum(num);
		ddb = (DiaryDataBean)sqlMap.queryForObject("modifyDiary",ddb);
		request.setAttribute("ddb", ddb);
		
		return "/sy0610/userPhoto.jsp";
	}
	
	@RequestMapping("/diarysharing.nhn")
	public String diarysharing(HttpSession session, HttpServletRequest request, DiaryDataBean ddb){
		int check = Integer.parseInt(request.getParameter("check"));
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		int num = Integer.parseInt(request.getParameter("num"));
		ddb.setCouplename(couplename);
		ddb.setNum(num);
		String pool = "";
		if(check == 1){
		pool = "1";
		}else{
		pool = "0";
		}
		ddb.setPool(pool);
		sqlMap.insert("poolshare", ddb);
		request.setAttribute("check", check);
		return "/sy0525/diarysharing.jsp";
	}
	@RequestMapping("/photocheck.nhn")
	public String photocheck(HttpSession session, HttpServletRequest request, PhotoDataBean pdb){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		pdb.setCouplename(couplename);
		List photo = null;
		photo = sqlMap.queryForList("myphoto", pdb);
		System.out.println(photo.size());
		/*
		pdb = (PhotoDataBean)sqlMap.queryForList("myphoto", pdb);
		
		int count = (Integer)sqlMap.queryForObject("myphoto1", pdb);
		
		List aa = new ArrayList();
		
		String[] a1 = pdb.getImg().split(",");
		String[] a2 = pdb.getContent().split(",");
		String[] a3 = pdb.getWriteday().split(",");
		
		for(int i=0; i < a1.length; i++){
			PhotoDataBean pdd = new PhotoDataBean();
			pdd.setImg(a1[i]);
			pdd.setContent(a2[i]);
			pdd.setWriteday(a3[i]);
			aa.add(pdd);
			System.out.println(i +":" +pdd.getImg());
		}
		
		request.setAttribute("aa", aa);
		request.setAttribute("pdb", pdb);
		*/
		request.setAttribute("photo", photo);

		return "/sy0630/photocheck.jsp";
	}
	
	@RequestMapping("/photocheckcontent.nhn")
	public String photocheckcontent(HttpSession session, HttpServletRequest request,PhotoDataBean pdb){
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("getcouplename", id);
		String regdate = String.valueOf(request.getParameter("regdate1"));
		pdb.setCouplename(couplename);
		pdb.setRegdate(Timestamp.valueOf(regdate));
		pdb = (PhotoDataBean)sqlMap.queryForObject("photocontent", pdb);
		
		List aa = new ArrayList();
		
		String[] a1 = pdb.getImg().split(",");
		String[] a2 = pdb.getContent().split(",");
		String[] a3 = pdb.getWriteday().split(",");
		
		for(int i=0; i < a1.length; i++){
			PhotoDataBean pdd = new PhotoDataBean();
			pdd.setImg(a1[i]);
			pdd.setContent(a2[i]);
			pdd.setWriteday(a3[i]);
			aa.add(pdd);
			System.out.println(i +":" +pdd.getImg());
		}
		
		request.setAttribute("aa", aa);
		request.setAttribute("pdb", pdb);


		return "/sy0630/photocheckcontent.jsp";
	}
	

}
