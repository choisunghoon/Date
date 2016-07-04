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
	
	@RequestMapping("main.nhn")//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 호占쏙옙占� 占쏙옙占쏙옙풔占� 占쌉쇽옙
	public String main(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id = (String)session.getAttribute("id");

			int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 nickname占쏙옙 null占쏙옙 占쏙옙占� 1占쏙옙 占쏙옙占쏙옙 
			session.setAttribute("id", id);
			request.setAttribute("nickcheck", nickcheck);
			int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//占싸깍옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
			if(nc==1){
				
				String nickname=(String) sqlMapper.queryForObject("getNick", id); //占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 nickname占쏙옙 占쏙옙占쏙옙
				session.setAttribute("nickname", nickname);
				int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname); //占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 nickname占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占싯몌옙占쏙옙 占쌍댐옙占쏙옙 占싯삼옙.占쏙옙확占쏙옙 占싯몌옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 1占쏙옙 占쏙옙占쏙옙
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
					adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname); //占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 nickname占쏙옙 占쏙옙占쏙옙 占싯몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
					session.setAttribute("adto", adto);
					
					
					System.out.println(adto.getContent());
					
					int ca=(Integer)sqlMapper.queryForObject("getCouple",id); //占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 id占쏙옙 占쏙옙占쏙옙 회占쏙옙占쏙옙 커占쏙옙, 혹占쏙옙 커占시쏙옙청占쏙옙 占쏙옙 회占쏙옙占쏙옙占쏙옙 占싯삼옙 占쏙옙占쏙옙占쏙옙占� 占쌍다몌옙 1占쏙옙 占쏙옙占쏙옙 
					request.setAttribute("ca", ca);
			}
				int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); // 占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 id占쏙옙 占쏙옙占쏙옙 占싯몌옙占쏙옙 占싯삼옙. 占쏙옙占썸에占쏙옙 占쏙옙占쏙옙 커占시쏙옙청 占쌨쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 확占쏙옙占쏙옙占쏙옙占쏙옙 1占쏙옙 占쏙옙占쏙옙
				System.out.println("占쏙옙占쏙옙 체크占싯뤄옙1"+checkAlert1);
				if(checkAlert1!=0){
					LogonDataBean dto=new LogonDataBean();
					dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
					System.out.println("占쏙옙占쏙옙 if dto.getCouple"+dto.getCouple());
					
					
					if(dto.getCouple().equals("1")){	//	占싸깍옙占쏙옙占쏙옙 회占쏙옙占쏙옙 커占쏙옙 占시뤄옙占쏙옙占쏙옙 1占싱띰옙占� 占쏙옙占쏙옙占쏙옙 커占시쇽옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占실뱄옙
						request.setAttribute("couple1", "couple1");
					}
				}
				else
					request.setAttribute("couple1", "end");	// 占쏙옙占쏙옙占쏙옙 커占쏙옙 占쏙옙占쏙옙占쏙옙 占신븝옙占쏙옙占쏙옙占쏙옙 占실뱄옙
					
			}
			
			
			
			return "/sy0526/main.jsp";
		
		
	}
	
	@RequestMapping("loginPro.nhn")//占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 호占쏙옙풔占� 占쌉쇽옙
	public String loginPro(HttpSession session,LogonDataBean dto,HttpServletRequest request) throws Exception{
		String nomal=request.getParameter("hidden");	// 占쏙옙占썹값占쏙옙 占쏙옙占쏙옙 占싸깍옙占쏙옙占싹댐옙 회占쏙옙占쏙옙 占쏙옙占싱쏙옙占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙占쌩댐옙占쏙옙 占싹뱄옙 占싸깍옙占쏙옙占쏙옙 占쌩댐옙占쏙옙 占실븝옙
		String id=(String) request.getParameter("id");
		System.out.println("占쏙옙占싱듸옙:"+id);
		System.out.println("占쏙옙占쏙옙퓟占쏙옙占�:"+nomal);
		int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //占싸깍옙占쏙옙占싹댐옙 회占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 1占쏙옙 占쏙옙占쏙옙 
		request.setAttribute("nickcheck", nickcheck);
		
		if(nomal.equals("nomal")){ //占싹뱄옙 占싸깍옙占쏙옙 회占쏙옙占싸곤옙占�
			int check = (Integer)sqlMapper.queryForObject("userCheck", dto); //id占쏙옙 pw占쏙옙 占쏙옙치 占싹댐옙占쏙옙 占싯삼옙. 占쏙옙치占싹몌옙 1占쏙옙 占쏙옙占쏙옙
			System.out.println(dto.getId()+dto.getPw());
			if(check==1){
				session.setAttribute("id",dto.getId());
				session.setAttribute("check", "no");	// 占싹뱄옙 회占쏙옙占싸곤옙占� check 占쏙옙占쏙옙 no占쏙옙 占쌍는댐옙.
				
				return "redirect:main.nhn";
			}
			
			request.setAttribute("check", check);	//check占쏙옙占쏙옙 0占쏙옙 占쏙옙占� loginPro.jsp占쏙옙 占싱듸옙占싹울옙 占쏙옙橘占싫ｏ옙占� 占쏙옙占싱듸옙 확占쏙옙占싹띰옙占� 占쏙옙占시�占쏙옙 占쏙옙占�
		}
		else{	//占쏙옙占� 占싸깍옙占쏙옙 회占쏙옙占쏙옙 占쏙옙占�
			int check = (Integer)sqlMapper.queryForObject("FBuserCheck", id);//占쏙옙占싱쏙옙占쏙옙 占쏙옙占싱듸옙 db占쏙옙 占쏙옙占쏙옙퓸占쏙옙獵摸占� 1占쏙옙 占쏙옙占쏙옙. 占쏙옙占쏙옙퓸占쏙옙占쏙옙占� 占십다몌옙 0占쏙옙 占쏙옙占쏙옙
			session.setAttribute("id", id);
			session.setAttribute("check", "yes"); //占쏙옙占� 회占쏙옙占쏙옙 占쏙옙占� check 占쏙옙占쏙옙 yes占쏙옙 占쌍는댐옙.
			if(check==1){//占쏙옙占쏙옙퓸占쏙옙獵摸占� 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙
				return "redirect:main.nhn";
			}
			else{//占쏙옙占쏙옙퓸占쏙옙占쏙옙占� 占십다몌옙 db占쏙옙 占쏙옙占� 회占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙
				return "redirect:inputPro.nhn?id="+id+"&hidden=fb";
			}
		}
		return "/dc/loginPro.jsp";
	}
	
	@RequestMapping("logout.nhn") //占싸그아울옙
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return  "redirect:main.nhn";
	}
	
	
	@RequestMapping("loginForm.nhn") //占싸깍옙占쏙옙占쏙옙
	public String loginForm(HttpSession session,HttpServletRequest request) throws Exception{
		
		return "/dc/loginForm.jsp";
	}
	@RequestMapping("/couple.nhn") //커占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 호占쏙옙풔占� 占쌉쇽옙
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		String chk = request.getParameter("chk");
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//占싸깍옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
		if(nc==1){
			String nickname=(String) sqlMapper.queryForObject("getNick", id);
			int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname);
			session.setAttribute("nickname", nickname);
			/*int countCN = (Integer)sqlMapper.queryForObject("countCN", id);
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
			}*/
			if(checkAlert!=0){
				AlertDataBean adto=new AlertDataBean();
				adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname);
				session.setAttribute("adto", adto);
				System.out.println(adto.getContent());
			
				int ca=(Integer)sqlMapper.queryForObject("getCouple",id);
				request.setAttribute("ca", ca);
		}
			int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id);
			System.out.println("占쏙옙占쏙옙 체크占싯뤄옙1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("占쏙옙占쏙옙 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		request.setAttribute("chk", chk);
		return "/sy0526/couple.jsp";
	}
	
	@RequestMapping("/share.nhn") //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 호占쏙옙풔占� 占쌉쇽옙
	public String share(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//占싸깍옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
		if(nc==1){
			/*int countCN = (Integer)sqlMapper.queryForObject("countCN", id);
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
			}*/
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
			System.out.println("占쏙옙占쏙옙 체크占싯뤄옙1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("占쏙옙占쏙옙 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		
		
		return "/sy0526/share.jsp";
	}
	
	@RequestMapping("/theme.nhn") //占쌓몌옙 占쏙옙占쏙옙占쏙옙 호占쏙옙占� 占쏙옙占쏙옙풔占� 占쌉쇽옙
	public String theme(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//占싸깍옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
		if(nc==1){/*
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
			}*/
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
			System.out.println("占쏙옙占쏙옙 체크占싯뤄옙1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("占쏙옙占쏙옙 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/theme.jsp";
	}
	
	@RequestMapping("/event.nhn") //占싱븝옙트 占쏙옙占쏙옙占쏙옙 호占쏙옙占� 占쏙옙占쏙옙풔占� 占쌉쇽옙
	public String event(HttpSession session,HttpServletRequest request) throws Exception{
		String chk = request.getParameter("chk");
		request.setAttribute("chk",chk);
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//占싸깍옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
		if(nc==1){
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
			System.out.println("占쏙옙占쏙옙 체크占싯뤄옙1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("占쏙옙占쏙옙 if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/event.jsp";
	}
	
	@RequestMapping("/personal.nhn") // 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 호占쏙옙풔占� 占쌉쇽옙
	public String personal(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//占싸깍옙占쏙옙 占쏙옙占쏙옙 확占쏙옙
		if(nc==1){
		/*	String couplen = (String)sqlMapper.queryForObject("selectCouplename", id);		
			EventDataBean eto = new EventDataBean()	;			
			int checkcount = (Integer)sqlMapper.queryForObject("checkcount", couplen);
			if (checkcount > 0) {
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
			}*/
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
			System.out.println("占쏙옙占쏙옙 체크占싯뤄옙1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("占쏙옙占쏙옙 if dto.getCouple"+dto.getCouple());
				
				
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
