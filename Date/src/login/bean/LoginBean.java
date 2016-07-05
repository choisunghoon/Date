package login.bean;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ch11.logon.AlertDataBean;
import ch11.logon.CoupleDataBean;
import ch11.logon.LogonDataBean;
import project.bean.EventDataBean;

@Controller
public class LoginBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("main.nhn")//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �샇�뜝�룞�삕�뺝뜝占� �뜝�룞�삕�뜝�룞�삕�뮅�뜝占� �뜝�뙃�눦�삕
	public String main(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id = (String)session.getAttribute("id");

			int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 nickname�뜝�룞�삕 null�뜝�룞�삕 �뜝�룞�삕�뜝占� 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 
			session.setAttribute("id", id);
			request.setAttribute("nickcheck", nickcheck);
			int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
			if(nc==1){
				
				String nickname=(String) sqlMapper.queryForObject("getNick", id); //�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 nickname�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
				session.setAttribute("nickname", nickname);
				int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname); //�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 nickname�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�떙紐뚯삕�뜝�룞�삕 �뜝�뙇�뙋�삕�뜝�룞�삕 �뜝�떙�궪�삕.�뜝�룞�삕�솗�뜝�룞�삕 �뜝�떙紐뚯삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
				int countCN = (Integer)sqlMapper.queryForObject("countCN", id);
				if(countCN>0){System.out.println("aa"+countCN);
				String couplen = (String)sqlMapper.queryForObject("selectCouplename", id);
				System.out.println("bb"+couplen);
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
				if(checkAlert!=0){
					AlertDataBean adto=new AlertDataBean();
					adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname); //�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 nickname�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�떙紐뚯삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
					session.setAttribute("adto", adto);
					
					
					System.out.println(adto.getContent());
					
					int ca=(Integer)sqlMapper.queryForObject("getCouple",id); //�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 id�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 而ㅵ뜝�룞�삕, �샊�뜝�룞�삕 而ㅵ뜝�떆�룞�삕泥��뜝�룞�삕 �뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떙�궪�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�뙇�떎紐뚯삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 
					request.setAttribute("ca", ca);
			}
				int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); // �뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 id�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�떙紐뚯삕�뜝�룞�삕 �뜝�떙�궪�삕. �뜝�룞�삕�뜝�뜽�뿉�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 而ㅵ뜝�떆�룞�삕泥� �뜝�뙣�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
				System.out.println("�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�떙琉꾩삕1"+checkAlert1);
				if(checkAlert1!=0){
					LogonDataBean dto=new LogonDataBean();
					dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
					System.out.println("�뜝�룞�삕�뜝�룞�삕 if dto.getCouple"+dto.getCouple());
					
					
					if(dto.getCouple().equals("1")){	//	�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 而ㅵ뜝�룞�삕 �뜝�떆琉꾩삕�뜝�룞�삕�뜝�룞�삕 1�뜝�떛�씛�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 而ㅵ뜝�떆�눦�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떎諭꾩삕
						request.setAttribute("couple1", "couple1");
					}
				}
				else
					request.setAttribute("couple1", "end");	// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 而ㅵ뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떊釉앹삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떎諭꾩삕
					
			}
			
			
			
			return "/sy0526/main.jsp";
		
		
	}
	
	@RequestMapping("loginPro.nhn")//�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뺝뜝占� �샇�뜝�룞�삕�뮅�뜝占� �뜝�뙃�눦�삕
	public String loginPro(HttpSession session,LogonDataBean dto,HttpServletRequest request) throws Exception{
		String nomal=request.getParameter("hidden");	// �뜝�룞�삕�뜝�뜾媛믣뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�떥源띿삕�뜝�룞�삕�뜝�떦�뙋�삕 �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떛�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떥源띿삕�뜝�룞�삕�뜝�뙥�뙋�삕�뜝�룞�삕 �뜝�떦諭꾩삕 �뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙥�뙋�삕�뜝�룞�삕 �뜝�떎釉앹삕
		String id=(String) request.getParameter("id");
		System.out.println("�뜝�룞�삕�뜝�떛�벝�삕:"+id);
		System.out.println("�뜝�룞�삕�뜝�룞�삕�뱹�뜝�룞�삕�뜝占�:"+nomal);
		int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //�뜝�떥源띿삕�뜝�룞�삕�뜝�떦�뙋�삕 �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 
		request.setAttribute("nickcheck", nickcheck);
		
		if(nomal.equals("nomal")){ //�뜝�떦諭꾩삕 �뜝�떥源띿삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�떥怨ㅼ삕�뜝占�
			int check = (Integer)sqlMapper.queryForObject("userCheck", dto); //id�뜝�룞�삕 pw�뜝�룞�삕 �뜝�룞�삕移� �뜝�떦�뙋�삕�뜝�룞�삕 �뜝�떙�궪�삕. �뜝�룞�삕移섇뜝�떦紐뚯삕 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
			System.out.println(dto.getId()+dto.getPw());
			if(check==1){
				session.setAttribute("id",dto.getId());
				session.setAttribute("check", "no");	// �뜝�떦諭꾩삕 �쉶�뜝�룞�삕�뜝�떥怨ㅼ삕�뜝占� check �뜝�룞�삕�뜝�룞�삕 no�뜝�룞�삕 �뜝�뙇�뒗�뙋�삕.
				
				return "redirect:main.nhn";
			}
			
			request.setAttribute("check", check);	//check�뜝�룞�삕�뜝�룞�삕 0�뜝�룞�삕 �뜝�룞�삕�뜝占� loginPro.jsp�뜝�룞�삕 �뜝�떛�벝�삕�뜝�떦�슱�삕 �뜝�룞�삕艅섇뜝�떕節륁삕�뜝占� �뜝�룞�삕�뜝�떛�벝�삕 �솗�뜝�룞�삕�뜝�떦�씛�삕�뜝占� �뜝�룞�삕�뜝�떆占썲뜝�룞�삕 �뜝�룞�삕�뜝占�
		}
		else{	//�뜝�룞�삕�뜝占� �뜝�떥源띿삕�뜝�룞�삕 �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占�
			int check = (Integer)sqlMapper.queryForObject("FBuserCheck", id);//�뜝�룞�삕�뜝�떛�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떛�벝�삕 db�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�벝�뜝�룞�삕�뜷�뫖�뜝占� 1�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕. �뜝�룞�삕�뜝�룞�삕�벝�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�떗�떎紐뚯삕 0�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
			session.setAttribute("id", id);
			session.setAttribute("check", "yes"); //�뜝�룞�삕�뜝占� �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� check �뜝�룞�삕�뜝�룞�삕 yes�뜝�룞�삕 �뜝�뙇�뒗�뙋�삕.
			if(check==1){//�뜝�룞�삕�뜝�룞�삕�벝�뜝�룞�삕�뜷�뫖�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떛�벝�삕
				return "redirect:main.nhn";
			}
			else{//�뜝�룞�삕�뜝�룞�삕�벝�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�떗�떎紐뚯삕 db�뜝�룞�삕 �뜝�룞�삕�뜝占� �쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦源띿삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떛�벝�삕
				return "redirect:inputPro.nhn?id="+id+"&hidden=fb";
			}
		}
		return "/dc/loginPro.jsp";
	}
	
	@RequestMapping("logout.nhn") //�뜝�떥洹몄븘�슱�삕
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return  "redirect:main.nhn";
	}
	
	
	@RequestMapping("loginForm.nhn") //�뜝�떥源띿삕�뜝�룞�삕�뜝�룞�삕
	public String loginForm(HttpSession session,HttpServletRequest request) throws Exception{
		
		return "/dc/loginForm.jsp";
	}
	@RequestMapping("/couple.nhn") //而ㅵ뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝占� �샇�뜝�룞�삕�뮅�뜝占� �뜝�뙃�눦�삕
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		String chk = request.getParameter("chk");
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
		LogonDataBean ldb = new LogonDataBean();
		if(nc==1){
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);	
				ldb = (LogonDataBean)sqlMapper.queryForObject("getCouple",id);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		ldb = (LogonDataBean)sqlMapper.queryForObject("getCouple",id);
		request.setAttribute("ldb", ldb);
		request.setAttribute("chk", chk);
		return "/sy0526/couple.jsp";
	}
	
	@RequestMapping("/share.nhn") //�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝占� �샇�뜝�룞�삕�뮅�뜝占� �뜝�뙃�눦�삕
	public String share(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
		if(nc==1){
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�떙琉꾩삕1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("�뜝�룞�삕�뜝�룞�삕 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		
		
		return "/sy0526/share.jsp";
	}
	
	@RequestMapping("/theme.nhn") //�뜝�뙎紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �샇�뜝�룞�삕�뺝뜝占� �뜝�룞�삕�뜝�룞�삕�뮅�뜝占� �뜝�뙃�눦�삕
	public String theme(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
		if(nc==1){
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�떙琉꾩삕1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("�뜝�룞�삕�뜝�룞�삕 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/theme.jsp";
	}
	
	@RequestMapping("/event.nhn") //�뜝�떛釉앹삕�듃 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �샇�뜝�룞�삕�뺝뜝占� �뜝�룞�삕�뜝�룞�삕�뮅�뜝占� �뜝�뙃�눦�삕
	public String event(HttpSession session,HttpServletRequest request) throws Exception{
		String chk = request.getParameter("chk");
		request.setAttribute("chk",chk);
		String id = (String)session.getAttribute("id");
		String couplen = null;
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
		if(nc==1){
			int countCN = (Integer)sqlMapper.queryForObject("countCN", id);
			if(countCN>0){
			couplen = (String)sqlMapper.queryForObject("selectCouplename", id);
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
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
			session.setAttribute("couplen", couplen);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�떙琉꾩삕1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("�뜝�룞�삕�뜝�룞�삕 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/event.jsp";
	}
	
	@RequestMapping("/personal.nhn") // �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뺝뜝占� �샇�뜝�룞�삕�뮅�뜝占� �뜝�뙃�눦�삕
	public String personal(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�뜝�떥源띿삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솗�뜝�룞�삕
		if(nc==1){
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
		
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
				
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("�뜝�룞�삕�뜝�룞�삕 泥댄겕�뜝�떙琉꾩삕1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("�뜝�룞�삕�뜝�룞�삕 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}

		return "/sy0526/personal.jsp";
	}
	
}
