// DTO(Data Transfer Object)

package dto;

import java.sql.Date;

public class book_dto {
	/* 도서 */
	
		private String book_Num;
		private String book_Name;/* 도서명 */
		private String book_Cover; /* 책표지 */
		private String writer; /* 저자 */
		private String publisher; /* 출판사 */
		private String genre; /* 장르 */
		private String book_regDate; /* 등록일 */
		private int rent_Bool; /* 대출가능여부 */
		private int reserve_Bool; /* 예약가능여부 */
		private String wirter_Talks;/* 작가의말 */
		private String member_Num;/* 회원번호 */
		public String getBook_Num() {
			return book_Num;
		}
		public void setBook_Num(String book_Num) {
			this.book_Num = book_Num;
		}
		public String getBook_Name() {
			return book_Name;
		}
		public void setBook_Name(String book_Name) {
			this.book_Name = book_Name;
		}
		public String getBook_Cover() {
			return book_Cover;
		}
		public void setBook_Cover(String book_Cover) {
			this.book_Cover = book_Cover;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getPublisher() {
			return publisher;
		}
		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}
		public String getGenre() {
			return genre;
		}
		public void setGenre(String genre) {
			this.genre = genre;
		}
		public String getBook_regDate() {
			return book_regDate;
		}
		public void setBook_regDate(String book_regDate) {
			this.book_regDate = book_regDate;
		}
		public int getRent_Bool() {
			return rent_Bool;
		}
		public void setRent_Bool(int rent_Bool) {
			this.rent_Bool = rent_Bool;
		}
		public int getReserve_Bool() {
			return reserve_Bool;
		}
		public void setReserve_Bool(int reserve_Bool) {
			this.reserve_Bool = reserve_Bool;
		}
		public String getWirter_Talks() {
			return wirter_Talks;
		}
		public void setWirter_Talks(String wirter_Talks) {
			this.wirter_Talks = wirter_Talks;
		}
		public String getMember_Num() {
			return member_Num;
		}
		public void setMember_Num(String member_Num) {
			this.member_Num = member_Num;
		}



}
