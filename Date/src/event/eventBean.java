package event;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class eventBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;//자동으로 값 받아줌

	@SuppressWarnings("null")
	@RequestMapping("eventTeb.nhn")
	public String eventTab(HttpServletRequest request){
		EventDataBean eto = new EventDataBean();
		List eventList = null;
		//List eventimg = null;
		int count = 0;	
		Timestamp date = new Timestamp(System.currentTimeMillis());
		//String date =  System.currentTimeMillis();
		String[] srclist = null;
		String path = request.getContextPath() +"/project/";	
		eventList = sqlMap.queryForList("getEventList",null);			
		count = (Integer)sqlMap.queryForObject("eventCount",null);
		//String[] src = new String[count];
		System.out.println(count);
		for(int i=0; i<count; i++){			
			eto =(EventDataBean)eventList.get(i);
			srclist = eto.getEimg().split(",");		
			System.out.println("srclist: " + srclist[0]);
			System.out.println("path: "+path);
		    //src[i] = path +srclist[0];	
		    //System.out.println("src:"+src[0]);
		    eto.setEimg(path +srclist[0]);
		    System.out.println("eto.getEimg: "+eto.getEimg());
		}	 
		
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", (Integer)count);
		return "/event/eventTeb.jsp";
	}
	
/*	@RequestMapping("addEvent.nhn")
	public String addEvent(MultipartHttpServletRequest request, EventDataBean eto)throws Exception{
		MultipartFile file1 = request.getFile("upload1");
		MultipartFile file2 = request.getFile("upload2");
		String orgName1 = file1.getOriginalFilename();
		String orgName2 = file2.getOriginalFilename();
		File copy1 = new File("C:\\Users\\user2\\workspace\\Spring\\WebContent\\project"+orgName1);
		File copy2 = new File("C:\\Users\\user2\\workspace\\Spring\\WebContent\\project"+orgName2);
		file1.transferTo(copy1);
		file2.transferTo(copy2);
		request.setAttribute("orgName1", orgName1);
		request.setAttribute("orgName2", orgName2);
		eto.setEimg(orgName1+","+orgName2);
		sqlMap.insert("addEvent", eto);
		return "/project/addEvent.jsp";
	}*/
	

	
	
}
