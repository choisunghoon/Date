package upload.bean;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/ex1.nhn")
	public String ex1(){
		return "/sy0524/ex.jsp";
	}
	
	@RequestMapping("/ex.nhn")
	public String ex(){
		return "/sy0525/ex.jsp";
	}
	
	@RequestMapping("/upload2.nhn")
	public String upload(MultipartHttpServletRequest request,DiaryDataBean ddb) throws Exception{
		int w = Integer.parseInt(request.getParameter("w"));
		int h = Integer.parseInt(request.getParameter("h"));
		int wwd= 1000;
		int hhd = 1000;
		int check;
		String couplename = "dfg";
		String RealPath = request.getRealPath("\\syimage");
		
		if(w <= wwd && h <= hhd){
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		ddb.setImg(orgName);
		ddb.setCouplename(couplename);
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMap.insert("insertDiary",ddb);
		request.setAttribute("orgName", orgName);
		check=1;
		}
		else{
			check = 2;
		}
		request.setAttribute("check", check);
		return "/sy0525/upload2.jsp";
	}
	
	@RequestMapping("/diary.nhn")
	public String diary() throws Exception{
		return "/sy0525/diary.jsp";
	}
	
	
	@RequestMapping("/diaryMenu.nhn")
	public String diaryMenu(HttpServletRequest request,DiaryDataBean ddb, CoupleDataBean cdb){
		List diary =null;
		int listMore = 3;
		String couplename = "dfg";
		ddb.setCouplename(couplename);
		diary = sqlMap.queryForList("myDiary", ddb);
		cdb.setCouplename(couplename);
		cdb = (CoupleDataBean)sqlMap.queryForObject("diaryImage", cdb);
		int totalCnt = (Integer)sqlMap.queryForObject("myDiary1", ddb);
		
		request.setAttribute("listMore", listMore);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("diary", diary);
		request.setAttribute("cdb", cdb);
		return "/sy0525/diaryMenu.jsp";
	}
	
	@RequestMapping("/DiaryModify.nhn")
	public String DiaryModify(HttpServletRequest request,DiaryDataBean ddb){
		String couplename = "dfg";
		int num = Integer.parseInt(request.getParameter("num"));
		ddb.setCouplename(couplename);
		ddb.setNum(num);
		ddb = (DiaryDataBean)sqlMap.queryForObject("modifyDiary", ddb);
		request.setAttribute("ddb", ddb);
		return "/sy0525/DiaryModify.jsp";
	}
	
	@RequestMapping("/DiaryModifyPro.nhn")
	public String DiaryModifyPro(MultipartHttpServletRequest request,DiaryDataBean ddb)throws Exception{
		String couplename = "dfg";
		
		String RealPath = request.getRealPath("\\syimage");
		int num = Integer.parseInt(request.getParameter("num"));
		String pool = request.getParameter("pool");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		ddb.setNum(num);
		ddb.setCouplename(couplename);
		
		ddb.setPool(pool);
		System.out.println(orgName);
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
	public String DiaryDelete(HttpServletRequest request,DiaryDataBean ddb){
		String couplename = "dfg";
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		return "/sy0525/DiaryDelete.jsp";
	}
	
	@RequestMapping("/DiaryDeletePro.nhn")
	public String DiaryDeletePro(HttpServletRequest request,DiaryDataBean ddb){
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		String couplename = "dfg";
		ddb.setCouplename(couplename);
		ddb.setNum(num);
		sqlMap.delete("deleteDiary", ddb);
		return "/sy0525/DiaryDeletePro.jsp";
	}
	
	@RequestMapping("/updateImage.nhn")
	public String updateImage(MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		String couplename = "dfg";
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
	
	@RequestMapping("/asd.nhn")
	public String asd(HttpServletRequest request, CoupleDataBean cdb){

		return "/sy0525/asd.jsp";
	}
	
	@RequestMapping("/main22.nhn")
	public String main(){

		return "/sy0526/main.jsp";
	}
	
	@RequestMapping("/couple.nhn")
	public String couple(){

		return "/sy0526/couple.jsp";
	}
	
	@RequestMapping("/share.nhn")
	public String share(){

		return "/sy0526/share.jsp";
	}
	
	@RequestMapping("/theme.nhn")
	public String theme(){

		return "/sy0526/theme.jsp";
	}
	
	@RequestMapping("/event.nhn")
	public String event(){

		return "/sy0526/event.jsp";
	}
	
	@RequestMapping("/personal.nhn")
	public String personal(){

		return "/sy0526/personal.jsp";
	}
	
	@RequestMapping("/photo.nhn")
	public String photo(){

		return "/sy0610/photo.jsp";
	}
	
	@RequestMapping("/photorequest.nhn")
	public String photorequest(HttpServletRequest request,DiaryDataBean ddb){
		String couplename = request.getParameter("couplename");
		List diary = null;
		int listMore = 3;
		
		ddb.setCouplename(couplename);
		diary = sqlMap.queryForList("myDiary", ddb);
		int totalCnt = (Integer)sqlMap.queryForObject("myDiary1", ddb);
		request.setAttribute("diary", diary);
		request.setAttribute("couplename", couplename);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("listMore", listMore);
		
		return "/sy0610/photorequest.jsp";
	}
	
	@RequestMapping("/adminphoto.nhn")
	public String adminphoto(HttpServletRequest request, DiaryDataBean ddb, PhotoDataBean pdb){
		String couplename = request.getParameter("couplename");
		String[] str = request.getParameterValues("photocheck");
		ddb.setCouplename(couplename);
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
		String couplename = request.getParameter("couplename");
		String regdate = String.valueOf(request.getParameter("regdate"));
		request.setAttribute("couplename", couplename);
		request.setAttribute("regdate", regdate);
		System.out.println(regdate);
		System.out.println(couplename);
		return "/sy0610/photocontent.jsp";
	}

}
