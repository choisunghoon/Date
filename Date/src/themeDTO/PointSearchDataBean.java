package themeDTO;

import java.sql.Timestamp;

public class PointSearchDataBean {

	public String getCouplename() {
		return couplename;
	}
	public void setCouplename(String couplename) {
		this.couplename = couplename;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public int getGetPoint() {
		return getPoint;
	}
	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	private String couplename;
	private int num;
	private int usePoint;
	private int getPoint;
	private String place;
	private Timestamp regdate;
	private int startRow;
	private int endRow;
}
