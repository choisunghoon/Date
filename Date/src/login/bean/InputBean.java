package login.bean;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ch11.logon.*;

@Controller
public class InputBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("inputForm.nhn")
	public String inputForm() throws Exception{
		
		return "/dc/inputForm.jsp";
	}
	
	@RequestMapping("inputPro.nhn")
	public String inputPro(LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		String nomal=request.getParameter("hidden");
		System.out.println("input nomal"+nomal);
		if(nomal.equals("fb")){
			String id=request.getParameter("id");
			dto.setId(id);	
		}dto.setCouple("0");
		sqlMapper.insert("insertMember", dto);
		return "/dc/inputPro.jsp";
	}
	
	@RequestMapping("confirmId.nhn")
	public String confirmId(String id,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmId",id);
	    request.setAttribute("id", id);
	    request.setAttribute("check", check);
		return "/dc/confirmId.jsp";
	}
	@RequestMapping("confirmNickname.nhn")
	public String confirmNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/confirmNickname.jsp";
	}
	@RequestMapping("searchNickname.nhn")
	public String searchNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/searchNickname.jsp";
	}
	@RequestMapping("confirmCoupleName.nhn")
	public String confirmCoupleName(String coupleName,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmCoupleName",coupleName);
	    request.setAttribute("coupleName", coupleName);
	    request.setAttribute("check", check);
		return "/dc/confirmCoupleName.jsp";
	}
	
	
	@RequestMapping("modifyForm.nhn")
	public String modifyForm(HttpServletRequest request,HttpSession session) throws Exception{
				
		String id = (String)session.getAttribute("id");
		LogonDataBean dto = new LogonDataBean();
		String check =(String)session.getAttribute("fbcheck");
		System.out.println("ㅁ인 체크값"+check);
		request.setAttribute("check", check);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
	    request.setAttribute("dto", dto);
	    int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id);
	    request.setAttribute("nickcheck", nickcheck);
		return "/dc/modifyForm.jsp";
	}
	
	@RequestMapping("modifyPro.nhn")
	public String modifyPro(HttpSession session,LogonDataBean dto) throws Exception{
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		int check=(Integer)sqlMapper.queryForObject("getCouple", id);
		if(check==1){dto.setCouple("1");}
		else{dto.setCouple("0");}
		
		sqlMapper.update("updateMember", dto);
		return "/dc/modifyPro.jsp";
	}
	
	@RequestMapping("deleteForm.nhn")
	public String deleteForm() throws Exception{
		
		return "/dc/deleteForm.jsp";
	}
	@RequestMapping("deletePro.nhn")
	public String deletePro(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		String pw  = request.getParameter("pw");
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int check = (Integer)sqlMapper.queryForObject("userCheck", dto);
	    
	    if(check==1){
	    	session.invalidate();
	    	sqlMapper.update("deleteMember", id);
	    }
	    request.setAttribute("check", new Integer(check));
		return "/dc/deletePro.jsp";
	}
	
	@RequestMapping("coupleDeleteForm.nhn")
	public String coupleDeleteForm() throws Exception{
		
		return "/dc/coupleDeleteForm.jsp";
	}
	@RequestMapping("coupleDelete.nhn")
	public String coupleDelete(HttpSession session,HttpServletRequest request) throws Exception{
		String id=(String)session.getAttribute("id");
		int check=(Integer)sqlMapper.queryForObject("getCouple", id);
		if(check==1){
			CoupleDataBean cdto=new CoupleDataBean();
			cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);

			sqlMapper.update("memCouple0", cdto.getId1());
			sqlMapper.update("memCouple0", cdto.getId2());
			sqlMapper.update("deleteCouple", id);
		}
		request.setAttribute("ccheck", check);
		request.setAttribute("id", id);
		return "/dc/coupleDelete.jsp";
	}
	@RequestMapping("mypage.nhn")
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception{
		String check =(String)session.getAttribute("fbcheck");
		String id =request.getParameter("id");
		System.out.println("마페 체크값"+check);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		System.out.println("마페아이디"+id);
		
		
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//로그인 유무 확인
		if(nc==1){
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
		
		
			if(checkAlert==1){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				session.setAttribute("nickname", nickname);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("마이페이지 체크알럿1"+checkAlert1);
			if(checkAlert1==1){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("마이페이지 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		
		
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleinfo.nhn")
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=request.getParameter("id");
		LogonDataBean dto2=new LogonDataBean();
		LogonDataBean dto1=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check1 = (Integer)sqlMapper.queryForObject("coupleCheck1", id);
		int check2 = (Integer)sqlMapper.queryForObject("coupleCheck2", id);
	
		if(check1==1 || check2==1){
			cdto= (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
			dto2 = (LogonDataBean)sqlMapper.queryForObject("getMember", (String)cdto.getId2());
			dto1= (LogonDataBean)sqlMapper.queryForObject("getMember", (String)cdto.getId1());
			
			session.setAttribute("coupleData", cdto);
		
		}
		
		request.setAttribute("id", id);
		request.setAttribute("couple2", dto2);
		request.setAttribute("couple1", dto1);
		
		request.setAttribute("check1", check1);
		request.setAttribute("check2", check2);
		
		System.out.println("check1:"+check1+"check2:"+check2);
		
		int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
		
		if(checkAlert1==1){
			AlertDataBean adto=new AlertDataBean();
			adto=(AlertDataBean)sqlMapper.queryForObject("getAlert1", id);
			if(adto.getContent().equals("couple")){
				sqlMapper.update("readCheckEnd", id);
			}
		}
		
		
		
		
		
		return "/dc/coupleinfo.jsp";
	}
	@RequestMapping("coupleSearchPro.nhn")
	public String coupleSearchPro(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String) session.getAttribute("id");
		System.out.println("커플서치 아이디"+id);
		String nickname=request.getParameter("nickname");
		String coupleName=request.getParameter("coupleName");
		LogonDataBean dto=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check=(Integer)sqlMapper.queryForObject("getMemberbync", nickname);
		if(check==1){
			dto = (LogonDataBean)sqlMapper.queryForObject("getMemberbyn", nickname);
			cdto.setId2(dto.getId());
		}
		cdto.setId1(id);
		cdto.setCoupleName(coupleName);
		request.setAttribute("id", id);
		sqlMapper.insert("insertCouple", cdto);
		
		AlertDataBean adto=new AlertDataBean();
		adto.setId(id);
		adto.setNickname(nickname);
		adto.setCouplename(coupleName);
		adto.setContent("coupleRequest");
		sqlMapper.insert("insertAlert", adto);
		
		return "/dc/mypage.jsp";
	}
	@RequestMapping("couplex.nhn")
	public String couplex(HttpSession session,HttpServletRequest request) throws Exception{
		String id =request.getParameter("id");
		String nickname=(String)sqlMapper.queryForObject("getNick", id);
		sqlMapper.update("deleteCouple", id);
		sqlMapper.update("readCheckReject", nickname);
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleInput.nhn")
	public String coupleInput(HttpSession session,HttpServletRequest request) throws Exception{
		String nickname=(String) session.getAttribute("nickname");
		String id =request.getParameter("id");
		CoupleDataBean cdto=new CoupleDataBean();
		cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
		sqlMapper.update("memCouple1", cdto.getId1());
		sqlMapper.update("memCouple1", cdto.getId2());
		sqlMapper.update("readCheck", nickname);
		sqlMapper.update("coupleComplete", nickname);
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("/diary1.nhn")
	public String diary(HttpServletRequest request,HttpSession session){
		CoupleDataBean cdto=new CoupleDataBean();
		cdto=(CoupleDataBean) session.getAttribute("coupleData");
		String coupleName=cdto.getCoupleName();
		request.setAttribute("coupleName", coupleName);
		return "/dc/diary.jsp";
	}
	@RequestMapping("/updateImage1.nhn")
	public String updateImage(MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		String coupleName = request.getParameter("coupleName");
		String RealPath = request.getRealPath("\\syimage");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		cdb.setCoupleImage(orgName);
		System.out.println("업게이트이미지1"+cdb.getCoupleImage());
		cdb.setCoupleName(coupleName);
		System.out.println("커플네임"+cdb.getCoupleName());
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMapper.insert("diaryimgUpdate1",cdb);
		request.setAttribute("orgName", orgName);
		request.setAttribute("close", "yes");
		return "/dc/diary.jsp";
	}
	@RequestMapping("/coupleModify.nhn")
	public String coupleModify(HttpSession session,HttpServletRequest request)throws Exception{
		String coupleName = request.getParameter("coupleName");
		String coupleDate = request.getParameter("coupleDate");
		System.out.println(coupleName+"커플네임");
	
		String hidden=request.getParameter("hidden");
		String id=(String)session.getAttribute("id");
		CoupleDataBean cdto=new CoupleDataBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

		int ccn=(Integer)sqlMapper.queryForObject("checkCoupleName", coupleName);
		System.out.println("체크커플네임"+ccn);
		if(hidden!=null){
			Date date=sdf.parse(coupleDate);
			if(ccn==1){
				cdto.setCoupleName(coupleName);
				cdto.setCoupleDate(date);
				System.out.println("date "+date);
				sqlMapper.update("coupleModifyNcYd", cdto);
			}
			else if(ccn==0){
				cdto.setCoupleDate(date);
				cdto.setCoupleName(coupleName);
				cdto.setId1(id);
				sqlMapper.update("coupleModifyYcYd", cdto);
			}
		}
		if(hidden==null){
			if(ccn==0){
				cdto.setCoupleName(coupleName);
				cdto.setId1(id);
				sqlMapper.update("coupleModifyYcNd", cdto);
			}
		}
		return "/dc/mypage.jsp";
	}
}
