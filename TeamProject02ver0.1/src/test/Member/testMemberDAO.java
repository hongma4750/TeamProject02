package test.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sist.co.DBManager.DBManager;
import sist.co.Member.MemberDTO;

public class testMemberDAO implements testiMemberDAO {
	
	private boolean isS = true;
	private static testMemberDAO memDAO;
	
	public static testMemberDAO getInstance(){
		if (memDAO == null) {
			memDAO = new testMemberDAO();
		}
		return memDAO;
	}

	@Override
	public boolean updateMember(String pw,String email, String id) {
		
		String sql =  " UPDATE MEMBER SET M_PW=?, M_EMAIL=? "
				+ " WHERE M_ID=? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		log("1/6 Success updateMember");
		
		try{
		conn = DBManager.getConnection();
		log("2/6 Success updateMember");
		
		pstmt = conn.prepareStatement(sql);
		log("3/6 Success updateMember");
		
		pstmt.setString(1, pw);
		pstmt.setString(2, email);
		pstmt.setString(3, id);
		
	//	pstmt.setString(1, "1111");
	//	pstmt.setString(2, "1111");
	//	pstmt.setString(3, "BOMBOM");
		
		log("4/6 Success updateMember");
		
		count = pstmt.executeUpdate();
		log("5/6 Success updateMember");
		
		System.out.println(count);
		
		}catch(SQLException e){
			log("Fail updateMember");
		}finally {
			DBManager.close(conn, pstmt);
			log("6/6 Success updateMember");
		}
		
		return count>0?true:false;
	}


	@Override
	public boolean outMember(MemberDTO dto) {
		String sql = " DELETE FROM MEMBER WHERE M_ID=? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		log("1/6 Success outMember");
		try{
			conn = DBManager.getConnection();
			log("2/6 Success outMember");
			
			pstmt = conn.prepareStatement(sql);
			log("3/6 Success outMember");
			
			pstmt.setString(1, dto.getM_id().toUpperCase());
			log("4/6 Success outMember");
			
			count = pstmt.executeUpdate();
			log("5/6 Success outMember");
			
			}catch(SQLException e){
				log("Fail outMember");
			}finally {
				DBManager.close(conn, pstmt);
				log("6/6 Success outMember");
			}
			
			return count>0?true:false;
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