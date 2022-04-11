// DTO(Data Transfer Object)

package dto;

import java.sql.Date;

public class reserve_dto {
	private int book_Num; /* 도서번호 */
	private String id; /* iD */
	private Date reserve_Date; /* 예약신청일 */
	private int reserve_Num;/* 예약순서 */
	private String book_Name;
	private String Writer;
	private String publisher;
	
	public String getBook_Name() {
		return book_Name;
	}
	public void setBook_Name(String book_Name) {
		this.book_Name = book_Name;
	}
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getBook_Num() {
		return book_Num;
	}
	public void setBook_Num(int book_Num) {
		this.book_Num = book_Num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getReserve_Date() {
		return reserve_Date;
	}
	public void setReserve_Date(Date reserve_Date) {
		this.reserve_Date = reserve_Date;
	}
	public int getReserve_Num() {
		return reserve_Num;
	}
	public void setReserve_Num(int reserve_Num) {
		this.reserve_Num = reserve_Num;
	}
	
	


}
