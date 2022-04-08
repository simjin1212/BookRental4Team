// DAO(Data Access Object)

package dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.member_board_dto;

public class member_board_dao {
	
	// 싱글톤
	private static member_board_dao instance = new member_board_dao();

	public static member_board_dao getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드 
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}
	//원글 입력
	public int insert(member_board_dto memberboard) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
			
		try {
			con = getConnection();
				
			String sql="insert into member_board values(member_board_seq.nextval,?,?,?,?,sysdate,member_board_seq.nextval,0,0,0,?)";
			pstmt=con.prepareStatement(sql); 
			pstmt.setString(1, memberboard.getId());
			pstmt.setString(2, memberboard.getMb_Subject());
			pstmt.setString(3, memberboard.getMb_Content());
			pstmt.setString(4, memberboard.getMb_File());
			pstmt.setInt(5, memberboard.getMb_Grade());

			result = pstmt.executeUpdate();   // SQL문 실행
				       
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}
		return result;
	}
	//총 게시글 수
	public int getCount() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
			
		try {
			con = getConnection();
			
			String sql="select count(*) from member_board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);	//count(*)
			}
		       
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}
		return result;
	}
	//공지	
	public List<member_board_dto> getNTList(int num){
		List<member_board_dto> boardlist =new ArrayList<member_board_dto>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from (select rownum rnum, board.* from ";
			sql+=" (select *from member_board where mb_grade=1 order by mb_num desc) board) ";
			sql+=" where rownum<=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				member_board_dto board=new member_board_dto();
				board.setMb_Num(rs.getInt("mb_num"));
				board.setId(rs.getString("id"));
				board.setMb_Subject(rs.getString("mb_subject"));
				board.setMb_Content(rs.getString("mb_content"));
				board.setMb_File(rs.getString("mb_file"));
				board.setMb_Regdate(rs.getTimestamp("mb_regdate"));
				board.setMb_REF(rs.getInt("mb_ref"));
				board.setMb_LEV(rs.getInt("mb_lev"));
				board.setMb_SEQ(rs.getInt("mb_seq"));
				board.setMb_Readcount(rs.getInt("mb_readcount"));
				board.setMb_Grade(rs.getInt("mb_grade"));
				
				boardlist.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) 		try { rs.close(); 	 } catch(Exception e) { } ;
			if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
			if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
		}
		
		return boardlist;
	}
	
	//일반게시글
	public List<member_board_dto> getMBList(int start, int end){
		List<member_board_dto> boardlist =new ArrayList<member_board_dto>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from (select rownum rnum, board.* from ";
			sql+=" (select *from member_board order by mb_ref desc, mb_seq asc) board) ";
			sql+=" where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				member_board_dto board=new member_board_dto();
				board.setMb_Num(rs.getInt("mb_num"));
				board.setId(rs.getString("id"));
				board.setMb_Subject(rs.getString("mb_subject"));
				board.setMb_Content(rs.getString("mb_content"));
				board.setMb_File(rs.getString("mb_file"));
				board.setMb_Regdate(rs.getTimestamp("mb_regdate"));
				board.setMb_REF(rs.getInt("mb_ref"));
				board.setMb_LEV(rs.getInt("mb_lev"));
				board.setMb_SEQ(rs.getInt("mb_seq"));
				board.setMb_Readcount(rs.getInt("mb_readcount"));
				board.setMb_Grade(rs.getInt("mb_grade"));
				
				boardlist.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) 		try { rs.close(); 	 } catch(Exception e) { } ;
			if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
			if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
		}
		
		return boardlist;
	}
	
	//조회수 증가
	public void readcountUpdate(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=getConnection();
			
			String sql="update member_board set mb_readcount=mb_readcount+1 where mb_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
			if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
		}
	}
	//글 상세정보
	public member_board_dto getDetail(int num) {
		member_board_dto board=new member_board_dto();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from member_board where mb_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board.setMb_Num(rs.getInt("mb_num"));
				board.setId(rs.getString("id"));
				board.setMb_Subject(rs.getString("mb_subject"));
				board.setMb_Content(rs.getString("mb_content"));
				board.setMb_File(rs.getString("mb_file"));
				board.setMb_Regdate(rs.getTimestamp("mb_regdate"));
				board.setMb_REF(rs.getInt("mb_ref"));
				board.setMb_LEV(rs.getInt("mb_lev"));
				board.setMb_SEQ(rs.getInt("mb_seq"));
				board.setMb_Readcount(rs.getInt("mb_readcount"));
				board.setMb_Grade(rs.getInt("mb_grade"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) 		try { rs.close(); 	 } catch(Exception e) { } ;
			if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
			if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
		}
		return board;
	}
	//글 수정
	public int update(member_board_dto board, String old, String path) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
			
		try {
			con = getConnection();
			
			String sql="update member_board set mb_subject=?, mb_content=?, mb_file=? where mb_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board.getMb_Subject());
			pstmt.setString(2, board.getMb_Content());
			pstmt.setString(3, board.getMb_File());
			pstmt.setInt(4, board.getMb_Num());
			
			result=pstmt.executeUpdate();
			
			if(old!=null&&!old.equals(board.getMb_File())) {	//기존 첨부파일이 존재하고 수정 파일과 같지 않을 경우
				File file=new File(path);		//저장 경로에 있는 파일
				
				File[] f= file.listFiles(); 		//모든 파일을 읽어서 배열에 저장
				for(int i=0; i<f.length; i++) {
					if(f[i].getName().equals(old)) {	//파일명 비교해서 같은 이름=같은 파일이면
						f[i].delete();		//기존 파일 삭제
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}
		return result;
	}
	
	//글 삭제
	public int delete(member_board_dto board, int num, String path) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
			
		try {
			con = getConnection();
			
			String sql="delete from member_board where mb_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			result=pstmt.executeUpdate();
			
			if(board.getMb_File()!=null) {	//첨부파일이 있다면
				File file=new File(path);		//저장 경로에 있는 파일
				
				File[] f= file.listFiles(); 		//upload 폴더의 모든 파일을 읽어서 배열에 저장
				for(int i=0; i<f.length; i++) {
					if(f[i].getName().equals(board.getMb_File())) {	//파일명 비교해서 같은 이름=같은 파일이면
						f[i].delete();		//파일 삭제
					}
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();}catch(Exception e) {}
			if(con != null) try { con.close();}catch(Exception e) {}
		}
		return result;
	}
	//답글
	public int boardReply(member_board_dto board) {
		int result=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		
		//re 정보 미리 가져오기 (나중에 편하게)
		int re_ref=board.getMb_REF();
		int re_lev=board.getMb_LEV();
		int re_seq=board.getMb_SEQ();
		
		try {
			con=getConnection();
		//기존 답글 존재한다면 순서 하나씩 뒤로 밀기
			String sql="update member_board set mb_seq=mb_seq+1 ";
			sql+=" where mb_ref=? and mb_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);	//부모글과 한 블럭인 글에 한정
			pstmt.setInt(2, re_seq);	//답글의 답글일 경우 부모 답글의 아래로 순서가 정렬돼야 함
			pstmt.executeUpdate();
			pstmt.close();
			
			sql="insert into member_board values(member_board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getMb_Subject());
			pstmt.setString(3, board.getMb_Content());
			pstmt.setString(4, board.getMb_File());
			pstmt.setInt(5, re_ref);
			pstmt.setInt(6, re_lev+1); //깊이 +1
			pstmt.setInt(7, re_seq+1); 	//답글 순서 1
			pstmt.setInt(8, board.getMb_Grade());
			
			result = pstmt.executeUpdate();  
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close(); } catch(Exception e) { } ;
			if(con!=null) 	try { con.close();	 } catch(Exception e) { } ;
		}
		
		return result;
	}
	
}
