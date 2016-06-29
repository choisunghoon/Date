package upload.bean;

import java.sql.Timestamp;

public class DiaryDataBean {
	private Timestamp pool_regdate;
	private int num;
	private String couplename;
	
	private String subject;
	private String content;
	private String img;
	private String pool;
	private int likecount;
	private int readcount;
	private Timestamp regdate;
	
	public Timestamp getPool_regdate() {
		return pool_regdate;
	}
	public void setPool_regdate(Timestamp pool_regdate) {
		this.pool_regdate = pool_regdate;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPool() {
		return pool;
	}
	public void setPool(String pool) {
		this.pool = pool;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
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

}
