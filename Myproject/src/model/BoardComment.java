package model;

import java.util.Date;

public class BoardComment {
	private int cnum;
	private int num;
	private String id;
	private String comment;
	private Date cregdate;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCregdate() {
		return cregdate;
	}
	public void setCregdate(Date cregdate) {
		this.cregdate = cregdate;
	}
	
	@Override
	public String toString() {
		return "BoardComment [cnum=" + cnum + ", num=" + num + ", id=" + id + ", comment=" + comment + ", cregdate="
				+ cregdate + "]";
	}
}
