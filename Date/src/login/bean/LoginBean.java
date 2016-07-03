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
	
	@RequestMapping("main.nhn")//������������ ȣ��ɶ� ����Ǵ� �Լ�
	public String main(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id = (String)session.getAttribute("id");

			int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //�α����� ȸ���� nickname�� null�� ��� 1�� ���� 
			session.setAttribute("id", id);
			request.setAttribute("nickcheck", nickcheck);
			int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�α��� ���� Ȯ��
			if(nc==1){
				
				String nickname=(String) sqlMapper.queryForObject("getNick", id); //�α����� ȸ���� nickname�� ����
				session.setAttribute("nickname", nickname);
				int checkAlert=(Integer)sqlMapper.queryForObject("checkAlert", nickname); //�α����� ȸ���� nickname�� ���� ���� ���� �˸��� �ִ��� �˻�.��Ȯ�� �˸��� ������� 1�� ����
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
					adto=(AlertDataBean) sqlMapper.queryForObject("getAlert", nickname); //�α����� ȸ���� nickname�� ���� �˸��� ������ ����
					session.setAttribute("adto", adto);
					
					
					System.out.println(adto.getContent());
					
					int ca=(Integer)sqlMapper.queryForObject("getCouple",id); //�α����� ȸ���� id�� ���� ȸ���� Ŀ��, Ȥ�� Ŀ�ý�û�� �� ȸ������ �˻� ������� �ִٸ� 1�� ���� 
					request.setAttribute("ca", ca);
			}
				int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); // �α����� ȸ���� id�� ���� �˸��� �˻�. ���濡�� ���� Ŀ�ý�û �޽����� ������ Ȯ�������� 1�� ����
				System.out.println("���� üũ�˷�1"+checkAlert1);
				if(checkAlert1!=0){
					LogonDataBean dto=new LogonDataBean();
					dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
					System.out.println("���� if dto.getCouple"+dto.getCouple());
					
					
					if(dto.getCouple().equals("1")){	//	�α����� ȸ���� Ŀ�� �÷����� 1�̶�� ������ Ŀ�ü����� ������ �ǹ�
						request.setAttribute("couple1", "couple1");
					}
				}
				else
					request.setAttribute("couple1", "end");	// ������ Ŀ�� ������ �ź������� �ǹ�
					
			}
			
			
			
			return "/sy0526/main.jsp";
		
		
	}
	
	@RequestMapping("loginPro.nhn")//�α����� ����ɶ� ȣ��Ǵ� �Լ�
	public String loginPro(HttpSession session,LogonDataBean dto,HttpServletRequest request) throws Exception{
		String nomal=request.getParameter("hidden");	// ���簪�� ���� �α����ϴ� ȸ���� ���̽������� �α����ߴ��� �Ϲ� �α����� �ߴ��� �Ǻ�
		String id=(String) request.getParameter("id");
		System.out.println("���̵�:"+id);
		System.out.println("����Ǻ���:"+nomal);
		int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id); //�α����ϴ� ȸ���� ������ ������ 1�� ���� 
		request.setAttribute("nickcheck", nickcheck);
		
		if(nomal.equals("nomal")){ //�Ϲ� �α��� ȸ���ΰ��
			int check = (Integer)sqlMapper.queryForObject("userCheck", dto); //id�� pw�� ��ġ �ϴ��� �˻�. ��ġ�ϸ� 1�� ����
			System.out.println(dto.getId()+dto.getPw());
			if(check==1){
				session.setAttribute("id",dto.getId());
				session.setAttribute("check", "no");	// �Ϲ� ȸ���ΰ�� check ���� no�� �ִ´�.
				
				return "redirect:main.nhn";
			}
			
			request.setAttribute("check", check);	//check���� 0�� ��� loginPro.jsp�� �̵��Ͽ� ��й�ȣ�� ���̵� Ȯ���϶�� ���â�� ���
		}
		else{	//��� �α��� ȸ���� ���
			int check = (Integer)sqlMapper.queryForObject("FBuserCheck", id);//���̽��� ���̵� db�� ����Ǿ��ִٸ� 1�� ����. ����Ǿ����� �ʴٸ� 0�� ����
			session.setAttribute("id", id);
			session.setAttribute("check", "yes"); //��� ȸ���� ��� check ���� yes�� �ִ´�.
			if(check==1){//����Ǿ��ִٸ� ������������ �̵�
				return "redirect:main.nhn";
			}
			else{//����Ǿ����� �ʴٸ� db�� ��� ȸ���� ������ �����ϱ� ���� �������� �̵�
				return "redirect:inputPro.nhn?id="+id+"&hidden=fb";
			}
		}
		return "/dc/loginPro.jsp";
	}
	
	@RequestMapping("logout.nhn") //�α׾ƿ�
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return  "redirect:main.nhn";
	}
	
	
	@RequestMapping("loginForm.nhn") //�α�����
	public String loginForm(HttpSession session,HttpServletRequest request) throws Exception{
		
		return "/dc/loginForm.jsp";
	}
	@RequestMapping("/couple.nhn") //Ŀ�������� ����� ȣ��Ǵ� �Լ�
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		String chk = request.getParameter("chk");
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�α��� ���� Ȯ��
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
			System.out.println("���� üũ�˷�1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("���� if dto.getCouple"+dto.getCouple());
				
				
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
	
	@RequestMapping("/share.nhn") //���� ������ ����� ȣ��Ǵ� �Լ�
	public String share(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�α��� ���� Ȯ��
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
			System.out.println("���� üũ�˷�1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("���� if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/share.jsp";
	}
	
	@RequestMapping("/theme.nhn") //�׸� ������ ȣ��ɶ� ����Ǵ� �Լ�
	public String theme(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�α��� ���� Ȯ��
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
			System.out.println("���� üũ�˷�1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("���� if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/theme.jsp";
	}
	
	@RequestMapping("/event.nhn") //�̺�Ʈ ������ ȣ��ɶ� ����Ǵ� �Լ�
	public String event(HttpSession session,HttpServletRequest request) throws Exception{
		String chk = request.getParameter("chk");
		request.setAttribute("chk",chk);
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�α��� ���� Ȯ��
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
			System.out.println("���� üũ�˷�1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("���� if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
			}
		return "/sy0526/event.jsp";
	}
	
	@RequestMapping("/personal.nhn") // ���������� ����ɶ� ȣ��Ǵ� �Լ�
	public String personal(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		int nc=(Integer)sqlMapper.queryForObject("FBuserCheck", id);	//�α��� ���� Ȯ��
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
			System.out.println("���� üũ�˷�1"+checkAlert1);
			if(checkAlert1!=0){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("���� if dto.getCouple"+dto.getCouple());
				
				
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
