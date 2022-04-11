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

import dto.member_board_dto;
import dto.member_dto;
import dto.rent_dto;

public class rent_dao {

	// 싱글톤
	private static rent_dao instance = new rent_dao();

	public static rent_dao getInstance() {
		return instance;
	}

	// 컨넥션풀에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	// 대출목록 추가
	public int insert(rent_dto rent) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "insert into rent values(?,?,?,sysdate,0)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rent.getRent_Num());
			pstmt.setInt(2, rent.getBook_Num());
			pstmt.setString(3, rent.getId());

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

	// 대출내역
	public List<rent_dto> getRentList(String id) {
		List<rent_dto> rentlist = new ArrayList<rent_dto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select rt.book_num, bk.book_name, rt.rent_num, rt.id, rt.rent_date, rt.return_date from rent rt, book bk ";
			sql += " where rt.book_num = bk.book_num and rt.id = ?";
			// 전체 게시글 목록
			System.out.println("id:" + id);
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rent_dto rent = new rent_dto();
				rent.setRent_Num(rs.getInt("rent_num"));
				rent.setBook_Num(rs.getInt("book_num"));
				rent.setId(rs.getString("id"));
				rent.setRent_Date(rs.getTimestamp("rent_date"));
				rent.setReturn_Date(rs.getDate("return_date"));

				rentlist.add(rent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			;
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			;
			if (con != null)
				try {
					con.close();
				} catch (Exception e) {
				}
			;
		}

		return rentlist;
	}

	public int getCount() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select count(*) from rent";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1); // count(*)
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
		}
		return result;
	}

}
