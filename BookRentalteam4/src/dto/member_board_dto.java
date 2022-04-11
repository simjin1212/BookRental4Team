// DTO(Data Transfer Object)

package dto;

import java.sql.Timestamp;

public class member_board_dto {
	private int mb_Num; /* 게시판번호 */
	private String id; /* iD */
	private String mb_Subject; /* 제목 */
	private String mb_Content; /* 내용 */
	private String mb_File; /* 첨부파일 */
	private Timestamp mb_Regdate; /* 등록일 */
	private int mb_REF; /* REF */
	private int mb_LEV; /* LEV */
	private int mb_SEQ; /* SEQ */
	private int mb_Readcount;/* 조회수 */
	private int mb_Grade;
	
	public int getMb_Num() {
		return mb_Num;
	}
	public void setMb_Num(int mb_Num) {
		this.mb_Num = mb_Num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMb_Subject() {
		return mb_Subject;
	}
	public void setMb_Subject(String mb_Subject) {
		this.mb_Subject = mb_Subject;
	}
	public String getMb_Content() {
		return mb_Content;
	}
	public void setMb_Content(String mb_Content) {
		this.mb_Content = mb_Content;
	}
	public String getMb_File() {
		return mb_File;
	}
	public void setMb_File(String mb_File) {
		this.mb_File = mb_File;
	}
	public Timestamp getMb_Regdate() {
		return mb_Regdate;
	}
	public void setMb_Regdate(Timestamp mb_Regdate) {
		this.mb_Regdate = mb_Regdate;
	}
	public int getMb_REF() {
		return mb_REF;
	}
	public void setMb_REF(int mb_REF) {
		this.mb_REF = mb_REF;
	}
	public int getMb_LEV() {
		return mb_LEV;
	}
	public void setMb_LEV(int mb_LEV) {
		this.mb_LEV = mb_LEV;
	}
	public int getMb_SEQ() {
		return mb_SEQ;
	}
	public void setMb_SEQ(int mb_SEQ) {
		this.mb_SEQ = mb_SEQ;
	}
	public int getMb_Readcount() {
		return mb_Readcount;
	}
	public void setMb_Readcount(int mb_Readcount) {
		this.mb_Readcount = mb_Readcount;
	}
	public int getMb_Grade() {
		return mb_Grade;
	}
	public void setMb_Grade(int mb_grade) {
		this.mb_Grade = mb_grade;
	}




}
