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
import dateplan.bean.DTO;
import event.EventDataBean;
import upload.bean.DiaryDataBean;
import upload.bean.PhotoDataBean;
import upload.bean.PointDataBean;

@Controller
public class InputBean {
	@Autowired
	private SqlMapClientTemplate sqlMapper;
	
	@RequestMapping("inputForm.nhn")//ȸ������ �� 
	public String inputForm() throws Exception{
		
		return "/dc/inputForm.jsp";
	}
	
	@RequestMapping("inputPro.nhn")//ȸ������ ������ �Ѿ�� ������ db�� �Է½�Ű�� ���� �Լ�(ó�� �����ϴ� ���ȸ���ΰ�� ȸ���������� ��ġ�� �ʰ� �ٷ� �� �Լ��� ȣ��)
	public String inputPro(LogonDataBean dto,HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		String nomal=request.getParameter("hidden");
		System.out.println("input nomal"+nomal);
		if(nomal.equals("fb")){//���ȸ���� ��� db�� ���̵𰪸� ����
			String id=request.getParameter("id");
			dto.setId(id);	
		}dto.setCouple("0");
		sqlMapper.insert("insertMember", dto);//���ȸ���� �ƴ� ��� inputForm.jsp���� �Էµ� ���� db�� ����.
		return "/dc/inputPro.jsp";
	}
	
	@RequestMapping("confirmId.nhn")//���̵� �ߺ�Ȯ��
	public String confirmId(String id,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmId",id);//id�� db�� �ִٸ� 1�� ����
	    request.setAttribute("id", id);
	    request.setAttribute("check", check);
		return "/dc/confirmId.jsp";
	}
	@RequestMapping("confirmNickname.nhn")//�г��� �ߺ�Ȯ��
	public String confirmNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);//nickname�� db�� �ִٸ� 1�� ����
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/confirmNickname.jsp";
	}
	@RequestMapping("searchNickname.nhn")//�г��� ���� Ȯ��
	public String searchNickname(String nickname,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmNickname",nickname);
	    request.setAttribute("nickname", nickname);
	    request.setAttribute("check", check);
		return "/dc/searchNickname.jsp";
	}
	@RequestMapping("confirmCoupleName.nhn")//Ŀ�ø� �ߺ� Ȯ��
	public String confirmCoupleName(String coupleName,HttpServletRequest request) throws Exception{
	    int check = (Integer)sqlMapper.queryForObject("confirmCoupleName",coupleName);//couplename�� db�� �ִٸ� 1�� ����
	    request.setAttribute("coupleName", coupleName);
	    request.setAttribute("check", check);
		return "/dc/confirmCoupleName.jsp";
	}
	
	
	@RequestMapping("modifyForm.nhn")//ȸ������ ���� ��
	public String modifyForm(HttpServletRequest request,HttpSession session) throws Exception{
				
		String id = (String)session.getAttribute("id"); 
		LogonDataBean dto = new LogonDataBean();
		String check =(String)session.getAttribute("fbcheck");//��� ȸ���� �Ǻ��ϴ� ����. ��� ȸ���� ��й�ȣ ������ �� �ʿ䰡 ���⶧���� ��� ȸ�����Դ� ��й�ȣ ���� ����� ��Ȱ��ȭ
		System.out.println("���� üũ��"+check);
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		dto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);//�α����� ȸ���� id�� ȸ�� ������ ����
	    request.setAttribute("dto", dto);
	    int nickcheck = (Integer)sqlMapper.queryForObject("nickCheck", id);//��� ȸ���� �α��������� ������ �����Ǿ����� �ʴٸ� ������ �����϶�� ���â�� �߸� �ٸ� �������� �Ѿ������.
	    request.setAttribute("nickcheck", nickcheck);
		return "/dc/modifyForm.jsp";
	}
	
	@RequestMapping("modifyPro.nhn")//ȸ������ ����
	public String modifyPro(HttpSession session,LogonDataBean dto) throws Exception{
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		LogonDataBean odto = new LogonDataBean();
		odto = (LogonDataBean)sqlMapper.queryForObject("getMember", id);
		dto.setCouple(odto.getCouple());
		sqlMapper.update("updateMember", dto);
		return "/dc/modifyPro.jsp";
	}
	
	@RequestMapping("deleteForm.nhn")//ȸ�� Ż�� ��
	public String deleteForm() throws Exception{
		
		return "/dc/deleteForm.jsp";
	}
	@RequestMapping("deletePro.nhn")//ȸ�� Ż��
	public String deletePro(HttpSession session,HttpServletRequest request) throws Exception{
		String id = (String)session.getAttribute("id");
		String pw  = request.getParameter("pw");
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setPw(pw);
		int check = (Integer)sqlMapper.queryForObject("userCheck", dto);//id�� pw�� ��ġ�ϸ� 1�� ����
	    
	    if(check==1){
	    	session.invalidate();
	    	sqlMapper.update("deleteMember", id);
	    }
	    request.setAttribute("check", new Integer(check));
		return "/dc/deletePro.jsp";
	}
	
	@RequestMapping("coupleDeleteForm.nhn")//Ŀ�û��� ��
	public String coupleDeleteForm() throws Exception{
		
		return "/dc/coupleDeleteForm.jsp";
	}
	@RequestMapping("coupleDelete.nhn")//Ŀ�û���
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
			
			sqlMapper.update("memCouple0", cdto.getId1()); //Ŀ�� ���̺� �ִ� ȸ���� id�� �˻��ؼ� Ŀ���÷��� ���� 0���� �ٲ۴�
			sqlMapper.update("memCouple0", cdto.getId2());
			sqlMapper.update("deleteCouple", id);			//Ŀ�� ���̺��� id�� �˻��ؼ� �ش� ���ڵ带 �����Ѵ�.
			sqlMapper.delete("deleteAlert", cdto.getId2()); //Ŀ�� ��û,���������� ���� �˸��޽������� �����.
			sqlMapper.delete("deleteAlert", cdto.getId1());
		}
		request.setAttribute("ucheck", ucheck);
		request.setAttribute("ccheck", check);
		request.setAttribute("id", id);
		return "/dc/coupleDelete.jsp";
	}
	@RequestMapping("mypage.nhn")// ���� ������
	public String mypage(HttpSession session,HttpServletRequest request) throws Exception{
		String check =(String)session.getAttribute("fbcheck");
		String id =(String) session.getAttribute("id");
		System.out.println("���� üũ��"+check);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		System.out.println("������̵�"+id);
		
		if(id==null){ // �α����� ȸ���� �ƴ϶�� �̿����� ���ϰԲ�
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
			System.out.println("���������� üũ�˷�1"+checkAlert1);
			if(checkAlert1==1){
				LogonDataBean dto=new LogonDataBean();
				dto=(LogonDataBean)sqlMapper.queryForObject("getMember", id);
				System.out.println("���������� if dto.getCouple"+dto.getCouple());
				
				
				if(dto.getCouple().equals("1")){
					request.setAttribute("couple1", "couple1");
				}
			}
			else
				request.setAttribute("couple1", "end");
		}	
		
		
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleinfo.nhn")//Ŀ������ ���� 
	public String couple(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=request.getParameter("id");
		LogonDataBean dto2=new LogonDataBean();
		LogonDataBean dto1=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check1 = (Integer)sqlMapper.queryForObject("coupleCheck1", id);	// ȸ���� id�� Ŀ�����̺��� �˻��ؼ� ���ڵ尡 ������ 1�� ����
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
		
		int checkAlert1=(Integer)sqlMapper.queryForObject("checkAlert1", id); //id�� alert���̺��� �˻�. ������ Ŀ�ý�û �޽����� Ȯ�������� 1�� ����
		
		if(checkAlert1==1){
			AlertDataBean adto=new AlertDataBean();
			adto=(AlertDataBean)sqlMapper.queryForObject("getAlert1", id);
			if(adto.getContent().equals("couple")){
				sqlMapper.update("readCheckEnd", id);
			}
		}
		
		
		
		
		
		return "/dc/coupleinfo.jsp";
	}
	@RequestMapping("coupleSearchPro.nhn")//Ŀ�� ã��
	public String coupleSearchPro(HttpSession session,HttpServletRequest request) throws Exception{
		
		String id=(String) session.getAttribute("id");
		System.out.println("Ŀ�ü�ġ ���̵�"+id);
		String nickname=request.getParameter("nickname");
		String coupleName=request.getParameter("coupleName");
		LogonDataBean dto=new LogonDataBean();
		CoupleDataBean cdto=new CoupleDataBean();
		int check=(Integer)sqlMapper.queryForObject("getMemberbync", nickname); //nickname���� ��� ���̺��� �˻��ؼ� �����ϴ� ȸ���̶�� 1�� ���� 
		if(check==1){
			dto = (LogonDataBean)sqlMapper.queryForObject("getMemberbyn", nickname);
			cdto.setId2(dto.getId());
			int checkcouple=(Integer)sqlMapper.queryForObject("getCouple", dto.getId());//Ŀ�� ��û�� ������ �̹� Ŀ���̶�� 1�� ����
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
	@RequestMapping("couplex.nhn")//Ŀ�� �ź�
	public String couplex(HttpSession session,HttpServletRequest request) throws Exception{
		String id =request.getParameter("id");
		String nickname=(String)sqlMapper.queryForObject("getNick", id);
		sqlMapper.delete("deleteCouple", id);//Ŀ�����̺��� �ش� ȸ���� id�� �����ϴ� ���ڵ带 ����
		sqlMapper.delete("readCheckReject", nickname);//�˸� ���̺��� �ش� ȸ���� nickname�� �����ϴ� ���ڵ带 ����
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("coupleInput.nhn")//Ŀ�� ����
	public String coupleInput(HttpSession session,HttpServletRequest request) throws Exception{
		String nickname=(String) session.getAttribute("nickname");
		String id =request.getParameter("id");
		CoupleDataBean cdto=new CoupleDataBean();
		cdto = (CoupleDataBean)sqlMapper.queryForObject("getCoupleData", id);
		sqlMapper.update("memCouple1", cdto.getId1());//ȸ���� Ŀ���÷����� 1�� ����
		sqlMapper.update("memCouple1", cdto.getId2());
		sqlMapper.update("readCheck", nickname);//�˸����̺��� readcheck���� 1�� ���� 
		sqlMapper.update("coupleComplete", nickname);
		request.setAttribute("id", id);
		return "/dc/mypage.jsp";
	}
	@RequestMapping("/diary1.nhn")//Ŀ�������� �̹������� �ֱ�
	public String diary(HttpServletRequest request,HttpSession session){
		CoupleDataBean cdto=new CoupleDataBean();
		cdto=(CoupleDataBean) session.getAttribute("coupleData");
		String coupleName=cdto.getCoupleName();
		request.setAttribute("coupleName", coupleName);
		return "/dc/diary.jsp";
	}
	@RequestMapping("/updateImage1.nhn")//�̹������� ���ε�
	public String updateImage(MultipartHttpServletRequest request,CoupleDataBean cdb)throws Exception{

		String coupleName = request.getParameter("coupleName");
		String RealPath = request.getRealPath("\\syimage");
		MultipartFile file = request.getFile("save");
		String orgName = file.getOriginalFilename();
		cdb.setCoupleImage(orgName);
		System.out.println("������Ʈ�̹���1"+cdb.getCoupleImage());
		cdb.setCoupleName(coupleName);
		System.out.println("Ŀ�ó���"+cdb.getCoupleName());
		File copy = new File(RealPath+"/"+orgName);
		file.transferTo(copy);
		sqlMapper.insert("diaryimgUpdate1",cdb);
		request.setAttribute("orgName", orgName);
		request.setAttribute("close", "yes");
		return "/dc/diary.jsp";
	}
	@RequestMapping("/coupleModify.nhn")//Ŀ������ ����
	public String coupleModify(HttpSession session,HttpServletRequest request)throws Exception{
		String coupleName = request.getParameter("coupleName");
		String coupleDate = request.getParameter("coupleDate");
		System.out.println(coupleName+"Ŀ�ó���");
	
		String hidden=request.getParameter("hidden");//��¥ ������ �ִٸ� hidden�� null�� �ƴ� ���� �����Եȴ�.
		String id=(String)session.getAttribute("id");
		CoupleDataBean cdto=new CoupleDataBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

		int ccn=(Integer)sqlMapper.queryForObject("checkCoupleName", coupleName);
		System.out.println("üũĿ�ó���"+ccn);
		if(hidden!=null){
			Date date=sdf.parse(coupleDate);
			if(ccn==1){//Ŀ�ø� ������ ���ٸ� ����
				cdto.setCoupleName(coupleName);
				cdto.setCoupleDate(date);
				System.out.println("date "+date);
				sqlMapper.update("coupleModifyNcYd", cdto);
			}
			else if(ccn==0){//Ŀ�ø��� �����ϴ� ��� ����
				
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
