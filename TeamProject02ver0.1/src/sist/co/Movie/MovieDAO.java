package sist.co.Movie; 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sist.co.DBManager.DBManager;
import test.Reservation.ReservationDTO;

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
	public boolean addlike(int seq, int likeorhate, String id) {
		
		//like
		String sql1 = " UPDATE MOVIE SET MV_LIKE=MV_LIKE+1 WHERE MV_SEQ=? ";
		String sql2 = " UPDATE MOVIE SET MV_HATE=MV_HATE+1 WHERE MV_SEQ=? ";
		
		//modify r_poll 
		String sql3 = " UPDATE RESERVATION SET R_POLL=? WHERE MV_SEQ=? AND M_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try{
			conn = DBManager.getConnection();
			conn.setAutoCommit(false);
			log("2/6 Success addlike");
			
			if(likeorhate == 1){	// 좋아요
				psmt = conn.prepareStatement(sql1);
			}else{					// 싫어요
				psmt = conn.prepareStatement(sql2);
			}
			psmt.setInt(1, seq);
			log("3/6 Success addlike- 1");
			
			count=psmt.executeUpdate();
			log("4/6 Success addlike- 1");
			
			psmt.clearParameters();
			
			
			psmt = conn.prepareStatement(sql3);
			if(likeorhate == 1){	// 좋아요
				psmt.setInt(1, 1);
			}else{					// 싫어요
				psmt.setInt(1, 2);
			}
			psmt.setInt(2, seq);
			psmt.setString(3, id);
			log("3/6 Success addlike - 2");
			count=count*psmt.executeUpdate();
			log("4/6 Success addlike - 2");
			

			conn.commit();
			
		
		}catch(SQLException e){
			log("Fail addlike");
			try{
				conn.rollback();
			}catch(SQLException ex){}
		}finally{
			try{
				conn.setAutoCommit(true);
			}catch(SQLException ex){}
			DBManager.close(conn, psmt, rs);
			log("6/6 Success addlike");
		}
		
		return count>0?true:false;
	}

	@Override
	public List<MovieDTO> getOnMovieList() {
		
		String sql = " SELECT MV_SEQ, MV_TITLE, MV_OPENDAY, MV_GENRE, MV_IMG, MV_COUNT FROM MOVIE WHERE MV_ON=1 ";
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MovieDTO> mlist = new ArrayList<MovieDTO>();

		try {
			conn = DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()){
				MovieDTO mdto = new MovieDTO();
				mdto.setMv_seq(rs.getInt(1));
				mdto.setMv_title(rs.getString(2));
				mdto.setMv_openday(rs.getDate(3));
				mdto.setMv_genre(rs.getString(4));
				mdto.setMv_img(rs.getString(5));
				mdto.setMv_count(rs.getInt(6));
				mlist.add(mdto);
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt);
		}
		
		return mlist;
	}

	
	
	// SNS/ReviewWrite에서 영화 이미지 가져올때 사용됨
	// mv_seq, mv_title, mv_img 값만 가지는 MovieDTO를 List에 담아 리턴
	@Override
	public List<MovieDTO> getMovie() {
		MovieDTO movie = null;
		List<MovieDTO> molist = new ArrayList<MovieDTO>();
		
		String sql = "select mv_seq,mv_title,mv_img from movie";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				movie = new MovieDTO();
				
				movie.setMv_seq(rs.getInt("mv_seq"));
				movie.setMv_title(rs.getString("mv_title"));
				movie.setMv_img(rs.getString("mv_img"));
				
				molist.add(movie);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		return molist;
	}
	
	
	public List<MovieDTO> getOnMovie() {
		MovieDTO movie = null;
		List<MovieDTO> molist = new ArrayList<MovieDTO>();
		
		String sql = "select mv_seq,mv_title,mv_img from movie where mv_on=1";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				movie = new MovieDTO();
				
				movie.setMv_seq(rs.getInt("mv_seq"));
				movie.setMv_title(rs.getString("mv_title"));
				movie.setMv_img(rs.getString("mv_img"));
				
				molist.add(movie);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		return molist;
	}


	
	
	// SNS/ReviewDetail 에서 영화 이미지 뿌릴때 필요함
	@Override
	public String getMvIMG(int mv_seq) {
		String mv_img = null;
		String sql = "select mv_img from movie where mv_seq = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mv_seq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mv_img = rs.getString("mv_img");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		return mv_img;
	}

	//영화정보리스트
	@Override
	public List<MovieDTO> getInfoMovieList() {
		String sql = " SELECT * FROM MOVIE ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<MovieDTO> mvList = new ArrayList<MovieDTO>();
		log("1/6 success getInfoMovieList");
		
		try{
			conn = DBManager.getConnection();
			log("2/6 success getInfoMovieList");
			
			pstmt = conn.prepareStatement(sql);
			log("3/6 success getInfoMovieList");
			
			rs = pstmt.executeQuery();
			log("4/6 success getInfoMovieList");
			
			while(rs.next()){
				int i = 1;
				MovieDTO mvdto = new MovieDTO();
				
				mvdto.setMv_seq(rs.getInt(i++));
				mvdto.setMv_title(rs.getString(i++));
				mvdto.setMv_openday(rs.getDate(i++));
				mvdto.setMv_genre(rs.getString(i++));
				mvdto.setMv_story(rs.getString(i++));
				mvdto.setMv_img(rs.getString(i++));
				mvdto.setMv_count(rs.getInt(i++));
				mvdto.setMv_like(rs.getInt(i++));
				mvdto.setMv_hate(rs.getInt(i++));
				mvdto.setMv_on(rs.getInt(i++));
					 
				mvList.add(mvdto);	
			}
			log("5/6 success getInfoMovieList");
			
		}catch(SQLException e){
			
			log("Fail getInfoMovieList");
			
		}finally {
			DBManager.close(conn, pstmt, rs);
			log("6/6 success getHistoryList");
		}
		
		return mvList;
	}
	
	
	public List<MovieDTO> getOffMovie() {
		MovieDTO movie = null;
		List<MovieDTO> molist = new ArrayList<MovieDTO>();
		
		String sql = "select mv_seq,mv_title,mv_img from movie where mv_on=0";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				movie = new MovieDTO();
				
				movie.setMv_seq(rs.getInt("mv_seq"));
				movie.setMv_title(rs.getString("mv_title"));
				movie.setMv_img(rs.getString("mv_img"));
				
				molist.add(movie);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt, rs);
		}
		return molist;
	}
	
	public void changeMovie(int mv_seq,String check){
		String sql = null;
		if(check.equals("off")){
			sql = "update movie set mv_on = 0 where mv_seq=?";
		}else if(check.equals("on")){
			sql = "update movie set mv_on = 1 where mv_seq=?";
		}
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mv_seq);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally{
			DBManager.close(conn, pstmt);
			
		}
	}
	
	
	
}
