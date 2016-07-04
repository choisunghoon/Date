package dateplan.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class DateMap {
	@Autowired
	private SqlMapClientTemplate sqlMap;//자동으로 값 받아줌
	
	
	@RequestMapping("DateMap.nhn")
	public String dateMap(HttpServletRequest request) throws Exception{
				
		return "/dateplan/dateMap.jsp";
	}
	
	@RequestMapping("datepostSave.nhn")
	public String datepostSave(DTO dto,MultipartHttpServletRequest request) throws Exception{
		
		Iterator<String> iterator = request.getFileNames();
		int pidsize = Integer.parseInt(request.getParameter("pidsize"));
		String[] cont = new String[pidsize];
		for(int i =0;i<pidsize;i++){
			cont[i] = request.getParameter("content"+Integer.toString(i+1));
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String[] src = new String[pidsize];
		String path = "F:\\git\\Date\\Date\\WebContent\\dateplan\\dateImage\\";
		int i = 0;
		while(iterator.hasNext()){
			multipartFile = request.getFile(iterator.next());
			originalFileName = multipartFile.getOriginalFilename();
			multipartFile.transferTo(new File(path + originalFileName));
			src[i] = originalFileName;
			i++;
		}
		String postsrc="";
		String content="";
		for(int j=0;j<src.length;j++){
			if(j==0){
			postsrc=src[j];
			content=cont[j];
			
			}else{
				postsrc = postsrc +","+ src[j];
				content = content +"///"+ cont[j]; 
			}
		}
		dto.setContent(content);
		dto.setPostsrc(postsrc);
		dto.setNum(num);
		sqlMap.update("insertsrc", dto);
		return "/dateplan/datepostSave.jsp";
	}
	@RequestMapping("datepost.nhn")
	public String datepost(HttpServletRequest request,DTO dto) throws Exception{
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto= (DTO)sqlMap.queryForObject("selectcosnum",num);
		String[] pid = dto.getPlaceid().split(",");
		int pidsize = pid.length;
		if(dto.getPostcheck().equals("1")){
			String[] content = dto.getContent().split("///");
			String[] postsrc = dto.getPostsrc().split(",");
			request.setAttribute("content", content);
			request.setAttribute("postsrc", postsrc);
		}
	
		request.setAttribute("pidsize", pidsize);
		request.setAttribute("dto", dto);
		
		
		
		request.setAttribute("num",num);
				
		return "/dateplan/datepost.jsp";
	}
	@RequestMapping("datePostscript.nhn")
	public String datePostscript(HttpServletRequest request,DTO dto) throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("selectcpname", id);
		List cosList = new ArrayList();
		
		cosList = sqlMap.queryForList("selectcoscop", couplename);
		
		
		request.setAttribute("cosList",cosList);
		return "/dateplan/datePostscript.jsp";
	}
	@RequestMapping("index.nhn")
	public String dateBoard(HttpServletRequest request) throws Exception{
				
		return "/dateboard/test.jsp";
	}
	@RequestMapping("dateBoard.nhn")
	public String dateBoard(HttpServletRequest request,DTO dto){
		dto= (DTO)sqlMap.queryForObject("selectcos",null);
		
		
		request.setAttribute("dto", dto);

		return "/dateboard/dateboardd.jsp";
	}
	@RequestMapping("datePlan.nhn")
	public String dateMap2(HttpServletRequest request,DTO dto) throws Exception{
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto= (DTO)sqlMap.queryForObject("selectcosnum",num);
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("num",num);
		
		return "/dateplan/datePlan.jsp";
	}
	@RequestMapping("cosSave.nhn")
	public String cosSave(HttpServletRequest request,DTO dto) throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("selectcpname", id);
		dto.setCouplename(couplename);
		sqlMap.insert("insertcos", dto);
			
		request.setAttribute("dto", dto);
		
		return "redirect:couple.nhn";
	}
	@RequestMapping("datecos.nhn")
	public String datecos(HttpServletRequest request,DTO dto){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String couplename = (String)sqlMap.queryForObject("selectcpname", id);
		List cosList = new ArrayList();
		
		cosList = sqlMap.queryForList("selectcoscop", couplename);
		
		
		request.setAttribute("cosList", cosList);
		
		return "/dateplan/datecos.jsp";
	}
	@RequestMapping("delcos.nhn")
	public String delcos(HttpServletRequest request,DTO dto){
		
		
		return "/dateplan/datecos.jsp";
	}
	
	@RequestMapping("cosUpdate.nhn")
	public String cosUpdate(HttpServletRequest request,DTO dto) throws Exception{
			
			DTO sdto= new DTO();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			int num = Integer.parseInt(request.getParameter("num"));
			sdto = (DTO)sqlMap.queryForObject("selectcos", num);
			dto.setNum(sdto.getNum());
			
			sqlMap.update("updatecos", dto);
		
		request.setAttribute("dto", dto);
	
		return "redirect:couple.nhn";
	}
}
