package sist.co.AddMovie;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import sist.co.DBManager.DBManager;

public class AddMovieDAO implements iAddMovieDAO {
	
	private boolean isS = true;
	private static AddMovieDAO addmovieDao;
	
	public AddMovieDAO() {
	}
	
	public static AddMovieDAO getInstance(){						// Singleton에 해당
		if(addmovieDao == null){
			addmovieDao = new AddMovieDAO();
		}
		return addmovieDao;
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
	
	
	//admin
	@Override
	public boolean addMovie(AddMovieDTO addmdto) {

		String sql = " INSERT INTO MOVIE VALUES (MV_SEQ.NEXTVAL,?,?,?,?,?,0,0,0,0) ";

		Connection conn = null;
		PreparedStatement pstmt = null;

		int count = 0;
		log("1/6 Success addMovie");

		try{
			conn = DBManager.getConnection();
			log("2/6 Success addMovie");

			pstmt = conn.prepareStatement(sql);
			log("3/6 Success addMovie");

			int i = 1;
			pstmt.setString(i++, addmdto.getMv_title());
			pstmt.setDate(i++, (Date) addmdto.getMv_openday());
			pstmt.setString(i++, addmdto.getMv_genre());
			pstmt.setString(i++, addmdto.getMv_story());
			pstmt.setString(i++, addmdto.getMv_img());
			log("4/6 Success addMovie");

			count = pstmt.executeUpdate();
			log("5/6 Success addMovie");

		}catch(SQLException e){
			log("Fail addMovie");
		}finally {
			DBManager.close(conn, pstmt);
			log("6/6 Success addMovie");
		}

		return count>0?true:false;
	}

	
	
	


}
