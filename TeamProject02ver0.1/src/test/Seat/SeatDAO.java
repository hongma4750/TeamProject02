package test.Seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sist.co.DBManager.DBManager;
import test.Reservation.ReservationDAO;
import test.Reservation.ReservationDTO;

public class SeatDAO implements iSeatDAO{
	
	private boolean isS = true;
	private static SeatDAO seatDAO;
	
	public static SeatDAO getInstance(){
		if (seatDAO == null) {
			seatDAO = new SeatDAO();
		}
		return seatDAO;
	}

	@Override
	public List<SeatDTO> getSeatList(int th_seq) {
		
		String sql = " SELECT S1,S2,S3,S4,S5,S6,S7,S8,S9,S10 FROM SEAT WHERE TH_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<SeatDTO> sList = new ArrayList<SeatDTO>();
		log("1/6 success getSeatList");
		
		try{
			conn = DBManager.getConnection();
			log("2/6 success getSeatList");
			
			pstmt = conn.prepareStatement(sql);
			log("3/6 success getSeatList");
			pstmt.setInt(1, th_seq);
			rs = pstmt.executeQuery();
			log("4/6 success getSeatList");
			
			while(rs.next()){
				int i = 1;
				SeatDTO dto = new SeatDTO();
				
				dto.setS1(rs.getString(i++));
				dto.setS2(rs.getString(i++));
				dto.setS3(rs.getString(i++));
				dto.setS4(rs.getString(i++));
				dto.setS5(rs.getString(i++));
				dto.setS6(rs.getString(i++));
				dto.setS7(rs.getString(i++));
				dto.setS8(rs.getString(i++));
				dto.setS9(rs.getString(i++));
				dto.setS10(rs.getString(i++));
						 
				sList.add(dto);	
			}
			log("5/6 success getSeatList");
			
		}catch(SQLException e){
			
			log("Fail getSeatList");
			
		}finally {
			DBManager.close(conn, pstmt, rs);
			log("6/6 success getSeatList");
		}
		
		return sList;
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
