// DTO(Data Transfer Object)

package dto;

import java.sql.Date;

public class reserve_dto {
	private int rent_Num; /* 대여번호 */
	private int book_Num; /* 도서번호 */
	private String id; /* iD */
	private Date reserve_Date; /* 예약신청일 */
	private int reserve_Num;/* 예약순서 */
	
	public int getRent_Num() {
		return rent_Num;
	}
	public void setRent_Num(int rent_Num) {
		this.rent_Num = rent_Num;
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
