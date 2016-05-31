package upload.bean;

import java.sql.Timestamp;

public class CoupleDataBean {
	private String couplename;
	private Timestamp coupledate;
	private String id1;
	private String id2;
	private int point;
	private String coupleimage;
	
	public Timestamp getCoupledate() {
		return coupledate;
	}
	public void setCoupledate(Timestamp coupledate) {
		this.coupledate = coupledate;
	}
	public String getCoupleimage() {
		return coupleimage;
	}
	public void setCoupleimage(String coupleimage) {
		this.coupleimage = coupleimage;
	}
	public String getCouplename() {
		return couplename;
	}
	public void setCouplename(String couplename) {
		this.couplename = couplename;
	}
	public String getId1() {
		return id1;
	}
	public void setId1(String id1) {
		this.id1 = id1;
	}
	public String getId2() {
		return id2;
	}
	public void setId2(String id2) {
		this.id2 = id2;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

}
