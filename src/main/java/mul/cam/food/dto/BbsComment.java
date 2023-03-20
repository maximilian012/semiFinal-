package mul.cam.food.dto;

import java.io.Serializable;


public class BbsComment implements Serializable{

	private int seq;
	private String content;
	private String writer;
	
	public BbsComment() {
		// TODO Auto-generated constructor stub
	}

	public BbsComment(int seq, String content, String writer) {
		super();
		this.seq = seq;
		this.content = content;
		this.writer = writer;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "BbsComment [seq=" + seq + ", content=" + content + ", writer=" + writer + "]";
	}
	
	
}
