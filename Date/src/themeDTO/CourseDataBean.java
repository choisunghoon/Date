package themeDTO;

public class CourseDataBean {
	
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
	public String getCos_name() {
		return cos_name;
	}
	public void setCos_name(String cos_name) {
		this.cos_name = cos_name;
	}
	public String getCos_img() {
		return cos_img;
	}
	public void setCos_img(String cos_img) {
		this.cos_img = cos_img;
	}
	private int ctg_num;
	private int cos_num;
	private String cos_name;
	private String cos_img;
	
	public String getMap_img() {
		return map_img;
	}
	public void setMap_img(String map_img) {
		this.map_img = map_img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	private String map_img;
	private String content;
	private int readCount;
	private int likeCount;
}
