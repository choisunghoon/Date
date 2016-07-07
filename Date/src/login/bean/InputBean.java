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
	
	@RequestMapping("inputForm.nhn")//占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲 
	public String inputForm() throws Exception{
		
		return "/dc/inputForm.jsp";
	}
	
	@RequestMapping("inputPro.nhn")//占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼩占쎈섣占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 db占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈셾占쎌젾占쎈짗占쎌굲占쎄텕占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈셾占쎈닰占쎌굲(筌ｌ꼪�쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼍筌뤿슣�굲占쎈쐻占쎈짗占쎌굲�뇦�껊쐻占쎈짗占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲燁살꼪�쐻占쎈짗占쎌굲 占쎈쐻占쎈뼏�ⓦ끉�굲 占쎈쐻占쎈솏筌뚭쑴�굲 占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈셾占쎈닰占쎌굲占쎈쐻占쎈짗占쎌굲 占쎌깈占쎈쐻占쎈짗占쎌굲)
	public String inputPro(LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		String nomal=request.getParameter("hidden");
		if(nomal.equals("fb")){//占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼍筌뤿슣�굲占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� db占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓占쎈탵揶쏅�⑹굻占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
			String id=request.getParameter("id");
			dto.setId(id);	
		}dto.setCouple("0");
		sqlMapper.insert("insertMember", dto);//占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼍筌뤿슣�굲占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈뼃占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� inputForm.jsp占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈셾占쎌젾占쎈쿈占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 db占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲.
		return "/dc/inputPro.jsp";
	}
	
	@RequestMapping("confirmId.nhn")//占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓占쎈쿈占쎌굲 占쎈쐻占쎈솯�뇡�빘�굲占쎌넇占쎈쐻占쎈짗占쎌굲
	public String confirmId(String id,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmId",id);//id占쎈쐻占쎈짗占쎌굲 db占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솂占쎈뼄筌뤿슣�굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	    request.setAttribute("id", id);
	    request.setAttribute("check", check);
		return "/dc/confirmId.jsp";
	}
	@RequestMapping("confirmNickname.nhn")//占쎈쐻占쎈뼦占쎈꺋占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솯�뇡�빘�굲占쎌넇占쎈쐻占쎈짗占쎌굲
	public String confirmNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);//nickname占쎈쐻占쎈짗占쎌굲 db占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솂占쎈뼄筌뤿슣�굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/confirmNickname.jsp";
	}
	@RequestMapping("searchNickname.nhn")//占쎈쐻占쎈뼦占쎈꺋占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎌넇占쎈쐻占쎈짗占쎌굲
	public String searchNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/searchNickname.jsp";
	}
	@RequestMapping("confirmCoupleName.nhn")//�뚣뀿�쐻占쎈뻻筌뤿슣�굲 占쎈쐻占쎈솯�뇡�빘�굲 占쎌넇占쎈쐻占쎈짗占쎌굲
	public String confirmCoupleName(String coupleName,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmCoupleName",coupleName);//couplename占쎈쐻占쎈짗占쎌굲 db占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솂占쎈뼄筌뤿슣�굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	    request.setAttribute("coupleName", coupleName);
	    request.setAttribute("check", check);
		return "/dc/confirmCoupleName.jsp";
	}
	
	
	@RequestMapping("modifyForm.nhn")//占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲
	public String modifyForm(HttpServletRequest request,HttpSession session) throws Exception{
				
		String id = (String)session.getAttribute("id"); 
		LogonDataBean dto = new LogonDataBean();
		String check =(String)session.getAttribute("fbcheck");//占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼄�뇡�빘�굲占쎈쐻占쎈뼣占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲. 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲�뎲�꼪�쐻占쎈뼍�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼏占쎌뒄揶쏉옙 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈쑆占쎈르占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈셾占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲�뎲�꼪�쐻占쎈뼍�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎌넞占쎈쐻占쎈짗占쎌굲占쎌넅
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);//占쎈쐻占쎈뼢繹먮씮�굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 id占쎈쐻占쎈짗占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	    request.setAttribute("dto", dto);
	    int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id);//占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼢繹먮씮�굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼄占쎈섣占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼏占쎈뼄筌뤿슣�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎌뵛占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뻻�뜝�뜴�쐻占쎈짗占쎌굲 占쎈쐻占쎈솯筌뤿슣�굲 占쎈쐻占쎈솏筌뤿슣�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼩占쎈선揶쏅뛼�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲.
	    request.setAttribute("nickcheck", nickcheck);
		return "/dc/modifyForm.jsp";
	}
	
	@RequestMapping("modifyPro.nhn")//占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	public String modifyPro(HttpSession session,LogonDataBean dto) throws Exception{
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		LogonDataBean odto = new LogonDataBean();
		odto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		dto.setCouple(odto.getCouple());
		sqlMapper.update("updateMember", dto);
		return "/dc/modifyPro.jsp";
	}
	
	@RequestMapping("deleteForm.nhn")//占쎌돳占쎈쐻占쎈짗占쎌굲 占쎄퉱占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲
	public String deleteForm() throws Exception{
		
		return "/dc/deleteForm.jsp";
	}
	@RequestMapping("deletePro.nhn")//占쎌돳占쎈쐻占쎈짗占쎌굲 占쎄퉱占쎈쐻占쎈짗占쎌굲
	public String deletePro(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		String pw  = request.getParameter("pw");
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int check = (Integer)sqlMapper.queryForObject("userCheck", dto);//id占쎈쐻占쎈짗占쎌굲 pw占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲燁살꼪�쐻占쎈뼣筌뤿슣�굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	    
	    if(check==1){
	    	session.invalidate();
	    	sqlMapper.update("deleteMember", id);
	    }
	    request.setAttribute("check", new Integer(check));
		return "/dc/deletePro.jsp";
	}
	
	@RequestMapping("coupleDeleteForm.nhn")//�뚣뀿�쐻占쎈뻻占쎄땔占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲
	public String coupleDeleteForm() throws Exception{
		
		return "/dc/coupleDeleteForm.jsp";
	}
	@RequestMapping("coupleDelete.nhn")//�뚣뀿�쐻占쎈뻻占쎄땔占쎌굲占쎈쐻占쎈짗占쎌굲
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
			
			sqlMapper.update("memCouple0", cdto.getId1()); //�뚣뀿�쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲 占쎈쐻占쎈솂占쎈솇占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 id占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼑占쎄땔占쎌굲占쎈쐻占쎈솋占쎈닰占쎌굲 �뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈뻻筌뚭쑴�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 0占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솏熬곸눖�솇占쎌굲
			sqlMapper.update("memCouple0", cdto.getId2());
			sqlMapper.update("deleteCouple", id);			//�뚣뀿�쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲占쎈쐻占쎈짗占쎌굲 id占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼑占쎄땔占쎌굲占쎈쐻占쎈솋占쎈닰占쎌굲 占쎈쐻占쎈솋占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈솓占쎈굡�몴占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼩占쎈솇占쎌굲.
			sqlMapper.delete("deleteAlert", cdto.getId2()); //�뚣뀿�쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲筌ｏ옙,占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼑筌뤿슣�굲占쎈쐻占쎈솭占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�.
			sqlMapper.delete("deleteAlert", cdto.getId1());
		}
		request.setAttribute("ucheck", ucheck);
		request.setAttribute("ccheck", check);
		request.setAttribute("id", id);
		return "/dc/coupleDelete.jsp";
	}
	@RequestMapping("mypage.nhn")// 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception{
		String check =(String)session.getAttribute("fbcheck");
		String id =(String) session.getAttribute("id");
		String couplen = null;
		//int chk = Integer.parseInt(request.getParameter("chk"));
		request.setAttribute("check", check);
		request.setAttribute("id", id);
	
		
		if(id==null){ // 占쎈쐻占쎈뼢繹먮씮�굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼃占쎈빍占쎌뵛占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈뼓占쎌뒻占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣野껊슢占쎈Ŋ�굲
			request.setAttribute("gologin", "1");
			return "/sy0526/main.jsp";
		}
		
		else{
			
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			couplen = (String)sqlMapper.queryForObject("selectCouplename", id);
			
		
			if(checkAlert==1){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				session.setAttribute("nickname", nickname);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			if(checkAlert1==1){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
		}	
		request.setAttribute("couplen",couplen);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleinfo.nhn")//�뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id =(String) session.getAttribute("id");
		LogonDataBean dto2=new LogonDataBean();
		LogonDataBean dto1=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check1 = (Integer)sqlMapper.queryForObject("coupleCheck1", id);	// 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 id占쎈쐻占쎈짗占쎌굲 �뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼑占쎄땔占쎌굲占쎈쐻占쎈솋占쎈닰占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈솓占쎈굡揶쏉옙 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
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
		
		int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); //id占쎈쐻占쎈짗占쎌굲 alert占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼑占쎄땔占쎌굲. 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 �뚣뀿�쐻占쎈뻻占쎈짗占쎌굲筌ｏ옙 占쎈쐻占쎈솭占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎌넇占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
		
		if(checkAlert1==1){
			AlertDataBean adto=new AlertDataBean();
			adto=(AlertDataBean)sqlMapper.queryForObject("getAlert1", id);
			if(adto.getContent().equals("couple")){
				sqlMapper.update("readCheckEnd", id);
				sqlMapper.update("chid", id);
			}
		}
		
		
		
		
		
		return "/dc/coupleinfo.jsp";
	}
	@RequestMapping("coupleSearchPro.nhn")//�뚣뀿�쐻占쎈짗占쎌굲 筌≪뼃�쐻占쎈짗占쎌굲
	public String coupleSearchPro(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String) session.getAttribute("id");
		String nickname=request.getParameter("nickname");
		String coupleName=request.getParameter("coupleName");
		LogonDataBean dto=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check=(Integer)sqlMapper.queryForObject("getMemberbync", nickname); //nickname占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼑占쎄땔占쎌굲占쎈쐻占쎈솋占쎈닰占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈솇占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓占쎌뵛占쎌굲占쎈쐻�뜝占� 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
		if(check==1){
			dto = (LogonDataBean)sqlMapper.queryForObject("getMemberbyn", nickname);
			cdto.setId2(dto.getId());
			int checkcouple=(Integer)sqlMapper.queryForObject("getCouple1", dto.getId());//�뚣뀿�쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲筌ｏ옙占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼓獄�袁⑹굲 �뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈뼓占쎌뵛占쎌굲占쎈쐻�뜝占� 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
			if(checkcouple==1){
				request.setAttribute("fail", "1");
				return "/dc/mypage.jsp";
			}
		}
		cdto.setId1(id);
		cdto.setCoupleName(coupleName);
		cdto.setCoupleImage("couple1.jpg");
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
	@RequestMapping("couplex.nhn")//�뚣뀿�쐻占쎈짗占쎌굲 占쎈쐻占쎈뻿�뇡�빘�굲
	public String couplex(HttpSession session,HttpServletRequest request) throws Exception{
		String id =(String) session.getAttribute("id");
		String nickname=(String)sqlMapper.queryForObject("getNick", id);
		sqlMapper.delete("deleteCouple", id);//�뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솋占쎈솇占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 id占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈솓占쎈굡�몴占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
		sqlMapper.delete("readCheckReject", nickname);//占쎈쐻占쎈뼑筌뤿슣�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솋占쎈솇占쎌굲 占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 nickname占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈솓占쎈굡�몴占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleInput.nhn")//�뚣뀿�쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	public String coupleInput(HttpSession session,HttpServletRequest request) throws Exception{
		String nickname=(String) session.getAttribute("nickname");
		String id =(String) session.getAttribute("id");
		CoupleDataBean cdto=new CoupleDataBean();
		cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
		sqlMapper.update("memCouple1", cdto.getId1());//占쎌돳占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 �뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈뻻筌뚭쑴�굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
		sqlMapper.update("memCouple1", cdto.getId2());
		sqlMapper.update("readCheck", nickname);//占쎈쐻占쎈뼑筌뤿슣�굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼓�뇡�빘�굲占쎈쐻占쎈짗占쎌굲 readcheck占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 1占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
		sqlMapper.update("coupleComplete", nickname);
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("/diary1.nhn")//�뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼓獄�袁⑹굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솂繹먮씮�굲
	public String diary(HttpServletRequest request,HttpSession session){
		CoupleDataBean cdto=new CoupleDataBean();
		cdto=(CoupleDataBean) session.getAttribute("coupleData");
		String coupleName=cdto.getCoupleName();
		request.setAttribute("coupleName", coupleName);
		return "/dc/diary.jsp";
	}
	@RequestMapping("/updateImage1.nhn")//占쎈쐻占쎈뼓獄�袁⑹굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼢占쎈쿈占쎌굲
	public String updateImage(MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		String coupleName = request.getParameter("coupleName");
		String RealPath = request.getRealPath("\\syimage");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		cdb.setCoupleImage(orgName);
		cdb.setCoupleName(coupleName);
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMapper.insert("diaryimgUpdate1",cdb);
		request.setAttribute("orgName", orgName);
		request.setAttribute("close", "yes");
		return "/dc/diary.jsp";
	}
	@RequestMapping("/coupleModify.nhn")//�뚣뀿�쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
	public String coupleModify(HttpSession session,HttpServletRequest request)throws Exception{
		String coupleName = request.getParameter("coupleName");
		String coupleDate = request.getParameter("coupleDate");
	
		String hidden=request.getParameter("hidden");//占쎈쐻占쎈짗占쎌굲筌욑옙 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솂占쎈뼄筌뤿슣�굲 hidden占쎈쐻占쎈짗占쎌굲 null占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈뼃占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈셾占쎈쭆占쎈솇占쎌굲.
		String id=(String)session.getAttribute("id");
		CoupleDataBean cdto=new CoupleDataBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

		int ccn=(Integer)sqlMapper.queryForObject("checkCoupleName", coupleName);
		if(hidden!=null){
			Date date=sdf.parse(coupleDate);
			if(ccn==1){//�뚣뀿�쐻占쎈뻻筌뤿슣�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈솏筌뤿슣�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
				cdto.setCoupleName(coupleName);
				cdto.setCoupleDate(date);
				sqlMapper.update("coupleModifyNcYd", cdto);
			}
			else if(ccn==0){//�뚣뀿�쐻占쎈뻻筌뤿슣�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈솇占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占� 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲
				
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
