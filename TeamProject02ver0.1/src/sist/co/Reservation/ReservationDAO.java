package sist.co.Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sist.co.DBManager.DBManager;
import test.Movie.MovieDTO;

public class ReservationDAO implements iReservateionDAO {
  
	private boolean isS = true;
	private static ReservationDAO reservDAO;
	
	public static ReservationDAO getInstance(){
		if (reservDAO == null) {
			reservDAO = new ReservationDAO();
		}
		return reservDAO;
	}
	
	@Override
	public List<ReservationDTO> getHistoryList(String m_id) {
		String sql = " SELECT * FROM RESERVATION WHERE R_TIME<SYSDATE AND M_ID=? ";
		//지난 예매내역
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ReservationDTO> rList = new ArrayList<ReservationDTO>();
		log("1/6 success getHistoryList");
		
		try{
			conn = DBManager.getConnection();
			log("2/6 success getHistoryList");
			
			pstmt = conn.prepareStatement(sql);
			log("3/6 success getHistoryList");
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			log("4/6 success getHistoryList");
			
			while(rs.next()){
				int i = 1;
				ReservationDTO dto = new ReservationDTO();
				
				dto.setR_seq(rs.getInt(i++));
				dto.setM_id(rs.getString(i++));
				dto.setTh_seq(rs.getInt(i++));
				dto.setMv_seq(rs.getInt(i++));
				dto.setR_poll(rs.getInt(i++));
				dto.setR_totalprice(rs.getInt(i++));
				dto.setR_adult(rs.getInt(i++));
				dto.setR_student(rs.getInt(i++));
				dto.setR_elder(rs.getInt(i++));
				dto.setR_time(rs.getDate(i++));
				dto.setR_thname(rs.getString(i++));
				dto.setR_cinema(rs.getString(i++));
						 
				rList.add(dto);	
			}
			log("5/6 success getHistoryList");
			
		}catch(SQLException e){
			
			log("Fail getHistoryList");
			
		}finally {
			DBManager.close(conn, pstmt, rs);
			log("6/6 success getHistoryList");
		}
		
		return rList;
	}

	@Override
	public List<ReservationDTO> getTicketList(String m_id) {
		String sql = " SELECT * FROM RESERVATION WHERE R_TIME>SYSDATE AND M_ID=? ORDER BY R_TIME ASC, R_SEQ ASC ";
		//내 티켓보기
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ReservationDTO> rList = new ArrayList<ReservationDTO>();
		log("1/6 success getTicketList");
		
		try{
			conn = DBManager.getConnection();
			log("2/6 success getTicketList");
			
			pstmt = conn.prepareStatement(sql);
			log("3/6 success getTicketList");
			
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			log("4/6 success getTicketList");
			
			while(rs.next()){
				int i = 1;
				ReservationDTO dto = new ReservationDTO();
				
				dto.setR_seq(rs.getInt(i++));
				dto.setM_id(rs.getString(i++));
				dto.setTh_seq(rs.getInt(i++));
				dto.setMv_seq(rs.getInt(i++));
				dto.setR_poll(rs.getInt(i++));
				dto.setR_totalprice(rs.getInt(i++));
				dto.setR_adult(rs.getInt(i++));
				dto.setR_student(rs.getInt(i++));
				dto.setR_elder(rs.getInt(i++));
				dto.setR_time(rs.getDate(i++));
				dto.setR_thname(rs.getString(i++));
				dto.setR_cinema(rs.getString(i++));
						 
				rList.add(dto);	
			}
			log("5/6 success getTicketList");
			
		}catch(SQLException e){
			
			log("Fail getTicketList");
			
		}finally {
			DBManager.close(conn, pstmt, rs);
			log("6/6 success getTicketList");
		}
		
		return rList;
	}

/*	@Override
	public ReservationDTO getTicket(int r_seq) {
		 String sql = " SELECT * FROM RESERVATION WHERE R_SEQ=? ";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			ReservationDTO rdto = null;
			log("1/6 success getTicket");

			try{
				conn = DBManager.getConnection();
				log("2/6 success getTicket");
				
				pstmt = conn.prepareStatement(sql);
				log("3/6 success getTicket");
				
				pstmt.setInt(1, r_seq);
				
				rs = pstmt.executeQuery();
				log("4/6 success getTicket");
				
				while(rs.next()){
					int i = 1;
					rdto = new ReservationDTO();
					
					rdto.setR_seq(rs.getInt(i++));
					rdto.setM_id(rs.getString(i++));
					rdto.setTh_seq(rs.getInt(i++));
					rdto.setMv_seq(rs.getInt(i++));
					rdto.setR_poll(rs.getInt(i++));
					rdto.setR_totalprice(rs.getInt(i++));
					rdto.setR_adult(rs.getInt(i++));
					rdto.setR_student(rs.getInt(i++));
					rdto.setR_elder(rs.getInt(i++));
					rdto.setR_time(rs.getDate(i++));
					rdto.setR_thname(rs.getString(i++));
					rdto.setR_cinema(rs.getString(i++));
					
				}
				log("5/6 success getTicket");
				
			}catch(SQLException e){
				
				log("Fail getTicket");
				
			}finally {
				DBManager.close(conn, pstmt, rs);
				log("6/6 success getTicket");
			}
			
			return rdto;
	}*/
	
	@Override
	public boolean cancleReserv(int r_seq, int th_seq) {
		String sql1 = " DELETE FROM RESERVATION WHERE R_SEQ=? ";
		String sql2 = " UPDATE SEAT SET S1=' ',S2=' ',S3=' ',S4=' ',S5=' ',S6=' ',S7=' ',S8=' ',S9=' ',S10=' ' "
                    + " WHERE S1||S2||S3||S4||S5||S6||S7||S8||S9||S10 like 'S%' AND TH_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		log("6/6 success cancleReserv");
		
		try{
			conn = DBManager.getConnection();
			conn.setAutoCommit(false);//자동 커밋 안됨
			log("2/6 success cancleReserv");
			
			pstmt = conn.prepareStatement(sql1);
			log("3/6 success cancleReserv");
			
			pstmt.setInt(1, r_seq);
			
			count = pstmt.executeUpdate();
			log("4/6 success cancleReserv");
			
			pstmt.clearParameters();
			log("5/6/1 success cancleReserv");
			pstmt = conn.prepareStatement(sql2);
			
			pstmt.setInt(1, th_seq);
			log("5/6/2 success cancleReserv");
			
			pstmt.executeBatch();
			log("5/6/3 success cancleReserv");
			
			conn.commit(); //수동커밋
			log("5/6/4 success cancleReserv");
			
		}catch(SQLException e){
			try {
				conn.rollback();
			} catch (SQLException e1) {
			}
			log("Fail cancleReserv");
			
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
			}
			DBManager.close(conn, pstmt);
			
			log("6/6 success cancleReserv");
		}
		System.out.println(count);
		return count>0?true:false;
	}
	
	

	@Override
	public int countPeople(int r_seq) {
		
		return 0;
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
	
	
	//ay
	@Override
	public boolean judgereserve(int seq, String id) {
		
		String sql = " SELECT * FROM RESERVATION WHERE MV_SEQ=? AND M_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
				
		boolean isS = false;
		
		try{
			conn = DBManager.getConnection();
			log("2/6 Success judgereserve");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, id);
			log("3/6 Success judgereserve");
			
			rs = psmt.executeQuery();
			log("4/6 Success judgereserve");
			while(rs.next()){
				isS = true;		// 해당하는 데이터가 있으면 true
			}
			System.out.println("isS:" + isS);
			
		}catch(SQLException e){
			log("Fail judgereserve");
		}finally{
			DBManager.close(conn, psmt, rs);
			log("6/6 Success judgereserve");
		}

		return isS;
	}

	@Override
	public int judgepoll(int seq, String id) {
	
		String sql = " SELECT R_POLL FROM RESERVATION WHERE MV_SEQ=? AND M_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
				
		int r_poll = 0;
		
		try{
			conn = DBManager.getConnection();
			log("2/6 Success judgereserve");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, id);
			log("3/6 Success judgereserve");
			
			rs = psmt.executeQuery();
			log("4/6 Success judgereserve");
			while(rs.next()){
				r_poll = rs.getInt(1);
			}
			System.out.println("r_poll:" + r_poll);
			
		}catch(SQLException e){
			log("Fail judgereserve");
		}finally{
			DBManager.close(conn, psmt, rs);
			log("6/6 Success judgereserve");
		}
				
		return r_poll;	// 0: 투표 X, 1: 좋아요, 2: 싫어요 => true : 투표했음

	}

	@Override
	public boolean reserve(ReservationDTO rdto) {

		String sql = " INSERT INTO RESERVATION VALUES(R_SEQ.NEXTVAL, ?, ?, ?, 0, ?, ?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
				
		int count = 0;
		
		try{
			conn = DBManager.getConnection();
			log("2/6 Success reserve");
			
			psmt = conn.prepareStatement(sql);
			int i = 1;
			psmt.setString(i++, rdto.getM_id());
			psmt.setInt(i++, rdto.getTh_seq());
			psmt.setInt(i++, rdto.getMv_seq());
			psmt.setInt(i++, rdto.getR_totalprice());
			psmt.setInt(i++, rdto.getR_adult());
			psmt.setInt(i++, rdto.getR_student());
			psmt.setInt(i++, rdto.getR_elder());
			log("3/6 Success reserve");
			
			count = psmt.executeUpdate();
			log("4/6 Success reserve");
			
			
		}catch(SQLException e){
			log("Fail reserve");
		}finally{
			DBManager.close(conn, psmt);
			log("6/6 Success reserve");
		}
		
		return count>0?true:false;
	}
	
	
	
	
	
	

}
