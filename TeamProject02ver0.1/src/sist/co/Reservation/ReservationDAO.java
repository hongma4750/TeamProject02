package sist.co.Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sist.co.DBManager.DBManager;

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
	public List<ReservationDTO> getReservList() {
		
		String sql = " SELECT * FROM RESERVATION "
				+ " WHERE  ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ReservationDTO> rList = new ArrayList<ReservationDTO>();
		log("1/6 success getReservList");
		
		try{
			conn = DBManager.getConnection();
			log("2/6 success getReservList");
			
			pstmt = conn.prepareStatement(sql);
			log("3/6 success getReservList");
			
			rs = pstmt.executeQuery();
			log("4/6 success getReservList");
			
			while(rs.next()){
				int i = 1;
				ReservationDTO dto = new ReservationDTO();
				
				dto.setR_seq(rs.getInt(i++));
				dto.setM_id(rs.getString(i++));
				dto.setTh_seq(rs.getInt(i++));
				dto.setR_totalprice(rs.getInt(i++));
				dto.setR_adult(rs.getInt(i++));
				dto.setR_student(rs.getInt(i++));
				dto.setR_elder(rs.getInt(i++));
						 
				rList.add(dto);	
			}
			log("5/6 success getReservList");
			
		}catch(SQLException e){
			
			log("Fail getReservList");
			
		}finally {
			DBManager.close(conn, pstmt, rs);
			log("6/6 success getReservList");
		}
		
		return rList;
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
