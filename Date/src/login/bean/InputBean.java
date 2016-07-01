package login.bean;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ch11.logon.*;
import event.EventDataBean;

@Controller
public class InputBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("inputForm.nhn")//회원가입 폼 
	public String inputForm() throws Exception{
		
		return "/dc/inputForm.jsp";
	}
	
	@RequestMapping("inputPro.nhn")//회원가입 폼에서 넘어온 정보를 db에 입력시키기 위한 함수(처음 접속하는 페북회원인경우 회원가입폼을 거치지 않고 바로 이 함수를 호출)
	public String inputPro(LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		String nomal=request.getParameter("hidden");
		System.out.println("input nomal"+nomal);
		if(nomal.equals("fb")){//페북회원인 경우 db에 아이디값만 저장
			String id=request.getParameter("id");
			dto.setId(id);	
		}dto.setCouple("0");
		sqlMapper.insert("insertMember", dto);//페북회원이 아닌 경우 inputForm.jsp에서 입력된 값을 db에 저장.
		return "/dc/inputPro.jsp";
	}
	
	@RequestMapping("confirmId.nhn")//아이디 중복확인
	public String confirmId(String id,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmId",id);//id가 db에 있다면 1을 추출
	    request.setAttribute("id", id);
	    request.setAttribute("check", check);
		return "/dc/confirmId.jsp";
	}
	@RequestMapping("confirmNickname.nhn")//닉네임 중복확인
	public String confirmNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);//nickname이 db에 있다면 1을 추출
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/confirmNickname.jsp";
	}
	@RequestMapping("searchNickname.nhn")//닉네임 존재 확인
	public String searchNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/searchNickname.jsp";
	}
	@RequestMapping("confirmCoupleName.nhn")//커플명 중복 확인
	public String confirmCoupleName(String coupleName,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmCoupleName",coupleName);//couplename이 db에 있다면 1을 추출
	    request.setAttribute("coupleName", coupleName);
	    request.setAttribute("check", check);
		return "/dc/confirmCoupleName.jsp";
	}
	
	
	@RequestMapping("modifyForm.nhn")//회원정보 수정 폼
	public String modifyForm(HttpServletRequest request,HttpSession session) throws Exception{
				
		String id = (String)session.getAttribute("id"); 
		LogonDataBean dto = new LogonDataBean();
		String check =(String)session.getAttribute("fbcheck");//페북 회원을 판별하는 변수. 페북 회원은 비밀번호 수정을 할 필요가 없기때문에 페북 회원에게는 비밀번호 수정 기능이 비활성화
		System.out.println("ㅁ인 체크값"+check);
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);//로그인한 회원의 id로 회원 정보를 추출
	    request.setAttribute("dto", dto);
	    int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id);//페북 회원이 로그인했을때 별명이 설정되어있지 않다면 별명을 설정하라는 경고창이 뜨며 다른 페이지로 넘어갈수없다.
	    request.setAttribute("nickcheck", nickcheck);
		return "/dc/modifyForm.jsp";
	}
	
	@RequestMapping("modifyPro.nhn")//회원정보 수정
	public String modifyPro(HttpSession session,LogonDataBean dto) throws Exception{
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		LogonDataBean odto = new LogonDataBean();
		odto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		dto.setCouple(odto.getCouple());
		sqlMapper.update("updateMember", dto);
		return "/dc/modifyPro.jsp";
	}
	
	@RequestMapping("deleteForm.nhn")//회원 탈퇴 폼
	public String deleteForm() throws Exception{
		
		return "/dc/deleteForm.jsp";
	}
	@RequestMapping("deletePro.nhn")//회원 탈퇴
	public String deletePro(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		String pw  = request.getParameter("pw");
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int check = (Integer)sqlMapper.queryForObject("userCheck", dto);//id와 pw가 일치하면 1을 추출
	    
	    if(check==1){
	    	session.invalidate();
	    	sqlMapper.update("deleteMember", id);
	    }
	    request.setAttribute("check", new Integer(check));
		return "/dc/deletePro.jsp";
	}
	
	@RequestMapping("coupleDeleteForm.nhn")//커플삭제 폼
	public String coupleDeleteForm() throws Exception{
		
		return "/dc/coupleDeleteForm.jsp";
	}
	@RequestMapping("coupleDelete.nhn")//커플삭제
	public String coupleDelete(HttpSession session,HttpServletRequest request) throws Exception{
		String id=(String)session.getAttribute("id");
		String pw=(String)request.getParameter("pw");
		int check=(Integer)sqlMapper.queryForObject("getCouple", id);
		LogonDataBean dto=new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int ucheck=(Integer)sqlMapper.queryForObject("userCheck", dto);
		if(check==1 & ucheck==1){
			CoupleDataBean cdto=new CoupleDataBean();
			cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
			
			sqlMapper.update("memCouple0", cdto.getId1()); //커플 테이블에 있는 회원의 id를 검색해서 커플컬럼의 값을 0으로 바꾼다
			sqlMapper.update("memCouple0", cdto.getId2());
			sqlMapper.update("deleteCouple", id);			//커플 테이블을 id로 검색해서 해당 레코드를 삭제한다.
			sqlMapper.delete("deleteAlert", cdto.getId2()); //커플 신청,수락등으로 생긴 알림메시지들을 지운다.
			sqlMapper.delete("deleteAlert", cdto.getId1());
		}
		request.setAttribute("ucheck", ucheck);
		request.setAttribute("ccheck", check);
		request.setAttribute("id", id);
		return "/dc/coupleDelete.jsp";
	}
	@RequestMapping("mypage.nhn")// 마이 페이지
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception{
		String check =(String)session.getAttribute("fbcheck");
		String id =(String) session.getAttribute("id");
		System.out.println("마페 체크값"+check);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		System.out.println("마페아이디"+id);
		
		if(id==null){ // 로그인한 회원이 아니라면 이용하지 못하게끔
			request.setAttribute("gologin", "1");
			return "/sy0526/main.jsp";
		}
		
		else{
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			String couplen = (String)sqlMapper.queryForObject("selectCouplename", id);
			int checkW=(Integer)sqlMapper.queryForObject("checkW", couplen);
			if(checkW==0){
				request.setAttribute("checkW", checkW);
			}
		
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
	@RequestMapping("coupleinfo.nhn")//커플정보 수정 
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=request.getParameter("id");
		LogonDataBean dto2=new LogonDataBean();
		LogonDataBean dto1=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check1 = (Integer)sqlMapper.queryForObject("coupleCheck1", id);	// 회원의 id로 커플테이블을 검색해서 레코드가 있으면 1을 추출
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
		
		int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); //id로 alert테이블을 검색. 상대방이 커플신청 메시지를 확인했을때 1을 추출
		
		if(checkAlert1==1){
			AlertDataBean adto=new AlertDataBean();
			adto=(AlertDataBean)sqlMapper.queryForObject("getAlert1", id);
			if(adto.getContent().equals("couple")){
				sqlMapper.update("readCheckEnd", id);
			}
		}
		
		
		
		
		
		return "/dc/coupleinfo.jsp";
	}
	@RequestMapping("coupleSearchPro.nhn")//커플 찾기
	public String coupleSearchPro(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String) session.getAttribute("id");
		System.out.println("커플서치 아이디"+id);
		String nickname=request.getParameter("nickname");
		String coupleName=request.getParameter("coupleName");
		LogonDataBean dto=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check=(Integer)sqlMapper.queryForObject("getMemberbync", nickname); //nickname으로 멤버 테이블을 검색해서 존재하는 회원이라면 1을 추출 
		if(check==1){
			dto = (LogonDataBean)sqlMapper.queryForObject("getMemberbyn", nickname);
			cdto.setId2(dto.getId());
			int checkcouple=(Integer)sqlMapper.queryForObject("getCouple", dto.getId());//커플 신청한 상대방이 이미 커플이라면 1을 추출
			if(checkcouple==1){
				request.setAttribute("fail", "1");
				return "/dc/mypage.jsp";
			}
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
	@RequestMapping("couplex.nhn")//커플 거부
	public String couplex(HttpSession session,HttpServletRequest request) throws Exception{
		String id =request.getParameter("id");
		String nickname=(String)sqlMapper.queryForObject("getNick", id);
		sqlMapper.delete("deleteCouple", id);//커플테이블에서 해당 회원의 id를 포함하는 레코드를 삭제
		sqlMapper.delete("readCheckReject", nickname);//알림 테이블에서 해당 회원의 nickname를 포함하는 레코드를 삭제
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleInput.nhn")//커플 수락
	public String coupleInput(HttpSession session,HttpServletRequest request) throws Exception{
		String nickname=(String) session.getAttribute("nickname");
		String id =request.getParameter("id");
		CoupleDataBean cdto=new CoupleDataBean();
		cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
		sqlMapper.update("memCouple1", cdto.getId1());//회원의 커플컬럼값을 1로 변경
		sqlMapper.update("memCouple1", cdto.getId2());
		sqlMapper.update("readCheck", nickname);//알림테이블의 readcheck값을 1로 변경 
		sqlMapper.update("coupleComplete", nickname);
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("/diary1.nhn")//커플정보에 이미지파일 넣기
	public String diary(HttpServletRequest request,HttpSession session){
		CoupleDataBean cdto=new CoupleDataBean();
		cdto=(CoupleDataBean) session.getAttribute("coupleData");
		String coupleName=cdto.getCoupleName();
		request.setAttribute("coupleName", coupleName);
		return "/dc/diary.jsp";
	}
	@RequestMapping("/updateImage1.nhn")//이미지파일 업로드
	public String updateImage(MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		String coupleName = request.getParameter("coupleName");
		String RealPath = request.getRealPath("\\syimage");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		cdb.setCoupleImage(orgName);
		System.out.println("업데이트이미지1"+cdb.getCoupleImage());
		cdb.setCoupleName(coupleName);
		System.out.println("커플네임"+cdb.getCoupleName());
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMapper.insert("diaryimgUpdate1",cdb);
		request.setAttribute("orgName", orgName);
		request.setAttribute("close", "yes");
		return "/dc/diary.jsp";
	}
	@RequestMapping("/coupleModify.nhn")//커플정보 수정
	public String coupleModify(HttpSession session,HttpServletRequest request)throws Exception{
		String coupleName = request.getParameter("coupleName");
		String coupleDate = request.getParameter("coupleDate");
		System.out.println(coupleName+"커플네임");
	
		String hidden=request.getParameter("hidden");//날짜 변경이 있다면 hidden은 null이 아닌 값을 가지게된다.
		String id=(String)session.getAttribute("id");
		CoupleDataBean cdto=new CoupleDataBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

		int ccn=(Integer)sqlMapper.queryForObject("checkCoupleName", coupleName);
		System.out.println("체크커플네임"+ccn);
		if(hidden!=null){
			Date date=sdf.parse(coupleDate);
			if(ccn==1){//커플명 변경이 없다면 실행
				cdto.setCoupleName(coupleName);
				cdto.setCoupleDate(date);
				System.out.println("date "+date);
				sqlMapper.update("coupleModifyNcYd", cdto);
			}
			else if(ccn==0){//커플명을 변경하는 경우 실행
				cdto.setCoupleDate(date);
				cdto.setCoupleName(coupleName);
				cdto.setId1(id);
				
				sqlMapper.update("coupleModifyYcYd", cdto);
				sqlMapper.queryForObject("couplename_dc0", coupleName);
				sqlMapper.update("couplename_dc",cdto );
				sqlMapper.update("couplename_alert",cdto );
				sqlMapper.update("couplename_diary",cdto );
				sqlMapper.update("couplename_point",cdto );
			}
		}
		if(hidden==null){
			if(ccn==0){
				cdto.setCoupleName(coupleName);
				cdto.setId1(id);
				sqlMapper.update("coupleModifyYcNd", cdto);
			}
		}
		request.setAttribute("success", 1);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("mylist.nhn")
	public String event(HttpServletRequest request,HttpSession session,EventDataBean dto)throws Exception{
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		LogonDataBean mdto = new LogonDataBean();
		mdto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		String listnum=mdto.getList();
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
		
		
		eventList = sqlMapper.queryForList("getWinEventList", num);
		count = (Integer)sqlMapper.queryForObject("winEventCount", null);
	
		
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow",startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("id", id);
	
		return "/dc/mylist.jsp";
	}
}
