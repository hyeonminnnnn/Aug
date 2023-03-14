package kr.ac.kopo.aug.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int id;
	private String title;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date regDate;

	private String contents;
	private int views;

	private String usersId;
	private int boardId;
	private int categoryId;
	private String nickname;
	private String name;
	
	private List<MultipartFile> attach;
	private List<Attach> attachs;
	private int heart;
	private String heartUid;
	
	private int commentCount;
	private String grade;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String userId) {
		this.usersId = userId;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int view) {
		this.views = view;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public List<MultipartFile> getAttach() {
		return attach;
	}

	public void setAttach(List<MultipartFile> attach) {
		this.attach = attach;
	}

	public List<Attach> getAttachs() {
		return attachs;
	}

	public void setAttachs(List<Attach> attachs) {
		this.attachs = attachs;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public String getHeartUid() {
		return heartUid;
	}

	public void setHeartUid(String heartUid) {
		this.heartUid = heartUid;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}


}
