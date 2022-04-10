// DTO(Data Transfer Object)

package dto;

import java.sql.Date;

public class qna_board_dto {
	private int qb_num;			// 프로퍼티(property)
	private String id;
	private String qb_subject;
	private String qb_content;
	private Date qb_regdate;
	private int qb_ref;
	private int qb_lev;
	private int board_seq;
	public int getQb_num() {
		return qb_num;
	}
	public void setQb_num(int qb_num) {
		this.qb_num = qb_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQb_subject() {
		return qb_subject;
	}
	public void setQb_subject(String qb_subject) {
		this.qb_subject = qb_subject;
	}
	public String getQb_content() {
		return qb_content;
	}
	public void setQb_content(String qb_content) {
		this.qb_content = qb_content;
	}
	public Date getQb_regdate() {
		return qb_regdate;
	}
	public void setQb_regdate(Date qb_regdate) {
		this.qb_regdate = qb_regdate;
	}
	public int getQb_ref() {
		return qb_ref;
	}
	public void setQb_ref(int qb_ref) {
		this.qb_ref = qb_ref;
	}
	public int getQb_lev() {
		return qb_lev;
	}
	public void setQb_lev(int qb_lev) {
		this.qb_lev = qb_lev;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	
}
