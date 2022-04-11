// DTO(Data Transfer Object)

package dto;

import java.sql.Date;
import java.sql.Timestamp;

public class rent_dto {
	private int rent_Num; /* 대여번호 */
	private int book_Num; /* 도서번호 */
	private String id; /* iD */
	private Timestamp rent_Date; /* 대출일 */
	private Date return_Date;/* 반납일 */
	
	private String temp_book_Name;
	private String temp_Writer;
	private String temp_Publisher;
	
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
	public Timestamp getRent_Date() {
		return rent_Date;
	}
	public void setRent_Date(Timestamp rent_Date) {
		this.rent_Date = rent_Date;
	}
	public Date getReturn_Date() {
		return return_Date;
	}
	public void setReturn_Date(Date return_Date) {
		this.return_Date = return_Date;
	}
	public String getTemp_book_Name() {
		return temp_book_Name;
	}
	public void setTemp_book_Name(String temp_book_Name) {
		this.temp_book_Name = temp_book_Name;
	}
	public String getTemp_Writer() {
		return temp_Writer;
	}
	public void setTemp_Writer(String temp_Writer) {
		this.temp_Writer = temp_Writer;
	}
	public String getTemp_Publisher() {
		return temp_Publisher;
	}
	public void setTemp_Publisher(String temp_Publisher) {
		this.temp_Publisher = temp_Publisher;
	}
	
	


}
