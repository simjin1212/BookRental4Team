// DAO(Data Access Object)

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.book_dto;
import dto.rent_dto;



public class book_dao {

	// 싱글톤
	private static book_dao instance = new book_dao();

	public static book_dao getInstance() {
		return instance;
	}

	// 컨넥션풀에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	// 예시 도서등록
	public int insert(book_dto book) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			// String sql = "~~~"
			// pstmt = con.prepareStatement(sql);
			// pstmt.setString
			String sql = "insert into book values(book_seq.nextval,?,?,?,?,?,sysdate,?,book_seq.nextval,0,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book.getBook_Name());
			pstmt.setString(2, book.getBook_Cover());
			pstmt.setString(3, book.getWriter());
			pstmt.setString(4, book.getPublisher());
			pstmt.setString(5, book.getGenre());
			pstmt.setString(6, book.getWriter_talks());
			result = pstmt.executeUpdate(); // SQL문 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return result;
	}

	// 도서상세
	public book_dto getDetail(int book_num) {
		book_dto book = new book_dto();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from book where book_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) {
				book.setBook_Num(rs.getInt("book_num"));
				book.setBook_Name(rs.getString("book_name"));
				book.setBook_Cover(rs.getString("book_cover"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setGenre(rs.getString("genre"));
				book.setBook_regDate(rs.getDate("book_regDate"));
				book.setWriter_talks(rs.getString("writer_talks"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return book;
	}

	// 도서 검색
	public int booksearch(String book_Name) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from book where book_name=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book_Name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1; // 도서 있음
			} else {
				result = -1; // 도서 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
		}

		return result;
	}

	// 총 데이터 갯수 구하기
	public int getCount() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select count(*) from book";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) {
//					result = rs.getInt(1);
				result = rs.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return result;
	}

	// 도서리스트
	public List<book_dto> getList() {
		List<book_dto> list = new ArrayList<book_dto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from book order by book_num";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // SQL문 실행
			System.out.println("sql실행");
			while (rs.next()) {
				book_dto book = new book_dto();

				book.setBook_Num(rs.getInt("book_num"));
				book.setBook_Name(rs.getString("book_name"));
				book.setBook_Cover(rs.getString("book_Cover"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setGenre(rs.getString("genre"));
				book.setBook_regDate(rs.getDate("book_regDate"));
				book.setWriter_talks(rs.getString("writer_talks"));

				book.setBook_ref(rs.getInt("book_ref"));
				book.setBook_lev(rs.getInt("book_lev"));
				book.setBook_seq(rs.getInt("book_seq"));

				list.add(book);

			}
			System.out.println("데이터 리스트에 저장완료");
			System.out.println("bookcover"+rs.getString("book_Cover"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return list;
	}

	// 도서 수정
	public int update(book_dto book) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "update book set book_name=?, genre=?, publisher=?, book_cover=?,";
			sql += "book_writer_talks=? where book_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book.getBook_Name());
			pstmt.setString(2, book.getGenre());
			pstmt.setString(3, book.getPublisher());
			pstmt.setString(4, book.getBook_Cover());
			pstmt.setString(5, book.getWriter_talks());
			pstmt.setInt(6, book.getBook_Num());
			result = pstmt.executeUpdate(); // SQL문 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return result;
	}

	// 삭제
	public int delete(int book_Num) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "delete from book where book_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_Num);
			result = pstmt.executeUpdate(); // SQL문 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return result;
	}

	/*
	 * // 도서 검색 리스트 public List<book_dto> getsearchList(int start, int end) {
	 * List<book_dto> list = new ArrayList<book_dto>(); Connection con = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * try { con = getConnection();
	 * 
	 * String sql = ""; //전체 게시글 목록 if(sel==null && find==null) {
	 * sql="select * from (select rownum rnum, book.* from ";
	 * sql+=" (select *from book order by book_ref desc, book_seq asc) book) ";
	 * sql+=" where rnum>=? and rnum<=?"; }
	 * 
	 * pstmt = con.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, start); pstmt.setInt(2, end);
	 * 
	 * rs = pstmt.executeQuery(); // SQL문 실행
	 * 
	 * while (rs.next()) { book_dto book = new book_dto();
	 * 
	 * book.setBook_Num(rs.getInt("book_num"));
	 * book.setBook_Name(rs.getString("book_name"));
	 * book.setBook_Cover(rs.getString("book_cover"));
	 * book.setWriter(rs.getString("writer"));
	 * book.setPublisher(rs.getString("publisher"));
	 * book.setGenre(rs.getString("genre"));
	 * book.setBook_regDate(rs.getDate("book_regDate"));
	 * book.setWriter_talks(rs.getString("writer_talks"));
	 * 
	 * book.setBook_ref(rs.getInt("book_ref"));
	 * book.setBook_lev(rs.getInt("book_lev"));
	 * book.setBook_seq(rs.getInt("book_seq"));
	 * 
	 * list.add(book);
	 * 
	 * } System.out.println("도서 검색 리스트에 저장완료");
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { if (rs != null) try
	 * { rs.close(); } catch (Exception e) { } if (pstmt != null) try {
	 * pstmt.close(); } catch (Exception e) { } if (con != null) try { con.close();
	 * } catch (Exception e) { } } return list; }
	 */

	// 옵션별 도서 검색
	public int getFcount(String sel, String find) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select count(*) from book where " + sel + " like '%" + find + "%'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
//						result = rs.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}

		return result;
	}

	// 검색 목록
	public List<book_dto> selectFbook(int start, int end, String sel, String find) {
		List<book_dto> list = new ArrayList<book_dto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from ( select book_cover, rownum rnum, book_num, book_name, Writer, Publisher, genre, Writer_talks ";
			sql += "from (select * from book where  " + sel + " like '%" + find + "%' order by book_num desc)) ";
			sql += "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				book_dto book = new book_dto();
				book.setBook_Cover(rs.getString("book_Cover"));
				book.setBook_Num(rs.getInt("book_num"));
				book.setBook_Name(rs.getString("book_name"));
				book.setWriter(rs.getString("Writer"));
				book.setPublisher(rs.getString("Publisher"));
				book.setGenre(rs.getString("genre"));
				book.setWriter_talks(rs.getString("Writer_talks"));

				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return list; 
	}

	// 글목록
	public List<book_dto> selectBook(int start, int end) {
		List<book_dto> list = new ArrayList<book_dto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from ( select rownum rnum, BOOK_NUM, ";
			sql += "BOOK_NAME, WRITER, PUBLISHER, GENRE, WRITER_TALKS, book_cover from ";
			sql += "(select * from book order by BOOK_NUM desc)) ";
			sql += "where rnum >= ? and rnum <= ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				book_dto book = new book_dto();
				
				book.setBook_Cover(rs.getString("book_Cover"));
				book.setBook_Num(rs.getInt("book_num"));
				book.setBook_Name(rs.getString("book_name"));
				book.setWriter(rs.getString("Writer"));
				book.setPublisher(rs.getString("Publisher"));
				book.setGenre(rs.getString("genre"));
				book.setWriter_talks(rs.getString("Writer_talks"));

				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return list;
	}

	// 대출상세
	public String getMatching(int r_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String book_name = "";
		try {
			con = getConnection();

			String sql = "select book_name from book where book_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) {
 
				book_name = (String) rs.getString("book_name");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
		}
		return book_name;
	}

	// 도서 검색
	public int rentcheck(int book_num) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			con = getConnection();

			String sql = "select * from rent where book_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1; // rent테이블에 도서 있음
			} else {
				result = -1; // rent테이블에 도서 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
		}
  
		return result;
	}

	public int rent(int book_num) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rent_num = 0;
		try {
			con = getConnection();

			String sql = "select * from rent where book_num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				 rent_num = rs.getInt("rent_num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
		}
  
		return rent_num;
	}
	
	public rent_dto getrentDetail(String id) {
		rent_dto rent = new rent_dto();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from rent where id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) {

				rent.setBook_Num(rs.getInt("book_num"));
				rent.setId(id);
				rent.setRent_Date(rs.getTimestamp("rent_date"));
				rent.setRent_Num(rs.getInt("rent_num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) 
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
		}
		return rent;
	}
	
	
	// 글목록
		public List<book_dto> getbookList(int start, int end){
			List<book_dto> list = new ArrayList<book_dto>();
			Connection con  = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();

	String sql="select * from ( select rownum rnum, book.* from ";			
		   sql+=" ( select * from book";		
		   sql+=" ) book ) ";
		   sql+=" where rnum >= ? and rnum <= ?";
		   
		   		pstmt = con.prepareStatement(sql);
		   		pstmt.setInt(1, start);
		   		pstmt.setInt(2, end);
		   		rs = pstmt.executeQuery();		// SQL문 실행
		   		
		   		while(rs.next()) {
		   			book_dto book = new book_dto();
		   			
		   			book.setBook_Num(rs.getInt("book_num"));
					book.setBook_Name(rs.getString("book_name"));
					book.setBook_Cover(rs.getString("book_Cover"));
					book.setWriter(rs.getString("writer"));
					book.setPublisher(rs.getString("publisher"));
					book.setGenre(rs.getString("genre"));
					book.setBook_regDate(rs.getDate("book_regDate"));
					book.setWriter_talks(rs.getString("writer_talks"));

					book.setBook_ref(rs.getInt("book_ref"));
					book.setBook_lev(rs.getInt("book_lev"));
					book.setBook_seq(rs.getInt("book_seq"));
					list.add(book);
		   		}
		   
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try { rs.close();}catch(Exception e) {}
				if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
				if(con != null) try { con.close();}catch(Exception e) {}
			}		
			return list;
		}
}
