// DTO(Data Transfer Object)

package dto;

import java.sql.Date;

public class book_dto {
	/* 도서 */
	
		private int book_Num;
		private String book_Name;/* 도서명 */
		private String book_Cover; /* 책표지 */
		private String writer; /* 저자 */
		private String publisher; /* 출판사 */
		private String genre; /* 장르 */
		private Date book_regDate; /* 등록일 */
		private String writer_talks;/* 작가의말 */
		
		private int book_seq;
		private int book_lev;
		private int book_ref;
		
		public int getBook_seq() {
			return book_seq;
		}
		public void setBook_seq(int book_seq) {
			this.book_seq = book_seq;
		}
		public int getBook_lev() {
			return book_lev;
		}
		public void setBook_lev(int book_lev) {
			this.book_lev = book_lev;
		}
		public int getBook_ref() {
			return book_ref;
		}
		public void setBook_ref(int book_ref) {
			this.book_ref = book_ref;
		}
		public int getBook_Num() {
			return book_Num;
		}
		public void setBook_Num(int book_Num) {
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
		
		
	
		
		public String getWriter_talks() {
			return writer_talks;
		}
		public void setWriter_talks(String writer_talks) {
			this.writer_talks = writer_talks;
		}
		public Date getBook_regDate() {
			return book_regDate;
		}
		public void setBook_regDate(Date book_regDate) {
			this.book_regDate = book_regDate;
		}



}
