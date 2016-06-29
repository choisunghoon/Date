package themeDTO;

import java.sql.Timestamp;

public class LikeCountDataBean {

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCtg_num() {
		return ctg_num;
	}
	public void setCtg_num(int ctg_num) {
		this.ctg_num = ctg_num;
	}
	public int getCos_num() {
		return cos_num;
	}
	public void setCos_num(int cos_num) {
		this.cos_num = cos_num;
	}
	public int getLoc_num() {
		return loc_num;
	}
	public void setLoc_num(int loc_num) {
		this.loc_num = loc_num;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	private String id;
	private int ctg_num;
	private int cos_num;
	private int loc_num;
	private Timestamp regdate;
}
