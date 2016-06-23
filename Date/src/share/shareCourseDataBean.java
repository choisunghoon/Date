package share;

import java.sql.Timestamp;

public class shareCourseDataBean {

	
	private int num;
	private String couplename;
	private String subject;
	private String content;
	private int likecount;
	private int readcount;
	private Timestamp regdate;
	private String placetitle;
	private String placeid;
	private String placecategory;
	private String placelocation;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCouplename() {
		return couplename;
	}
	public void setCouplename(String couplename) {
		this.couplename = couplename;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getPlacetitle() {
		return placetitle;
	}
	public void setPlacetitle(String placetitle) {
		this.placetitle = placetitle;
	}
	public String getPlaceid() {
		return placeid;
	}
	public void setPlaceid(String placeid) {
		this.placeid = placeid;
	}
	public String getPlacecategory() {
		return placecategory;
	}
	public void setPlacecategory(String placecategory) {
		this.placecategory = placecategory;
	}
	public String getPlacelocation() {
		return placelocation;
	}
	public void setPlacelocation(String placelocation) {
		this.placelocation = placelocation;
	}

}
