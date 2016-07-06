package share;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dateplan.bean.DTO;
import upload.bean.DiaryDataBean;

@Controller
public class shareBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;

	
	//공유 코스 코멘트 리스트 불러오기
	@RequestMapping("courseComment.nhn")
	public String courseComment(HttpSession session,HttpServletRequest request,int num){
		List commentList =null;
		int listMore = 10;
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		commentDataBean dto = new commentDataBean();
		commentList = sqlMap.queryForList("SelectCourseCommentAll",num);
		int totalCount = (Integer)sqlMap.queryForObject("courseCommentCount", num);
		System.out.println(totalCount);

		request.setAttribute("listMore", listMore);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("commentList", commentList);
		return "/yh/courseComment.jsp";
	}
	
	//공유코스  코멘트 작성
	@RequestMapping("courseCommentUp.nhn")
	public String courseCommentUp(HttpServletRequest request ,HttpSession session,int num)throws Exception{
		
		commentDataBean dto = new commentDataBean();
		
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		System.out.println("아이디"+" " +id);
		
		String coursecomment = request.getParameter("coursecomment");
		dto.setCoursecomment(coursecomment);
		System.out.println("코멘트값"+" " +coursecomment);
		
		dto.setBoard_num(num);
		System.out.println("넘버값"+" " +num);
		
		String img = request.getParameter("img");
		dto.setImg(img);
		System.out.println("이미지"+" " +img);
		
		dto.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		sqlMap.insert("SelectCoupseCommentUp",dto);

		return "/yh/courseComment.jsp";
	}
	
	//공유 코스 코멘트 삭제
	@RequestMapping("courseCommentDelete.nhn")
	public String courseCommentDelete(HttpServletRequest request,HttpSession session)throws Exception{
    	commentDataBean dto = new commentDataBean();
		String id = (String)session.getAttribute("id");
		String num = request.getParameter("commentnum");

		sqlMap.delete("courseCommentDelet", num);

		return "/yh/courseComment.jsp";
    	
    }
	
	//공유 다이어리 코멘트 삭제
	@RequestMapping("commentDelete.nhn")
	public String commentDelete(HttpServletRequest request,HttpSession session)throws Exception{
    	commentDataBean dto = new commentDataBean();
		String id = (String)session.getAttribute("id");
		String num = request.getParameter("commentnum");
		
		sqlMap.delete("diaryCommentDelet", num);
		return "/yh/diaryComment.jsp";
    	
    }
	
	//공유다이어리 코멘트 작성
	@RequestMapping("commentUp.nhn")
	public String commentUp(HttpServletRequest request ,HttpSession session,int num)throws Exception{
		
		commentDataBean dto = new commentDataBean();
		
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		System.out.println("아이디"+" " +id);
		
		String diarycomment = request.getParameter("diarycomment");
		dto.setDiarycomment(diarycomment);
		System.out.println("코멘트값"+" " +diarycomment);
		
		dto.setBoard_num(num);
		System.out.println("넘버값"+" " +num);
		
		String img = request.getParameter("img");
		dto.setImg(img);
		System.out.println("이미지"+" " +img);
		
		dto.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		sqlMap.insert("SelectDiaryCommentUp",dto);

		return "/yh/diaryComment.jsp";
	}
	
	//공유다이어리 코멘트 리스트 불러오기
	@RequestMapping("dairyComment.nhn")
	public String dairyComment(HttpSession session,HttpServletRequest request,int num){
		List commentList =null;
		int listMore = 10;
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		commentDataBean dto = new commentDataBean();
		commentList = sqlMap.queryForList("SelectDiaryCommentAll",num);
		int totalCount = (Integer)sqlMap.queryForObject("commentCount", num);
		System.out.println(totalCount);

		request.setAttribute("listMore", listMore);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("commentList", commentList);
		return "/yh/diaryComment.jsp";
	}

	//공유다이어리리스트 게시판
	@RequestMapping("shareDiaryBoard.nhn")
	public ModelAndView shareDiaryBoard(HttpServletRequest request ,HttpSession session){

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
		pagingDTO page;
		
		List list = new ArrayList();
		list = sqlMap.queryForList("shereSelectDiaryBoardAll",null);
		totalCount = list.size();
		page = new pagingDTO(currentPage,totalCount,blockCount,blockPage);
		
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() <totalCount)
			lastCount = page.getEndCount() +1;
		list = list.subList(page.getStartCount(),lastCount);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("pagingHtml",pagingHtml);
		mv.addObject("currentPage",currentPage);
		mv.setViewName("/yh/shareDiaryBoardList.jsp");
		return mv;
	}
	
	//공유다이어리 글일기
	@RequestMapping("shareDiaryBoardView.nhn")
	public ModelAndView shareDiaryBoardView(HttpServletRequest request, HttpSession session,int num){
		
		sqlMap.update("shereDiaryUpdateReadCount", num);

		String id = (String)session.getAttribute("id");
		String couplename = (String) sqlMap.queryForObject("serchCouplename",id);

		likeDataBean dto1 = new likeDataBean();
		DiaryDataBean dto = new DiaryDataBean();
		dto = (DiaryDataBean)sqlMap.queryForObject("shereDiarySelectNum", num);
		
		String place = "다이어리 공유";
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("YYYYMMdd");
		String reg = format.format(timestamp);
		
		List list = new ArrayList();
		
		Map map = new HashMap();
		map.put("num", num);
		map.put("couplename", couplename);
		map.put("place", place);
		map.put("reg", reg);
		list.add(map);
		
		int check = (Integer)sqlMap.queryForObject("shereDiaryLikePro",map);
		
		int check1 = (Integer)sqlMap.queryForObject("likeLimit",map);

		System.out.println("체크값 몇이냐" +" " +check);
		System.out.println(" check1 숫자" +" " +check1);
		System.out.println(" reg 숫자" +" " +reg);
		System.out.println(" couplename 이름" +" " + couplename);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.addObject("num",num);
		mv.addObject("check",check);
		mv.addObject("couplename",couplename);
		mv.addObject("check1",check1);
		mv.setViewName("/yh/shareDiaryBoardView.jsp");
		return mv;
	
	}
	
	//공유 코스 게시판 리스트
	@RequestMapping("shareCourseBoard.nhn")
	public ModelAndView shareCourseBoard(HttpServletRequest request ,HttpSession session){
		
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
		
		List list = new ArrayList();
		list = sqlMap.queryForList("shereSelectCourseBoardAll",null);
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
		mv.setViewName("/yh/shareCourseBoardList.jsp");
		return mv;
	}
	
	//공유 코스 글 읽기
	@RequestMapping("shareCourseBoardView.nhn")
	public ModelAndView shareCourseBoardView(HttpServletRequest request, HttpSession session,int num){
	
		
		String id = (String)session.getAttribute("id");
		String couplename = (String) sqlMap.queryForObject("serchCouplename",id);
		sqlMap.update("shereCourseUpdateReadCount", num);

		DTO dto = new DTO();
		dto = (DTO)sqlMap.queryForObject("shereCourseSelectNum", num);
		
		String place = "데이트코스 공유";
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("YYYYMMdd");
		String reg = format.format(timestamp);
		
		List list = new ArrayList();

		Map map = new HashMap();
		map.put("couplename", couplename);
		map.put("num", num);
		map.put("place", place);
		map.put("reg", reg);
		list.add(map);
	
		int check = (Integer)sqlMap.queryForObject("shereCourseLikePro",map);
		
		int check1 = (Integer)sqlMap.queryForObject("likeLimit",map);

		System.out.println("체크값 몇이냐" +" " +check);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.addObject("num",num);
		mv.addObject("check",check);
		mv.addObject("couplename",couplename);
		mv.addObject("check1",check1);
		mv.setViewName("/yh/shareCourseBoardView.jsp");
		return mv;
	
	}

	//공유다이어리 좋아요 기능
	@RequestMapping("shareDiaryLikeCount.nhn")
	public ModelAndView DiarylikeCount(int num,HttpServletRequest request, HttpSession session, int check1){

		String id = (String)session.getAttribute("id");
		String couplename = (String) sqlMap.queryForObject("serchCouplename",id);
		System.out.println("커플네임"+ couplename);
		
		pointDataBean dto2 = new pointDataBean();
		
		Timestamp regdate = new Timestamp(System.currentTimeMillis());
		String place = "다이어리 공유";
		
		List list = new ArrayList();

		Map map = new HashMap();
		map.put("couplename", couplename);
		map.put("num", num);
		map.put("regdate", regdate);
		map.put("place", place);
		list.add(map);
		System.out.println("1couplename"+" "+couplename);
		System.out.println("2num"+" "+num);
		System.out.println("3regdate"+" "+regdate);
		
		DiaryDataBean dto = new DiaryDataBean();
		likeDataBean dto1 = new likeDataBean();
		
		int check = (Integer)sqlMap.queryForObject("shereDiaryLikePro",map);
		System.out.println("3check"+" "+check);

		if (check ==1){
			sqlMap.update("shereDiaryLikeCountDown", map);
			System.out.println("좋아요 감소");
			sqlMap.delete("shereDeleteLike", map);
			System.out.println("이글의 좋아요멤버삭제");
			sqlMap.insert("shereUsePoint", map);
			System.out.println("다이어리공유 포인트감소 기록");
			sqlMap.update("sherePointCountDown", map);
			System.out.println("멤버 좋아요로 획득한 포인트 감소 ");
			
		}else{
			sqlMap.update("shereDiaryLikeCountUp", map);
			System.out.println("좋아요 증가");
			sqlMap.insert("shereInsertLike", map);
			System.out.println("이글의 좋아요멤버추가");
			sqlMap.insert("shereGetPoint", map);
			System.out.println("다이어리공유 포인트증가 기록");
			sqlMap.update("sherePointCountUp", map);
			System.out.println("멤버 좋아요로 획득한 포인트 증가 ");
		}
		
		int likecount = (Integer)sqlMap.queryForObject("shereDiaryLike", num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.addObject("dto1",dto1);
		mv.addObject("num",num);
		mv.addObject("check",check);
		mv.addObject("likecount",likecount);
		mv.setViewName("/yh/likeCount.jsp");
		return mv;
		
	}


	@RequestMapping("likeLimit.nhn")
	public String likeLimit(HttpServletRequest request, HttpSession session){
		
		likeDataBean dto1 = new likeDataBean();
		String id = (String)session.getAttribute("id");
		String couplename = (String) sqlMap.queryForObject("serchCouplename",id);
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy_MM_dd");
		String reg = format.format(timestamp);
		
		System.out.println(reg);
		System.out.println(couplename);
		
		List list = new ArrayList();

		Map map = new HashMap();
		map.put("regdate", reg);
		map.put("couplename", couplename);
		list.add(map);
		
		int check = (Integer)sqlMap.queryForObject("likeLimit",map);

		request.setAttribute("check", check);
			return "/yh/shartDiaryBoardView.jsp";
		}

	//공유 코스 좋아요 기능 
	@RequestMapping("shareCourseLikeCount.nhn")
	public ModelAndView shareCourseLikeCount(int num,HttpServletRequest request, HttpSession session){

		String id = (String)session.getAttribute("id");
		String couplename = (String) sqlMap.queryForObject("serchCouplename",id);
		System.out.println("커플네임"+ couplename);
		int checkMylist = (Integer)sqlMap.queryForObject("checkMylist",id);
		pointDataBean dto2 = new pointDataBean();
		System.out.println("체크마이리스트!!!!!!!!!!!!!!!!!!!"+checkMylist);
		Timestamp regdate = new Timestamp(System.currentTimeMillis());
		String place = "데이트코스 공유";
		
		List list = new ArrayList();

		Map map = new HashMap();
		map.put("couplename", couplename);
		map.put("num", num);
		map.put("regdate", regdate);
		map.put("place", place);
		map.put("myId", id);
		map.put("listnull", "");
		if(checkMylist==0){
			String getMylist=(String)sqlMap.queryForObject("getmylist", id);
			String arryMylist[]=getMylist.split(",");
			String mylistPush=getMylist+","+num;
			map.put("mylistPush", mylistPush);
			System.out.println(mylistPush+"체크값0 마이리스트푸쉬!!! 기존에 리스트가있을때");
			String renum=","+num;
			String relist=getMylist.replace(renum,"");
			map.put("relist", relist);
		}
		
		
		list.add(map);
		
		System.out.println("1couplename"+" "+couplename);
		System.out.println("2num"+" "+num);
		System.out.println("3regdate"+" "+regdate);
		
		shareCourseDataBean dto = new shareCourseDataBean();
		likeDataBean dto1 = new likeDataBean();
		
		int check = (Integer)sqlMap.queryForObject("shereCourseLikePro",map);
		System.out.println("3check"+" "+check);
			if (check ==1){
			
				if(checkMylist==0)
				{	
					String getMylist=(String)sqlMap.queryForObject("getmylist", id);
					String arryMylist[]=getMylist.split(",");
					System.out.println("마이리스트렝쓰!!!!!!!!!!"+arryMylist.length);
					if(arryMylist.length==1){
						sqlMap.update("mylistPush2",map);
					}
					else{
						String renum=","+num;
						String relist=getMylist.replace(renum,"");
						System.out.println("리리스트!!"+relist);
						System.out.println("리넘!!!!!!!!!!!!!!!!!!!"+renum);
						sqlMap.update("mylistPush3", map);
					}
				}
			
			
			
			sqlMap.update("shereCourseLikeCountDown", map);
			System.out.println("좋아요 감소");
			sqlMap.delete("shereDeleteLike", map);
			System.out.println("이글의 좋아요멤버삭제");
			sqlMap.insert("shereUsePoint", map);
			System.out.println("코스공유 포인트감소 기록");
			sqlMap.update("sherePointCountDown", map);
			System.out.println("멤버 좋아요로 획득한 포인트 감소 ");
			
		}else{
			if(checkMylist==1){
				sqlMap.update("mylistPush1",map);
			}
			else{
				sqlMap.update("mylistPush", map);
			}
			sqlMap.update("shereCourseLikeCountUp", map);
			System.out.println("좋아요 증가");
			sqlMap.insert("shereInsertLike", map);
			System.out.println("이글의 좋아요멤버추가");
			sqlMap.insert("shereGetPoint", map);
			System.out.println("코스공유 포인트증가 기록");
			sqlMap.update("sherePointCountUp", map);
			System.out.println("멤버 좋아요로 획득한 포인트 증가 ");
			
		}
		
		int likecount = (Integer)sqlMap.queryForObject("shereCourseLike", num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.addObject("dto1",dto1);
		mv.addObject("num",num);
		mv.addObject("check",check);
		mv.addObject("likecount",likecount);
		mv.setViewName("/yh/likeCount.jsp");
		return mv;
		
	}
	
	@RequestMapping("deleteDiaryList.nhn")
	public String deletediaryList(HttpServletRequest request, HttpSession session,int num){
			
			sqlMap.delete("deleteShareDiary", num);
			DiaryDataBean dto = new DiaryDataBean();
			return "shareDiaryBoard.nhn";
	}

	@RequestMapping("deleteCourseList.nhn")
	public String deleteCourseList(HttpServletRequest request, HttpSession session,int num){
			
			sqlMap.delete("deleteCourseDiary", num);
			shareCourseDataBean dto = new shareCourseDataBean();
			return "shareCourseBoard.nhn";
	}

}

