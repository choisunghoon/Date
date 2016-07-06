package share;

import java.sql.Timestamp;

public class likeDataBean {

	private String couplename;
	private String board_num;
	private String regdate;

	public String getBoard_num() {
		return board_num;
	}
	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
	public String getCouplename() {
		return couplename;
	}
	public void setCouplename(String couplename) {
		this.couplename = couplename;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
