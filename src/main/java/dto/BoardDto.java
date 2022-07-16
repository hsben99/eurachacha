package dto;

public class BoardDto {

	private int runm;
	private int id;
	private String title;
	private String content;
	private String regDate;
	private String deleteYn;
	private String category; // medical ,bio, tech
	private String writerId;

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRunm() {
		return runm;
	}

	public void setRunm(int runm) {
		this.runm = runm;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	@Override
	public String toString() {
		return "BoardDto [runm=" + runm + ", id=" + id + ", title=" + title + ", content="+ content + ", regDate=" + regDate + ", deleteYn=" + deleteYn + ", category=" + category + ", writerId="
				+ writerId + "]";
	}
	
	

}
