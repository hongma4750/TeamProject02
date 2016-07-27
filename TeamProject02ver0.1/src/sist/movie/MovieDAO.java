package sist.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sist.co.DBManager.DBManager;

public class MovieDAO implements IMovie{

	private boolean isS = true;
	private static MovieDAO movieDao;
	
	public MovieDAO() {
	
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

	
	public static MovieDAO getInstance(){						// Singleton에 해당
		if(movieDao == null){
			movieDao = new MovieDAO();
		}
		return movieDao;
	}

	@Override
	public MovieDTO getmoviedetail(int seq) {
		
		String sql = " SELECT * FROM MOVIE WHERE MV_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MovieDTO mdto = new MovieDTO();
		
		try{
			conn = DBManager.getConnection();
			log("2/6 Success getmoviedetail");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			log("3/6 Success getmoviedetail");
			
			rs = psmt.executeQuery();
			log("4/6 Success getmoviedetail");
			while(rs.next()){
				int i = 1;
				mdto.setMv_seq(rs.getInt(i++));
				mdto.setMv_title(rs.getString(i++));
				mdto.setMv_openday(rs.getDate(i++));
				mdto.setMv_genre(rs.getString(i++));
				mdto.setMv_story(rs.getString(i++));
				mdto.setMv_img(rs.getString(i++));
				mdto.setMv_count(rs.getInt(i++));
				mdto.setMv_like(rs.getInt(i++));
				mdto.setMv_hate(rs.getInt(i++));
				mdto.setMv_on(rs.getInt(i++));
			}
		
		}catch(SQLException e){
			log("Fail getmoviedetail");
		}finally{
			DBManager.close(conn, psmt, rs);
			log("6/6 Success getmoviedetail");
		}
		
		return mdto;
	}

	@Override
	public boolean addlike(int seq, int likeorhate) {
		
		String sql1 = " UPDATE MOVIE SET MV_LIKE=MV_LIKE+1 WHERE MV_SEQ=? ";
		String sql2 = " UPDATE MOVIE SET MV_HATE=MV_HATE+1 WHERE MV_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try{
			conn = DBManager.getConnection();
			log("2/6 Success addlike");
			
			if(likeorhate == 1){	// 좋아요
				psmt = conn.prepareStatement(sql1);
			}else{					// 싫어요
				psmt = conn.prepareStatement(sql2);
			}
			psmt.setInt(1, seq);
			log("3/6 Success addlike");
			
			count=psmt.executeUpdate();
			log("4/6 Success addlike");
	
		
		}catch(SQLException e){
			log("Fail addlike");
		}finally{
			DBManager.close(conn, psmt, rs);
			log("6/6 Success addlike");
		}
		
		return count>0?true:false;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
