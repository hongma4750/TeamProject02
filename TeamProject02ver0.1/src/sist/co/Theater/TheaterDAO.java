package sist.co.Theater;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sist.co.DBManager.DBManager;

public class TheaterDAO implements ITheater{

	private boolean isS = true;
	private static TheaterDAO TheaterDao;
	
	public TheaterDAO() {
	
	}

	public void log(String msg){
		if(isS){
			System.out.println(getClass() + ":" + msg);					// getClass() == this.getClass()
		}
	}
	
	public void log(String msg, Exception e){							// Exception 까지 출력되도록 
		if(isS){
			System.out.println(e + ":" + getClass() + ":" + msg);		// getClass() == this.getClass()
		}
	}

	
	public static TheaterDAO getInstance(){						// Singleton에 해당
		if(TheaterDao == null){
			TheaterDao = new TheaterDAO();
		}
		return TheaterDao;
	}
	
	
	
	
	@Override
	public List<TheaterDTO> getTheaterList(int mv_seq) {
		
		String sql = " SELECT * FROM THEATER WHERE MV_SEQ=? ";
		
		Connection conn=null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TheaterDTO> thlist = new ArrayList<TheaterDTO>();

		try {
			conn = DBManager.getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, mv_seq);
			
			
			rs = psmt.executeQuery();
			while(rs.next()){
				TheaterDTO thdto = new TheaterDTO();
				int i = 1;
				thdto.setTh_seq(rs.getInt(i++));
				thdto.setTh_name(rs.getString(i++));
				thdto.setMv_seq(rs.getInt(i++));
				thdto.setTh_cinema(rs.getString(i++));
				thdto.setTh_num(rs.getInt(i++));
				thdto.setTh_totalseat(rs.getInt(i++));
				thdto.setTh_time(rs.getTimestamp(i++));
				
				thlist.add(thdto);
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, psmt);
		}
		return thlist;
	}

	@Override
	public List<TheaterDTO> getTh_num(int mv_seq, String th_name, String th_cinema) {
		
		String sql = " SELECT TH_SEQ, TH_NUM, TO_CHAR(TH_TIME, 'YYYY-MM-DD HH24:MI:SS') FROM THEATER WHERE MV_SEQ=? AND TH_NAME=? AND TH_CINEMA=? ";
		
		Connection conn=null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TheaterDTO> thlist = new ArrayList<TheaterDTO>();

		try {
			conn = DBManager.getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, mv_seq);
			psmt.setString(2, th_name);
			psmt.setString(3, th_cinema);
			
			rs = psmt.executeQuery();
			while(rs.next()){
				TheaterDTO thdto = new TheaterDTO();
				thdto.setTh_seq(rs.getInt(1));
				thdto.setTh_num(rs.getInt(2));
				thdto.setTh_time(rs.getTimestamp(3));
				
				thlist.add(thdto);
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, psmt);
		}
		
		return thlist;
	}

	@Override
	public TheaterDTO getTheaterinform(int th_seq) {
		String sql = " SELECT * FROM THEATER WHERE TH_SEQ=? ";
		
		Connection conn=null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		TheaterDTO thdto = new TheaterDTO();

		try {
			conn = DBManager.getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, th_seq);
			
			
			rs = psmt.executeQuery();
			while(rs.next()){
				int i = 1;
				thdto.setTh_seq(rs.getInt(i++));
				thdto.setTh_name(rs.getString(i++));
				thdto.setMv_seq(rs.getInt(i++));
				thdto.setTh_cinema(rs.getString(i++));
				thdto.setTh_num(rs.getInt(i++));
				thdto.setTh_totalseat(rs.getInt(i++));
				thdto.setTh_time(rs.getTimestamp(i++));
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, psmt);
		}
		return thdto;
	}

	
	//지점명을 그룹바이로 출력
	@Override
	public List<TheaterDTO> groupByTheater() {
		List<TheaterDTO> list = new ArrayList<TheaterDTO>();
		
		String sql = "select th_name from theater group by th_name";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				TheaterDTO th = new TheaterDTO();
				th.setTh_name(rs.getString("th_name"));
				
				list.add(th);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	public List<TheaterDTO> groupByCinema(String th_name) {
		List<TheaterDTO> list = new ArrayList<TheaterDTO>();
		
		String sql = "select th_cinema from THEATER where th_name = ? group by th_cinema ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, th_name);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				TheaterDTO th = new TheaterDTO();
				th.setTh_cinema(rs.getString("th_cinema"));
				
				list.add(th);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	public List<TheaterDTO> selectTh_Num(String th_name,String th_cinema) {
		List<TheaterDTO> list = new ArrayList<TheaterDTO>();
		
		String sql = "select th_num from theater where th_name=? and th_cinema=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, th_name);
			pstmt.setString(2, th_cinema);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				TheaterDTO th = new TheaterDTO();
				th.setTh_num(rs.getInt("th_num"));
				list.add(th);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	
	
	public int findTh_seq(String th_name, String th_cinema, int th_num){
		int th_seq = 0;
		
		String sql ="select th_seq from theater where th_name=? and th_cinema=? and th_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, th_name);
			pstmt.setString(2, th_cinema);
			pstmt.setInt(3, th_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				th_seq = rs.getInt("th_seq");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		
		return th_seq;
	}
	
	public void updateForm(TheaterDTO dto){
		String sql = "update theater set mv_seq=?, th_s_date=?,th_e_date=?, th_time=? where th_seq=?";
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getMv_seq());
			pstmt.setTimestamp(2, dto.getTh_s_date());
			pstmt.setTimestamp(3, dto.getTh_e_date());
			pstmt.setTimestamp(4, dto.getTh_time());
			pstmt.setInt(5, dto.getTh_seq());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt);
		}
		
	}

}