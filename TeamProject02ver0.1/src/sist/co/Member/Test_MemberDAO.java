package sist.co.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sist.co.DBManager.*;
public class Test_MemberDAO implements Test_iMemberDAO{
	
	private boolean isS = true;
	private static Test_MemberDAO memDAO;
	
	
	public static Test_MemberDAO getInstance(){
		if (memDAO == null) {
			memDAO = new Test_MemberDAO();
		}
		return memDAO;
	}
	
	@Override
	public boolean addMember(Test_MemberDTO dto) {

		String sql = " insert into member(id, name, pw, email, auth) "
				+ " values (?,?,?,?,3) ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try{
			//db연결
			conn = DBManager.getConnection();
			log("1/6 success addMember");
			
			pstmt = conn.prepareStatement(sql);
			log("2/6 success addMember");
			
			pstmt.setString(1, dto.getM_Id());
			pstmt.setString(2, dto.getM_Name());
			pstmt.setString(3, dto.getM_Pw());
			pstmt.setString(4, dto.getM_Email());
			log("3/6 success addMember");
			
			count = pstmt.executeUpdate(); //sql문 추가를 센다
			log("4/6 success addMember");
			
		}catch(SQLException e){
			log("fail addMember");
		}finally {
			DBManager.close(conn, pstmt, rs);
			log("5/6 success addMember");
		}
		return count>0?true:false;
	}
	@Override
	public Test_MemberDTO login(Test_MemberDTO dto) {
		String sql = " SELECT ID,NAME,EMAIL,AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PW=? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Test_MemberDTO mem = null; //로그인대상
		
		try{
			conn = DBManager.getConnection(); //db연결
			log("1/6 success login");
			
			pstmt = conn.prepareStatement(sql);
			log("2/6 success login");
			
			//set 할 ?,?
			pstmt.setString(1, dto.getM_Id());
			pstmt.setString(2, dto.getM_Pw());
			log("3/6 success login");
			
			rs = pstmt.executeQuery();
			log("4/6 success login");
			
			while(rs.next()){
				int i=1;
				//get 해온 ID,NAME,PW,EMAIL,AUTH
				mem = new Test_MemberDTO();
				mem.setM_Id(rs.getString(i++));
				mem.setM_Pw(null);
				mem.setM_Name(rs.getString(i++));
				mem.setM_Email(rs.getString(i++));
				mem.setAuth(rs.getInt(i++));
				
			}
			log("5/6 success login");
		}catch(SQLException e){
			log("fail login");
		}finally {
			DBManager.close(conn, pstmt, rs);
			log("6/6 success login");
		}
		
		return mem;
	}
	
	public void log(String msg){
		if(isS){ //isS가 true일때
			System.out.println(this.getClass() + ":" + msg);
		}
	}

	public void log(String msg, Exception e ){
		if(isS){ //isS가 true일때
			System.out.println(e + ":" + this.getClass() + ":" + msg);
		}
	}

}
