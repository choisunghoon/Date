package share;

import java.sql.Timestamp;

public class commentDataBean {

	private int num;
	private String id;
	private String diarycomment;
	private Timestamp regdate;
	private int board_num;
	
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
	public String getDiarycomment() {
		return diarycomment;
	}
	public void setDiarycomment(String diarycomment) {
		this.diarycomment = diarycomment;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

}
