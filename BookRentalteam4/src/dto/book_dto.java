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
		private Date book_regDate; /* 등록일 */
		private String wirter_Talks;/* 작가의말 */
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
		
		public String getWirter_Talks() {
			return wirter_Talks;
		}
		public void setWirter_Talks(String wirter_Talks) {
			this.wirter_Talks = wirter_Talks;
		}
	
		public Date getBook_regDate() {
			return book_regDate;
		}
		public void setBook_regDate(Date book_regDate) {
			this.book_regDate = book_regDate;
		}



}
