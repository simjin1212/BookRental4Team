package dto;

import java.sql.Timestamp;

public class review_board_dto {
	private int book_Num; /* 도서번호 */
	private int rb_Num; /* 게시판번호 */
	private String id; /* iD */
	private int rent_Num; /* 대여번호 */
	private String rb_Subject; /* 제목 */
	private String rb_Content; /* 내용 */
	private String rb_File;/* 첨부파일 */
	private Timestamp rb_Regdate; /* 등록일 */
	private String rb_Readcount; /* 조회수 */

	public int getBook_Num() {
		return book_Num;
	}

	public void setBook_Num(int book_Num) {
		this.book_Num = book_Num;
	}

	public int getRb_Num() {
		return rb_Num;
	}

	public void setRb_Num(int rb_Num) {
		this.rb_Num = rb_Num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRent_Num() {
		return rent_Num;
	}

	public void setRent_Num(int rent_Num) {
		this.rent_Num = rent_Num;
	}

	public String getRb_Subject() {
		return rb_Subject;
	}

	public void setRb_Subject(String rb_Subject) {
		this.rb_Subject = rb_Subject;
	}

	public String getRb_Content() {
		return rb_Content;
	}

	public void setRb_Content(String rb_Content) {
		this.rb_Content = rb_Content;
	}

	public String getRb_File() {
		return rb_File;
	}

	public void setRb_File(String rb_File) {
		this.rb_File = rb_File;
	}

	public Timestamp getRb_Regdate() {
		return rb_Regdate;
	}

	public void setRb_Regdate(Timestamp rb_Regdate) {
		this.rb_Regdate = rb_Regdate;
	}

	public String getRb_Readcount() {
		return rb_Readcount;
	}

	public void setRb_Readcount(String rb_Readcount) {
		this.rb_Readcount = rb_Readcount;
	}

}
