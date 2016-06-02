package dateplan.bean;

import java.sql.Timestamp;

public class DTO {
	private String placeplaceUrl,placenewAddress,placeaddress,placeid,placephone,placetitle,placelatitude,placelongitude;
	private int num;
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

	public String getPool() {
		return pool;
	}

	public void setPool(String pool) {
		this.pool = pool;
	}

	public String getLikecount() {
		return likecount;
	}

	public void setLikecount(String likecount) {
		this.likecount = likecount;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	private String couplename,subject,content,pool,likecount,readcount;
	Timestamp regdate;
	public String getPlacetitle() {
		return placetitle;
	}

	public void setPlacetitle(String placetitle) {
		this.placetitle = placetitle;
	}

	public String getPlacelatitude() {
		return placelatitude;
	}

	public void setPlacelatitude(String placelatitude) {
		this.placelatitude = placelatitude;
	}

	public String getPlacelongitude() {
		return placelongitude;
	}

	public void setPlacelongitude(String placelongitude) {
		this.placelongitude = placelongitude;
	}

	public String getPlaceplaceUrl() {
		return placeplaceUrl;
	}

	public void setPlaceplaceUrl(String placeplaceUrl) {
		this.placeplaceUrl = placeplaceUrl;
	}

	public String getPlacenewAddress() {
		return placenewAddress;
	}

	public void setPlacenewAddress(String placenewAddress) {
		this.placenewAddress = placenewAddress;
	}

	public String getPlaceaddress() {
		return placeaddress;
	}

	public void setPlaceaddress(String placeaddress) {
		this.placeaddress = placeaddress;
	}

	public String getPlaceid() {
		return placeid;
	}

	public void setPlaceid(String placeid) {
		this.placeid = placeid;
	}

	public String getPlacephone() {
		return placephone;
	}

	public void setPlacephone(String placephone) {
		this.placephone = placephone;
	}
}
