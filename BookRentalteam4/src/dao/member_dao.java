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

import dto.member_dto;

public class member_dao {

	// 싱글톤
	private static member_dao instance = new member_dao();

	public static member_dao getInstance() {
		return instance;
	}

	// 컨넥션풀에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	// 예시 회원가입
	public int insert(member_dto member) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "insert into member ";
			sql += " values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate,0)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getMailid());
			pstmt.setString(7, member.getDomain());
			pstmt.setString(8, member.getPhone1());
			pstmt.setString(9, member.getPhone2());
			pstmt.setString(10, member.getPhone3());
			pstmt.setString(11, member.getPost());
			pstmt.setString(12, member.getAddress());

			System.out.println("입력완료");
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

	// idcheck
	public int idcheck(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from member where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) { // 중복 ID
				result = 1;
			} else { // 사용 가능한 ID
				result = -1;
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

	// 로그인(회원인증)
	public int memberAuth(String id, String passwd) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from member where id=? and passwd=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) { // 회원 인증 성공
				result = 1;
				
			} else { // 회원 인증 실패
				result = -1;
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
	
	//관리자 체크
	public int admincheck(String id) {
		int result = 0;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();

			String sql = "select * from member where id = ? and member_grade = 1";		

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) { // 관리자계정
				result = 1;
			} else { // 일반계정
				result = -1;
			}
			System.out.println("result : "+result);

		}catch(Exception e){
			e.printStackTrace();
		}finally {
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

	// 회원 1명의 상세정보 구하기 : 수정품, 수정, 삭제
	public member_dto getMember(String id) {
		member_dto member = new member_dto();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();

			String sql = "select * from member where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // SQL문 실행

			if (rs.next()) {
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin(rs.getString("jumin"));
				member.setJumin2(rs.getString("jumin2"));
				member.setMailid(rs.getString("mailid"));
				member.setDomain(rs.getString("domain"));
				member.setPhone1(rs.getString("phone1"));
				member.setPhone2(rs.getString("phone2"));
				member.setPhone3(rs.getString("phone3"));
				member.setPost(rs.getString("post"));
				member.setAddress(rs.getString("address"));
				member.setReg_Date(rs.getTimestamp("reg_date"));
				System.out.println("한명 디테일 구하기 완료!!!");
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
		return member;
	}
	

	// 회원정보 수정
	public int update(member_dto member) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "update member set mailid=?,";
			sql += "domain=?,phone1=?,phone2=?,phone3=?,";
			sql += "post=?,address=? where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMailid());
			pstmt.setString(2, member.getDomain());
			pstmt.setString(3, member.getPhone1());
			pstmt.setString(4, member.getPhone2());
			pstmt.setString(5, member.getPhone3());
			pstmt.setString(6, member.getPost());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getId());

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

	// 회원 탈퇴
	public int delete(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = getConnection();

			String sql = "delete from member where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	//관리자 - 관리자가 아닌 회원 전부  리스트
	public List<member_dto> member_getList(){
		List<member_dto> list = new ArrayList<member_dto>();
		Connection con  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();

String sql = "select * from member where member_grade = 0";
	   
	   		pstmt = con.prepareStatement(sql);
	   		rs = pstmt.executeQuery();		// SQL문 실행
	   		System.out.println("sql실행");
	   		while(rs.next()) {
	   			member_dto member = new member_dto();
	   			
	   			member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin(rs.getString("jumin"));
				member.setJumin2(rs.getString("jumin2"));
				member.setMailid(rs.getString("mailid"));
				member.setDomain(rs.getString("domain"));
				member.setPhone1(rs.getString("phone1"));
				member.setPhone2(rs.getString("phone2"));
				member.setPhone3(rs.getString("phone3"));
				member.setPost(rs.getString("post"));
				member.setAddress(rs.getString("address"));
				member.setReg_Date(rs.getTimestamp("reg_date"));
//	   			
//	   			book.setBook_ref(rs.getInt("book_ref"));
//	   			book.setBook_lev(rs.getInt("book_lev"));
//	   			book.setBook_seq(rs.getInt("book_seq"));
	   			
	   			
	   			list.add(member);
	   			
	   		}
	   		System.out.println("데이터 리스트에 저장완료");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close();}catch(Exception e) {}
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}		
		return list;
	}
	// 관리자 - 총 맴버 갯수 구하기
	public int member_getcount() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql="select count(*) from member where member_grade = 0";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();		// SQL문 실행
			
			if(rs.next()) {
//				result = rs.getInt(1);
				result = rs.getInt("count(*)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close();}catch(Exception e) {}
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}		
		return result;
	}
}
