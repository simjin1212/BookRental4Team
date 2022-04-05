// DTO(Data Transfer Object)

package dto;

import java.sql.Date;

public class history_dto {
	
	private int rent_Num; /* 대여번호 */
	private int book_Num; /* 도서번호 */
	private String id;/* iD */
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


}
