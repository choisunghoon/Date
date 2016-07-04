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

import project.bean.EventDataBean;
import ch11.logon.*;
import dateplan.bean.DTO;


import upload.bean.DiaryDataBean;
import upload.bean.PhotoDataBean;
import upload.bean.PointDataBean;

@Controller
public class InputBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("inputForm.nhn")//회占쏙옙占쏙옙占쏙옙 占쏙옙 
	public String inputForm() throws Exception{
		
		return "/dc/inputForm.jsp";
	}
	
	@RequestMapping("inputPro.nhn")//회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싼억옙占� 占쏙옙占쏙옙占쏙옙 db占쏙옙 占쌉력쏙옙키占쏙옙 占쏙옙占쏙옙 占쌉쇽옙(처占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占싫몌옙占쏙옙寬占쏙옙 회占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙치占쏙옙 占십곤옙 占쌕뤄옙 占쏙옙 占쌉쇽옙占쏙옙 호占쏙옙)
	public String inputPro(LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		String nomal=request.getParameter("hidden");
		System.out.println("input nomal"+nomal);
		if(nomal.equals("fb")){//占쏙옙占싫몌옙占쏙옙占� 占쏙옙占� db占쏙옙 占쏙옙占싱디값몌옙 占쏙옙占쏙옙
			String id=request.getParameter("id");
			dto.setId(id);	
		}dto.setCouple("0");
		sqlMapper.insert("insertMember", dto);//占쏙옙占싫몌옙占쏙옙占� 占싣댐옙 占쏙옙占� inputForm.jsp占쏙옙占쏙옙 占쌉력듸옙 占쏙옙占쏙옙 db占쏙옙 占쏙옙占쏙옙.
		return "/dc/inputPro.jsp";
	}
	
	@RequestMapping("confirmId.nhn")//占쏙옙占싱듸옙 占쌩븝옙확占쏙옙
	public String confirmId(String id,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmId",id);//id占쏙옙 db占쏙옙 占쌍다몌옙 1占쏙옙 占쏙옙占쏙옙
	    request.setAttribute("id", id);
	    request.setAttribute("check", check);
		return "/dc/confirmId.jsp";
	}
	@RequestMapping("confirmNickname.nhn")//占싻놂옙占쏙옙 占쌩븝옙확占쏙옙
	public String confirmNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);//nickname占쏙옙 db占쏙옙 占쌍다몌옙 1占쏙옙 占쏙옙占쏙옙
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/confirmNickname.jsp";
	}
	@RequestMapping("searchNickname.nhn")//占싻놂옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
	public String searchNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/searchNickname.jsp";
	}
	@RequestMapping("confirmCoupleName.nhn")//커占시몌옙 占쌩븝옙 확占쏙옙
	public String confirmCoupleName(String coupleName,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmCoupleName",coupleName);//couplename占쏙옙 db占쏙옙 占쌍다몌옙 1占쏙옙 占쏙옙占쏙옙
	    request.setAttribute("coupleName", coupleName);
	    request.setAttribute("check", check);
		return "/dc/confirmCoupleName.jsp";
	}
	
	
	@RequestMapping("modifyForm.nhn")//회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙
	public String modifyForm(HttpServletRequest request,HttpSession session) throws Exception{
				
		String id = (String)session.getAttribute("id"); 
		LogonDataBean dto = new LogonDataBean();
		String check =(String)session.getAttribute("fbcheck");//占쏙옙占� 회占쏙옙占쏙옙 占실븝옙占싹댐옙 占쏙옙占쏙옙. 占쏙옙占� 회占쏙옙占쏙옙 占쏙옙橘占싫� 占쏙옙占쏙옙占쏙옙 占쏙옙 占십요가 占쏙옙占썩때占쏙옙占쏙옙 占쏙옙占� 회占쏙옙占쏙옙占쌉댐옙 占쏙옙橘占싫� 占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙활占쏙옙화
		System.out.println("占쏙옙占쏙옙 체크占쏙옙"+check);
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);//占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 id占쏙옙 회占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	    request.setAttribute("dto", dto);
	    int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id);//占쏙옙占� 회占쏙옙占쏙옙 占싸깍옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占실억옙占쏙옙占쏙옙 占십다몌옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹띰옙占� 占쏙옙占시�占쏙옙 占쌩몌옙 占쌕몌옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼어갈占쏙옙占쏙옙占쏙옙.
	    request.setAttribute("nickcheck", nickcheck);
		return "/dc/modifyForm.jsp";
	}
	
	@RequestMapping("modifyPro.nhn")//회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	public String modifyPro(HttpSession session,LogonDataBean dto) throws Exception{
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		LogonDataBean odto = new LogonDataBean();
		odto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		dto.setCouple(odto.getCouple());
		sqlMapper.update("updateMember", dto);
		return "/dc/modifyPro.jsp";
	}
	
	@RequestMapping("deleteForm.nhn")//회占쏙옙 탈占쏙옙 占쏙옙
	public String deleteForm() throws Exception{
		
		return "/dc/deleteForm.jsp";
	}
	@RequestMapping("deletePro.nhn")//회占쏙옙 탈占쏙옙
	public String deletePro(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		String pw  = request.getParameter("pw");
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int check = (Integer)sqlMapper.queryForObject("userCheck", dto);//id占쏙옙 pw占쏙옙 占쏙옙치占싹몌옙 1占쏙옙 占쏙옙占쏙옙
	    
	    if(check==1){
	    	session.invalidate();
	    	sqlMapper.update("deleteMember", id);
	    }
	    request.setAttribute("check", new Integer(check));
		return "/dc/deletePro.jsp";
	}
	
	@RequestMapping("coupleDeleteForm.nhn")//커占시삼옙占쏙옙 占쏙옙
	public String coupleDeleteForm() throws Exception{
		
		return "/dc/coupleDeleteForm.jsp";
	}
	@RequestMapping("coupleDelete.nhn")//커占시삼옙占쏙옙
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
			
			sqlMapper.update("memCouple0", cdto.getId1()); //커占쏙옙 占쏙옙占싱븝옙 占쌍댐옙 회占쏙옙占쏙옙 id占쏙옙 占싯삼옙占쌔쇽옙 커占쏙옙占시뤄옙占쏙옙 占쏙옙占쏙옙 0占쏙옙占쏙옙 占쌕꾼댐옙
			sqlMapper.update("memCouple0", cdto.getId2());
			sqlMapper.update("deleteCouple", id);			//커占쏙옙 占쏙옙占싱븝옙占쏙옙 id占쏙옙 占싯삼옙占쌔쇽옙 占쌔댐옙 占쏙옙占쌘드를 占쏙옙占쏙옙占싼댐옙.
			sqlMapper.delete("deleteAlert", cdto.getId2()); //커占쏙옙 占쏙옙청,占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占싯몌옙占쌨쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占�.
			sqlMapper.delete("deleteAlert", cdto.getId1());
		}
		request.setAttribute("ucheck", ucheck);
		request.setAttribute("ccheck", check);
		request.setAttribute("id", id);
		return "/dc/coupleDelete.jsp";
	}
	@RequestMapping("mypage.nhn")// 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception{
		String check =(String)session.getAttribute("fbcheck");
		String id =(String) session.getAttribute("id");
		System.out.println("占쏙옙占쏙옙 체크占쏙옙"+check);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		System.out.println("占쏙옙占쏙옙占쏙옙絹占�"+id);
		
		if(id==null){ // 占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 占싣니띰옙占� 占싱울옙占쏙옙占쏙옙 占쏙옙占싹게뀐옙
			request.setAttribute("gologin", "1");
			return "/sy0526/main.jsp";
		}
		
		else{
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			int countCN = (Integer)sqlMapper.queryForObject("countCN", id);
			if(countCN>0){
			String couplen = (String)sqlMapper.queryForObject("selectCouplename", id);
			EventDataBean eto = new EventDataBean()	;			
			int checkcount = (Integer)sqlMapper.queryForObject("checkcount", couplen);
				if(checkcount>0){
					List etoList = null;
					etoList = sqlMapper.queryForList("checkW", couplen);
					for(int j=0; j<etoList.size();j++){
						eto = (EventDataBean) etoList.get(j);
						for(int i=0; i<checkcount; i++){
							if(eto.getChecknum()==0){
								request.setAttribute("checkW",  eto.getChecknum());
								request.setAttribute("enumber1", eto.getEnumber());
								request.setAttribute("ch", 0);
							}
						}
					}
				}
			}
		
			if(checkAlert==1){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				session.setAttribute("nickname", nickname);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 체크占싯뤄옙1"+checkAlert1);
			if(checkAlert1==1){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
		}	
		
		
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleinfo.nhn")//커占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=request.getParameter("id");
		LogonDataBean dto2=new LogonDataBean();
		LogonDataBean dto1=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check1 = (Integer)sqlMapper.queryForObject("coupleCheck1", id);	// 회占쏙옙占쏙옙 id占쏙옙 커占쏙옙占쏙옙占싱븝옙占쏙옙 占싯삼옙占쌔쇽옙 占쏙옙占쌘드가 占쏙옙占쏙옙占쏙옙 1占쏙옙 占쏙옙占쏙옙
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
		
		int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); //id占쏙옙 alert占쏙옙占싱븝옙占쏙옙 占싯삼옙. 占쏙옙占쏙옙占쏙옙 커占시쏙옙청 占쌨쏙옙占쏙옙占쏙옙 확占쏙옙占쏙옙占쏙옙占쏙옙 1占쏙옙 占쏙옙占쏙옙
		
		if(checkAlert1==1){
			AlertDataBean adto=new AlertDataBean();
			adto=(AlertDataBean)sqlMapper.queryForObject("getAlert1", id);
			if(adto.getContent().equals("couple")){
				sqlMapper.update("readCheckEnd", id);
			}
		}
		
		
		
		
		
		return "/dc/coupleinfo.jsp";
	}
	@RequestMapping("coupleSearchPro.nhn")//커占쏙옙 찾占쏙옙
	public String coupleSearchPro(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String) session.getAttribute("id");
		System.out.println("커占시쇽옙치 占쏙옙占싱듸옙"+id);
		String nickname=request.getParameter("nickname");
		String coupleName=request.getParameter("coupleName");
		LogonDataBean dto=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check=(Integer)sqlMapper.queryForObject("getMemberbync", nickname); //nickname占쏙옙占쏙옙 占쏙옙占� 占쏙옙占싱븝옙占쏙옙 占싯삼옙占쌔쇽옙 占쏙옙占쏙옙占싹댐옙 회占쏙옙占싱띰옙占� 1占쏙옙 占쏙옙占쏙옙 
		if(check==1){
			dto = (LogonDataBean)sqlMapper.queryForObject("getMemberbyn", nickname);
			cdto.setId2(dto.getId());
			int checkcouple=(Integer)sqlMapper.queryForObject("getCouple", dto.getId());//커占쏙옙 占쏙옙청占쏙옙 占쏙옙占쏙옙占쏙옙 占싱뱄옙 커占쏙옙占싱띰옙占� 1占쏙옙 占쏙옙占쏙옙
			if(checkcouple==1){
				request.setAttribute("fail", "1");
				return "/dc/mypage.jsp";
			}
		}
		cdto.setId1(id);
		cdto.setCoupleName(coupleName);
		cdto.setCoupleImage("couple.png");
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
	@RequestMapping("couplex.nhn")//커占쏙옙 占신븝옙
	public String couplex(HttpSession session,HttpServletRequest request) throws Exception{
		String id =request.getParameter("id");
		String nickname=(String)sqlMapper.queryForObject("getNick", id);
		sqlMapper.delete("deleteCouple", id);//커占쏙옙占쏙옙占싱븝옙占쏙옙 占쌔댐옙 회占쏙옙占쏙옙 id占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占쌘드를 占쏙옙占쏙옙
		sqlMapper.delete("readCheckReject", nickname);//占싯몌옙 占쏙옙占싱븝옙占쏙옙 占쌔댐옙 회占쏙옙占쏙옙 nickname占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占쌘드를 占쏙옙占쏙옙
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleInput.nhn")//커占쏙옙 占쏙옙占쏙옙
	public String coupleInput(HttpSession session,HttpServletRequest request) throws Exception{
		String nickname=(String) session.getAttribute("nickname");
		String id =request.getParameter("id");
		CoupleDataBean cdto=new CoupleDataBean();
		cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
		sqlMapper.update("memCouple1", cdto.getId1());//회占쏙옙占쏙옙 커占쏙옙占시뤄옙占쏙옙占쏙옙 1占쏙옙 占쏙옙占쏙옙
		sqlMapper.update("memCouple1", cdto.getId2());
		sqlMapper.update("readCheck", nickname);//占싯몌옙占쏙옙占싱븝옙占쏙옙 readcheck占쏙옙占쏙옙 1占쏙옙 占쏙옙占쏙옙 
		sqlMapper.update("coupleComplete", nickname);
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("/diary1.nhn")//커占쏙옙占쏙옙占쏙옙占쏙옙 占싱뱄옙占쏙옙占쏙옙占쏙옙 占쌍깍옙
	public String diary(HttpServletRequest request,HttpSession session){
		CoupleDataBean cdto=new CoupleDataBean();
		cdto=(CoupleDataBean) session.getAttribute("coupleData");
		String coupleName=cdto.getCoupleName();
		request.setAttribute("coupleName", coupleName);
		return "/dc/diary.jsp";
	}
	@RequestMapping("/updateImage1.nhn")//占싱뱄옙占쏙옙占쏙옙占쏙옙 占쏙옙占싸듸옙
	public String updateImage(MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		String coupleName = request.getParameter("coupleName");
		String RealPath = request.getRealPath("\\syimage");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		cdb.setCoupleImage(orgName);
		System.out.println("占쏙옙占쏙옙占쏙옙트占싱뱄옙占쏙옙1"+cdb.getCoupleImage());
		cdb.setCoupleName(coupleName);
		System.out.println("커占시놂옙占쏙옙"+cdb.getCoupleName());
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMapper.insert("diaryimgUpdate1",cdb);
		request.setAttribute("orgName", orgName);
		request.setAttribute("close", "yes");
		return "/dc/diary.jsp";
	}
	@RequestMapping("/coupleModify.nhn")//커占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	public String coupleModify(HttpSession session,HttpServletRequest request)throws Exception{
		String coupleName = request.getParameter("coupleName");
		String coupleDate = request.getParameter("coupleDate");
		System.out.println(coupleName+"커占시놂옙占쏙옙");
	
		String hidden=request.getParameter("hidden");//占쏙옙짜 占쏙옙占쏙옙占쏙옙 占쌍다몌옙 hidden占쏙옙 null占쏙옙 占싣댐옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쌉된댐옙.
		String id=(String)session.getAttribute("id");
		CoupleDataBean cdto=new CoupleDataBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

		int ccn=(Integer)sqlMapper.queryForObject("checkCoupleName", coupleName);
		System.out.println("체크커占시놂옙占쏙옙"+ccn);
		if(hidden!=null){
			Date date=sdf.parse(coupleDate);
			if(ccn==1){//커占시몌옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쌕몌옙 占쏙옙占쏙옙
				cdto.setCoupleName(coupleName);
				cdto.setCoupleDate(date);
				System.out.println("date "+date);
				sqlMapper.update("coupleModifyNcYd", cdto);
			}
			else if(ccn==0){//커占시몌옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占� 占쏙옙占쏙옙
				
				cdto.setCoupleDate(date);
				cdto.setCoupleName(coupleName);
				cdto.setId1(id);
				String bfcn=(String) sqlMapper.queryForObject("couplename00", id);
				sqlMapper.update("coupleModifyYcYd", cdto);
				DTO dcdto=new DTO();
				dcdto.setSubject(bfcn);
				dcdto.setCouplename(coupleName);
				sqlMapper.update("couplename_dc",dcdto );
				AlertDataBean adto=new AlertDataBean();
				adto.setContent(bfcn);
				adto.setCouplename(coupleName);
				sqlMapper.update("couplename_alert",adto );
				DiaryDataBean ddto=new DiaryDataBean();
				ddto.setContent(bfcn);
				ddto.setCouplename(coupleName);
				sqlMapper.update("couplename_diary",ddto );
				PointDataBean pdto=new PointDataBean();
				pdto.setCouplename(coupleName);
				pdto.setPlace(bfcn);
				sqlMapper.update("couplename_point",pdto );
				PhotoDataBean ptdto=new PhotoDataBean();
				ptdto.setCouplename(coupleName);
				ptdto.setImg(bfcn);
				sqlMapper.update("couplename_photo",ptdto );
			}
		}
		if(hidden==null){
			if(ccn==0){
				cdto.setCoupleName(coupleName);
				cdto.setId1(id);
				String bfcn=(String) sqlMapper.queryForObject("couplename00", id);
				sqlMapper.update("coupleModifyYcYd", cdto);
				DTO dcdto=new DTO();
				dcdto.setSubject(bfcn);
				dcdto.setCouplename(coupleName);
				sqlMapper.update("couplename_dc",dcdto );
				AlertDataBean adto=new AlertDataBean();
				adto.setContent(bfcn);
				adto.setCouplename(coupleName);
				sqlMapper.update("couplename_alert",adto );
				DiaryDataBean ddto=new DiaryDataBean();
				ddto.setContent(bfcn);
				ddto.setCouplename(coupleName);
				sqlMapper.update("couplename_diary",ddto );
				PointDataBean pdto=new PointDataBean();
				pdto.setCouplename(coupleName);
				pdto.setPlace(bfcn);
				sqlMapper.update("couplename_point",pdto );
			}
		}
		request.setAttribute("success", 1);
		return "/dc/mypage.jsp";
	}
	
	@RequestMapping("mylist.nhn")
	public String datecos(HttpServletRequest request,DTO dto){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMapper.queryForObject("selectcpname", id);
		List cosList = new ArrayList();
		
		cosList = sqlMapper.queryForList("selectcoscop", couplename);
		
		
		request.setAttribute("cosList", cosList);
		
		return "/dc/datecos.jsp";
	}
	@RequestMapping("mycos.nhn")
	public String dateMap2(HttpServletRequest request,DTO dto) throws Exception{
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto= (DTO)sqlMapper.queryForObject("selectcosnum",num);
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("num",num);
		
		return "/dateplan/datePlan.jsp";
	}
}
