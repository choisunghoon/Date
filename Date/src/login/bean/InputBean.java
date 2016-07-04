package login.bean;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import project.bean.EventDataBean;
import share.coursePagingTDTO;
import share.shareCourseDataBean;
import ch11.logon.*;
import dateplan.bean.DTO;


import upload.bean.DiaryDataBean;
import upload.bean.PhotoDataBean;
import upload.bean.PointDataBean;

@Controller
public class InputBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("inputForm.nhn")//�쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 
	public String inputForm() throws Exception{
		
		return "/dc/inputForm.jsp";
	}
	
	@RequestMapping("inputPro.nhn")//�쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떬�뼲�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 db�뜝�룞�삕 �뜝�뙃�젰�룞�삕�궎�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�뙃�눦�삕(泥섇뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝�떕紐뚯삕�뜝�룞�삕野у뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕移섇뜝�룞�삕 �뜝�떗怨ㅼ삕 �뜝�뙐琉꾩삕 �뜝�룞�삕 �뜝�뙃�눦�삕�뜝�룞�삕 �샇�뜝�룞�삕)
	public String inputPro(LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		String nomal=request.getParameter("hidden");
		System.out.println("input nomal"+nomal);
		if(nomal.equals("fb")){//�뜝�룞�삕�뜝�떕紐뚯삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝占� db�뜝�룞�삕 �뜝�룞�삕�뜝�떛�뵒媛믩챿�삕 �뜝�룞�삕�뜝�룞�삕
			String id=request.getParameter("id");
			dto.setId(id);	
		}dto.setCouple("0");
		sqlMapper.insert("insertMember", dto);//�뜝�룞�삕�뜝�떕紐뚯삕�뜝�룞�삕�뜝占� �뜝�떍�뙋�삕 �뜝�룞�삕�뜝占� inputForm.jsp�뜝�룞�삕�뜝�룞�삕 �뜝�뙃�젰�벝�삕 �뜝�룞�삕�뜝�룞�삕 db�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕.
		return "/dc/inputPro.jsp";
	}
	
	@RequestMapping("confirmId.nhn")//�뜝�룞�삕�뜝�떛�벝�삕 �뜝�뙥釉앹삕�솗�뜝�룞�삕
	public String confirmId(String id,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmId",id);//id�뜝�룞�삕 db�뜝�룞�삕 �뜝�뙇�떎紐뚯삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	    request.setAttribute("id", id);
	    request.setAttribute("check", check);
		return "/dc/confirmId.jsp";
	}
	@RequestMapping("confirmNickname.nhn")//�뜝�떩�냲�삕�뜝�룞�삕 �뜝�뙥釉앹삕�솗�뜝�룞�삕
	public String confirmNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);//nickname�뜝�룞�삕 db�뜝�룞�삕 �뜝�뙇�떎紐뚯삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/confirmNickname.jsp";
	}
	@RequestMapping("searchNickname.nhn")//�뜝�떩�냲�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
	public String searchNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/searchNickname.jsp";
	}
	@RequestMapping("confirmCoupleName.nhn")//而ㅵ뜝�떆紐뚯삕 �뜝�뙥釉앹삕 �솗�뜝�룞�삕
	public String confirmCoupleName(String coupleName,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmCoupleName",coupleName);//couplename�뜝�룞�삕 db�뜝�룞�삕 �뜝�뙇�떎紐뚯삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	    request.setAttribute("coupleName", coupleName);
	    request.setAttribute("check", check);
		return "/dc/confirmCoupleName.jsp";
	}
	
	
	@RequestMapping("modifyForm.nhn")//�쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕
	public String modifyForm(HttpServletRequest request,HttpSession session) throws Exception{
				
		String id = (String)session.getAttribute("id"); 
		LogonDataBean dto = new LogonDataBean();
		String check =(String)session.getAttribute("fbcheck");//�뜝�룞�삕�뜝占� �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�떎釉앹삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝�룞�삕. �뜝�룞�삕�뜝占� �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕艅섇뜝�떕占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�떗�슂媛� �뜝�룞�삕�뜝�뜦�븣�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� �쉶�뜝�룞�삕�뜝�룞�삕�뜝�뙃�뙋�삕 �뜝�룞�삕艅섇뜝�떕占� �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�솢�뜝�룞�삕�솕
		System.out.println("�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�룞�삕"+check);
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);//�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 id�뜝�룞�삕 �쉶�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	    request.setAttribute("dto", dto);
	    int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id);//�뜝�룞�삕�뜝占� �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떎�뼲�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떗�떎紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�씛�삕�뜝占� �뜝�룞�삕�뜝�떆占썲뜝�룞�삕 �뜝�뙥紐뚯삕 �뜝�뙐紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떬�뼱媛덂뜝�룞�삕�뜝�룞�삕�뜝�룞�삕.
	    request.setAttribute("nickcheck", nickcheck);
		return "/dc/modifyForm.jsp";
	}
	
	@RequestMapping("modifyPro.nhn")//�쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public String modifyPro(HttpSession session,LogonDataBean dto) throws Exception{
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		LogonDataBean odto = new LogonDataBean();
		odto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		dto.setCouple(odto.getCouple());
		sqlMapper.update("updateMember", dto);
		return "/dc/modifyPro.jsp";
	}
	
	@RequestMapping("deleteForm.nhn")//�쉶�뜝�룞�삕 �깉�뜝�룞�삕 �뜝�룞�삕
	public String deleteForm() throws Exception{
		
		return "/dc/deleteForm.jsp";
	}
	@RequestMapping("deletePro.nhn")//�쉶�뜝�룞�삕 �깉�뜝�룞�삕
	public String deletePro(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		String pw  = request.getParameter("pw");
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int check = (Integer)sqlMapper.queryForObject("userCheck", dto);//id�뜝�룞�삕 pw�뜝�룞�삕 �뜝�룞�삕移섇뜝�떦紐뚯삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	    
	    if(check==1){
	    	session.invalidate();
	    	sqlMapper.update("deleteMember", id);
	    }
	    request.setAttribute("check", new Integer(check));
		return "/dc/deletePro.jsp";
	}
	
	@RequestMapping("coupleDeleteForm.nhn")//而ㅵ뜝�떆�궪�삕�뜝�룞�삕 �뜝�룞�삕
	public String coupleDeleteForm() throws Exception{
		
		return "/dc/coupleDeleteForm.jsp";
	}
	@RequestMapping("coupleDelete.nhn")//而ㅵ뜝�떆�궪�삕�뜝�룞�삕
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
			
			sqlMapper.update("memCouple0", cdto.getId1()); //而ㅵ뜝�룞�삕 �뜝�룞�삕�뜝�떛釉앹삕 �뜝�뙇�뙋�삕 �쉶�뜝�룞�삕�뜝�룞�삕 id�뜝�룞�삕 �뜝�떙�궪�삕�뜝�뙏�눦�삕 而ㅵ뜝�룞�삕�뜝�떆琉꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 0�뜝�룞�삕�뜝�룞�삕 �뜝�뙐袁쇰뙋�삕
			sqlMapper.update("memCouple0", cdto.getId2());
			sqlMapper.update("deleteCouple", id);			//而ㅵ뜝�룞�삕 �뜝�룞�삕�뜝�떛釉앹삕�뜝�룞�삕 id�뜝�룞�삕 �뜝�떙�궪�삕�뜝�뙏�눦�삕 �뜝�뙏�뙋�삕 �뜝�룞�삕�뜝�뙓�뱶瑜� �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
			sqlMapper.delete("deleteAlert", cdto.getId2()); //而ㅵ뜝�룞�삕 �뜝�룞�삕泥�,�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�떙紐뚯삕�뜝�뙣�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝占�.
			sqlMapper.delete("deleteAlert", cdto.getId1());
		}
		request.setAttribute("ucheck", ucheck);
		request.setAttribute("ccheck", check);
		request.setAttribute("id", id);
		return "/dc/coupleDelete.jsp";
	}
	@RequestMapping("mypage.nhn")// �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception{
		String check =(String)session.getAttribute("fbcheck");
		String id =(String) session.getAttribute("id");
		System.out.println("�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�룞�삕"+check);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕永밧뜝占�"+id);
		
		if(id==null){ // �뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�떍�땲�씛�삕�뜝占� �뜝�떛�슱�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떦寃뚮�먯삕
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
			System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�떙琉꾩삕1"+checkAlert1);
			if(checkAlert1==1){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
		}	
		
		
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleinfo.nhn")//而ㅵ뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=request.getParameter("id");
		LogonDataBean dto2=new LogonDataBean();
		LogonDataBean dto1=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check1 = (Integer)sqlMapper.queryForObject("coupleCheck1", id);	// �쉶�뜝�룞�삕�뜝�룞�삕 id�뜝�룞�삕 而ㅵ뜝�룞�삕�뜝�룞�삕�뜝�떛釉앹삕�뜝�룞�삕 �뜝�떙�궪�삕�뜝�뙏�눦�삕 �뜝�룞�삕�뜝�뙓�뱶媛� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
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
		
		int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); //id�뜝�룞�삕 alert�뜝�룞�삕�뜝�떛釉앹삕�뜝�룞�삕 �뜝�떙�궪�삕. �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 而ㅵ뜝�떆�룞�삕泥� �뜝�뙣�룞�삕�뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
		
		if(checkAlert1==1){
			AlertDataBean adto=new AlertDataBean();
			adto=(AlertDataBean)sqlMapper.queryForObject("getAlert1", id);
			if(adto.getContent().equals("couple")){
				sqlMapper.update("readCheckEnd", id);
			}
		}
		
		
		
		
		
		return "/dc/coupleinfo.jsp";
	}
	@RequestMapping("coupleSearchPro.nhn")//而ㅵ뜝�룞�삕 李얍뜝�룞�삕
	public String coupleSearchPro(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String) session.getAttribute("id");
		System.out.println("而ㅵ뜝�떆�눦�삕移� �뜝�룞�삕�뜝�떛�벝�삕"+id);
		String nickname=request.getParameter("nickname");
		String coupleName=request.getParameter("coupleName");
		LogonDataBean dto=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check=(Integer)sqlMapper.queryForObject("getMemberbync", nickname); //nickname�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�떛釉앹삕�뜝�룞�삕 �뜝�떙�궪�삕�뜝�뙏�눦�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕 �쉶�뜝�룞�삕�뜝�떛�씛�삕�뜝占� 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 
		if(check==1){
			dto = (LogonDataBean)sqlMapper.queryForObject("getMemberbyn", nickname);
			cdto.setId2(dto.getId());
			int checkcouple=(Integer)sqlMapper.queryForObject("getCouple", dto.getId());//而ㅵ뜝�룞�삕 �뜝�룞�삕泥��뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떛諭꾩삕 而ㅵ뜝�룞�삕�뜝�떛�씛�삕�뜝占� 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
			if(checkcouple==1){
				request.setAttribute("fail", "1");
				return "/dc/mypage.jsp";
			}
		}
		cdto.setId1(id);
		cdto.setCoupleName(coupleName);
		cdto.setCoupleImage("couple1.png");
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
	@RequestMapping("couplex.nhn")//而ㅵ뜝�룞�삕 �뜝�떊釉앹삕
	public String couplex(HttpSession session,HttpServletRequest request) throws Exception{
		String id =request.getParameter("id");
		String nickname=(String)sqlMapper.queryForObject("getNick", id);
		sqlMapper.delete("deleteCouple", id);//而ㅵ뜝�룞�삕�뜝�룞�삕�뜝�떛釉앹삕�뜝�룞�삕 �뜝�뙏�뙋�삕 �쉶�뜝�룞�삕�뜝�룞�삕 id�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝�뙓�뱶瑜� �뜝�룞�삕�뜝�룞�삕
		sqlMapper.delete("readCheckReject", nickname);//�뜝�떙紐뚯삕 �뜝�룞�삕�뜝�떛釉앹삕�뜝�룞�삕 �뜝�뙏�뙋�삕 �쉶�뜝�룞�삕�뜝�룞�삕 nickname�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝�뙓�뱶瑜� �뜝�룞�삕�뜝�룞�삕
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleInput.nhn")//而ㅵ뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public String coupleInput(HttpSession session,HttpServletRequest request) throws Exception{
		String nickname=(String) session.getAttribute("nickname");
		String id =request.getParameter("id");
		CoupleDataBean cdto=new CoupleDataBean();
		cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
		sqlMapper.update("memCouple1", cdto.getId1());//�쉶�뜝�룞�삕�뜝�룞�삕 而ㅵ뜝�룞�삕�뜝�떆琉꾩삕�뜝�룞�삕�뜝�룞�삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
		sqlMapper.update("memCouple1", cdto.getId2());
		sqlMapper.update("readCheck", nickname);//�뜝�떙紐뚯삕�뜝�룞�삕�뜝�떛釉앹삕�뜝�룞�삕 readcheck�뜝�룞�삕�뜝�룞�삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 
		sqlMapper.update("coupleComplete", nickname);
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("/diary1.nhn")//而ㅵ뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떛諭꾩삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙇源띿삕
	public String diary(HttpServletRequest request,HttpSession session){
		CoupleDataBean cdto=new CoupleDataBean();
		cdto=(CoupleDataBean) session.getAttribute("coupleData");
		String coupleName=cdto.getCoupleName();
		request.setAttribute("coupleName", coupleName);
		return "/dc/diary.jsp";
	}
	@RequestMapping("/updateImage1.nhn")//�뜝�떛諭꾩삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떥�벝�삕
	public String updateImage(MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		String coupleName = request.getParameter("coupleName");
		String RealPath = request.getRealPath("\\syimage");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		cdb.setCoupleImage(orgName);
		System.out.println("�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�듃�뜝�떛諭꾩삕�뜝�룞�삕1"+cdb.getCoupleImage());
		cdb.setCoupleName(coupleName);
		System.out.println("而ㅵ뜝�떆�냲�삕�뜝�룞�삕"+cdb.getCoupleName());
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMapper.insert("diaryimgUpdate1",cdb);
		request.setAttribute("orgName", orgName);
		request.setAttribute("close", "yes");
		return "/dc/diary.jsp";
	}
	@RequestMapping("/coupleModify.nhn")//而ㅵ뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
	public String coupleModify(HttpSession session,HttpServletRequest request)throws Exception{
		String coupleName = request.getParameter("coupleName");
		String coupleDate = request.getParameter("coupleDate");
		System.out.println(coupleName+"而ㅵ뜝�떆�냲�삕�뜝�룞�삕");
	
		String hidden=request.getParameter("hidden");//�뜝�룞�삕吏� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙇�떎紐뚯삕 hidden�뜝�룞�삕 null�뜝�룞�삕 �뜝�떍�뙋�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�뙃�맂�뙋�삕.
		String id=(String)session.getAttribute("id");
		CoupleDataBean cdto=new CoupleDataBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

		int ccn=(Integer)sqlMapper.queryForObject("checkCoupleName", coupleName);
		System.out.println("泥댄겕而ㅵ뜝�떆�냲�삕�뜝�룞�삕"+ccn);
		if(hidden!=null){
			Date date=sdf.parse(coupleDate);
			if(ccn==1){//而ㅵ뜝�떆紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뙐紐뚯삕 �뜝�룞�삕�뜝�룞�삕
				cdto.setCoupleName(coupleName);
				cdto.setCoupleDate(date);
				System.out.println("date "+date);
				sqlMapper.update("coupleModifyNcYd", cdto);
			}
			else if(ccn==0){//而ㅵ뜝�떆紐뚯삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕
				
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
	public ModelAndView mylist(HttpServletRequest request ,HttpSession session){
		String id=(String) session.getAttribute("id");
		int currentPage;
		int totalCount = 0;
		int blockCount = 10;
		int blockPage = 5;
		if(request.getParameter("currentPage")!=null){
			currentPage =Integer.parseInt(request.getParameter("currentPage"));
		}else{
			currentPage =1;
		}
		String pagingHtml;
		coursePagingTDTO page;
		shareCourseDataBean dto = new shareCourseDataBean();
		int checkMylist=(Integer)sqlMapper.queryForObject("checkMylist", id);
		if(checkMylist==0){
			String getMylist=(String)sqlMapper.queryForObject("getmylist", id);
			String arryMylist[]=getMylist.split(",");
			
			List list = new ArrayList();
			for(int i=0;i<arryMylist.length;i++){
				
				int num=Integer.parseInt(arryMylist[i]);
				list.add(sqlMapper.queryForObject("mylistall", num));
			}
			
			totalCount = list.size();
			
			page = new coursePagingTDTO(currentPage,totalCount,blockCount,blockPage);
			
			pagingHtml = page.getPagingHtml().toString();
			int lastCount = totalCount;
			if (page.getEndCount() <totalCount)
				lastCount = page.getEndCount() +1;
			list = list.subList(page.getStartCount(),lastCount);
			ModelAndView mv = new ModelAndView();
			mv.addObject("list",list);
			mv.addObject("currentPage",currentPage);
			mv.addObject("pagingHtml",pagingHtml);
			mv.setViewName("/dc/shareCourseBoardList.jsp");
		
		return mv;
		}
		else{
			ModelAndView mv = new ModelAndView();
			mv.addObject("non","non");
			mv.setViewName("/dc/shareCourseBoardList.jsp");
			return mv;
		}
			
	}

}
