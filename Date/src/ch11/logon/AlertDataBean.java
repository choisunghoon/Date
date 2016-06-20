package ch11.logon;
import java.sql.Timestamp;
public class AlertDataBean {
	private int num;
	private String id;
	private String nickname;
	private String couplename;
	private String content;
	private int readcheck;
	private Timestamp regdate;
	
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCouplename() {
		return couplename;
	}
	public void setCouplename(String couplename) {
		this.couplename = couplename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcheck() {
		return readcheck;
	}
	public void setReadcheck(int readcheck) {
		this.readcheck = readcheck;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}	
