package project.bean;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventDataBean {
	private int enumber;
	private String ename;
	private String eimg;
	private String sdate;
	private String edate;
	private Timestamp regdate;
	private String wcouples;
	//private String comment;
	private int appnumber;
	private String couplename;
	private String appsubject;
	private String appcomment;
	private String appimg;	
	private String apppw;
	private int wnumber;
	private int w;

	
	public int getW() {
		return w;
	}
	public void setW(int w) {
		this.w = w;
	}
	public int getWnumber() {
		return wnumber;
	}
	public void setWnumber(int wnumber) {
		this.wnumber = wnumber;
	}
	public String getApppw() {
		return apppw;
	}
	public void setApppw(String apppw) {
		this.apppw = apppw;
	}
	public int getAppnumber() {
		return appnumber;
	}
	public void setAppnumber(int appnumber) {
		this.appnumber = appnumber;
	}
	public String getCouplename() {
		return couplename;
	}
	public void setCouplename(String couplename) {
		this.couplename = couplename;
	}
	public String getAppsubject() {
		return appsubject;
	}
	public void setAppsubject(String appsubject) {
		this.appsubject = appsubject;
	}
	public String getAppcomment() {
		return appcomment;
	}
	public void setAppcomment(String appcomment) {
		this.appcomment = appcomment;
	}
	public String getAppimg() {
		return appimg;
	}
	public void setAppimg(String appimg) {
		this.appimg = appimg;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	private List<MultipartFile> upload;

	
	/*public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}*/

	public int getEnumber() {
		return enumber;
	}
	public void setEnumber(int enumber) {
		this.enumber = enumber;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEimg() {
		return eimg;
	}
	public void setEimg(String eimg) {
		this.eimg = eimg;
	}

	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getWcouples() {
		return wcouples;
	}
	public void setWcouples(String wcouples) {
		this.wcouples = wcouples;
	}

}
