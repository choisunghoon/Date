package share;

import java.sql.Timestamp;

public class pointDataBean {

	private int num;
	private String couplename;
	private int usepoint;
	private int getpoint;
	private String place;
	private Timestamp regdate;
	
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
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public int getGetpoint() {
		return getpoint;
	}
	public void setGetpoint(int getpoint) {
		this.getpoint = getpoint;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Timestamp getReg_date(){
 		return regdate; 
 	}
	public void setReg_date (Timestamp reg_date){
		this.regdate = regdate;
	}

}
