// DTO(Data Transfer Object)

package dto;



public class qna_board_dto {

	private Number qb_Num; /* 게시판번호 */
	private String id; /* iD */
	private String qb_Subject;/* 제목 */
	private String qb_Content; /* 내용 */
	private String qb_Readcount;/* 조회수 */
	private String qb_Regdate ; /* 등록일 */
	private int qb_REF; /* REF */
	private int qb_LEV; /* LEV */
	public Number getQb_Num() {
		return qb_Num;
	}
	public void setQb_Num(Number qb_Num) {
		this.qb_Num = qb_Num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQb_Subject() {
		return qb_Subject;
	}
	public void setQb_Subject(String qb_Subject) {
		this.qb_Subject = qb_Subject;
	}
	public String getQb_Content() {
		return qb_Content;
	}
	public void setQb_Content(String qb_Content) {
		this.qb_Content = qb_Content;
	}
	public String getQb_Readcount() {
		return qb_Readcount;
	}
	public void setQb_Readcount(String qb_Readcount) {
		this.qb_Readcount = qb_Readcount;
	}
	public String getQb_Regdate() {
		return qb_Regdate;
	}
	public void setQb_Regdate(String qb_Regdate) {
		this.qb_Regdate = qb_Regdate;
	}
	public int getQb_REF() {
		return qb_REF;
	}
	public void setQb_REF(int qb_REF) {
		this.qb_REF = qb_REF;
	}
	public int getQb_LEV() {
		return qb_LEV;
	}
	public void setQb_LEV(int qb_LEV) {
		this.qb_LEV = qb_LEV;
	}

}
