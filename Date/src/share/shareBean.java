package share;

import java.sql.Timestamp;
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
		DiaryDataBean dto = new DiaryDataBean();
		
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
		mv.addObject("currentPage",currentPage);
		mv.addObject("pagingHtml",pagingHtml);
		mv.setViewName("/yh/shareDiaryBoardList.jsp");
		return mv;
	}
	
	@RequestMapping("shareDiaryBoardView.nhn")
	public ModelAndView shareDiaryBoardView(HttpServletRequest request, HttpSession session,int num){
	
		System.out.println(num);

		sqlMap.update("shereDiaryUpdateReadCount", num);

		DiaryDataBean dto = new DiaryDataBean();
		dto = (DiaryDataBean)sqlMap.queryForObject("shereDiarySelectNum", num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.addObject("num",num);
		mv.setViewName("/yh/shareDiaryBoardView.jsp");
		return mv;
	
	}
	
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
		pagingDTO page;
		shareCourseDataBean dto = new shareCourseDataBean();
		
		List list = new ArrayList();
		list = sqlMap.queryForList("shereSelectCourseBoardAll",null);
		totalCount = list.size();
		page = new pagingDTO(currentPage,totalCount,blockCount,blockPage);
		
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
	
	@RequestMapping("shareCourseBoardView.nhn")
	public ModelAndView shareCourseBoardView(HttpServletRequest request, HttpSession session,int num){
	
		System.out.println("넘값"+" " +num);

		sqlMap.update("shereCourseUpdateReadCount", num);

		DTO dto = new DTO();
		dto = (DTO)sqlMap.queryForObject("shereCourseSelectNum", num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.setViewName("/yh/shareCourseBoardView.jsp");
		return mv;
	
	}

	@RequestMapping("shareDiaryLikeCount.nhn")
	public ModelAndView DiarylikeCount(int num,HttpServletRequest request, HttpSession session){

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
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.addObject("dto1",dto1);
		mv.addObject("check",check);
		mv.addObject("num",num);
		mv.setViewName("/yh/likeCount.jsp");
		return mv;
		
	}

	@RequestMapping("shareCourseCount.nhn")
	public ModelAndView courseCount(HttpServletRequest request, HttpSession session, int num){
		
		
		int likecount = (Integer)sqlMap.queryForObject("shereCourseLike", num);
		System.out.println("좋아요 숫자" + likecount + "글넘버" + num);
		DTO dto = new DTO();
		ModelAndView mv = new ModelAndView();
		mv.addObject("likecount",likecount);
		mv.addObject("num",num);
		mv.setViewName("/yh/likeCount.jsp");
		return mv;
	}
	
	@RequestMapping("shareDiaryCount.nhn")
	public ModelAndView diaryCount(HttpServletRequest request, HttpSession session, int num){
		
		System.out.println("");
		
		int likecount = (Integer)sqlMap.queryForObject("shereDiaryLike", num);
		System.out.println("좋아요 숫자" + likecount + "글넘버" + num);
		DiaryDataBean dto = new DiaryDataBean();
		ModelAndView mv = new ModelAndView();
		mv.addObject("likecount",likecount);
		mv.addObject("num",num);
		mv.setViewName("/yh/likeCount.jsp");
		return mv;
	}
/*  하루에 추천수 제한
	@RequestMapping("likeLimit.nhn")
	public String likeLimit(HttpServletRequest request, HttpSession session){
		
		likeDataBean dto1 = new likeDataBean();
		
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy_MM_dd");
		String reg = format.format(timestamp);
		String couplename= request.getParameter("couplename");
		System.out.println(reg);
		System.out.println(couplename);
		
		List list = new ArrayList();

		Map map = new HashMap();
		map.put("regdate", reg);
		map.put("couplename", couplename);
		list.add(map);
		
		int check = (Integer)sqlMap.queryForObject("likeLimit",map);
		
			return "/yh/likeLimit.jsp";
		}
*/
	@RequestMapping("shareCourseLikeCount.nhn")
	public ModelAndView shareCourseLikeCount(int num,HttpServletRequest request, HttpSession session){

		String id = (String)session.getAttribute("id");
		String couplename = (String) sqlMap.queryForObject("serchCouplename",id);
		System.out.println("커플네임"+ couplename);
		
		pointDataBean dto2 = new pointDataBean();
		
		Timestamp regdate = new Timestamp(System.currentTimeMillis());
		String place = "데이트코스 공유";
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
		
		DTO dto = new DTO();
		likeDataBean dto1 = new likeDataBean();
		
		int check = (Integer)sqlMap.queryForObject("shereCourseLikePro",map);
		System.out.println("3check"+" "+check);
		if (check ==1){
			sqlMap.update("shereCourseLikeCountDown", map);
			System.out.println("좋아요 감소");
			sqlMap.delete("shereDeleteLike", map);
			System.out.println("이글의 좋아요멤버삭제");
			sqlMap.insert("shereUsePoint", map);
			System.out.println("코스공유 포인트감소 기록");
			sqlMap.update("sherePointCountDown", map);
			System.out.println("멤버 좋아요로 획득한 포인트 감소 ");
			
		}else{
			sqlMap.update("shereCourseLikeCountUp", map);
			System.out.println("좋아요 증가");
			sqlMap.insert("shereInsertLike", map);
			System.out.println("이글의 좋아요멤버추가");
			sqlMap.insert("shereGetPoint", map);
			System.out.println("코스공유 포인트증가 기록");
			sqlMap.update("sherePointCountUp", map);
			System.out.println("멤버 좋아요로 획득한 포인트 증가 ");
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto",dto);
		mv.addObject("dto1",dto1);
		mv.addObject("check",check);
		mv.addObject("num",num);
		mv.setViewName("/yh/likeCount.jsp");
		return mv;
		
	}
	
	@RequestMapping("diaryComment.nhn")
	public ModelAndView diaryComment(HttpServletRequest request ,HttpSession session,int num){

		String id = (String)session.getAttribute("id");
		System.out.println("넘값" + " " + num);
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
		
		commentDataBean dto = new commentDataBean();
		
		List list = new ArrayList();
		list = sqlMap.queryForList("SelectDiaryCommentAll",num);
		totalCount = list.size();
		page = new pagingDTO(currentPage,totalCount,blockCount,blockPage);
		
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() <totalCount)
			lastCount = page.getEndCount() +1;
		list = list.subList(page.getStartCount(),lastCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("num",num);
		mv.addObject("list",list);
		mv.addObject("currentPage",currentPage);
		mv.addObject("pagingHtml",pagingHtml);
		mv.setViewName("/yh/diaryComment.jsp");
		return mv;
	}
}
