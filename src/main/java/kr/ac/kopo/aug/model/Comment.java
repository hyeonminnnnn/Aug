package kr.ac.kopo.aug.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Comment {
	private int cno;
	private String contents;
	private String usersId;
	private int id;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date regDate;
	private int comLike;
	private String reCom;
	private String nickname;
	private String grade;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getComLike() {
		return comLike;
	}

	public void setComLike(int comLike) {
		this.comLike = comLike;
	}

	public String getReCom() {
		return reCom;
	}

	public void setReCom(String reCom) {
		this.reCom = reCom;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}


}
