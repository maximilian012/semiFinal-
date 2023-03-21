package mul.cam.food.dto;

import java.io.Serializable;

public class AdminParam implements Serializable {
	
	private String choice; 
	private String search;
	private int pageNumber;
	
	private int start; // page 가 1~10이냐 11~20이냐..
	private int end;

	public AdminParam() {
		// TODO Auto-generated constructor stub
	}

	public AdminParam(String choice, String search, int pageNumber, int start, int end) {
		super();
		this.choice = choice;
		this.search = search;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "AdminParam [choice=" + choice + ", search=" + search + ", pageNumber=" + pageNumber + ", start=" + start
				+ ", end=" + end + "]";
	}
	
}
