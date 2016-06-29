package themeDTO;

import java.sql.Timestamp;

public class ReplyDataBean {
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoc_reply() {
		return loc_reply;
	}
	public void setLoc_reply(String loc_reply) {
		this.loc_reply = loc_reply;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getLoc_num() {
		return loc_num;
	}
	public void setLoc_num(int loc_num) {
		this.loc_num = loc_num;
	}
	private int num;
	private String id;
	private String loc_reply;
	private Timestamp regdate;
	private int loc_num;
}
