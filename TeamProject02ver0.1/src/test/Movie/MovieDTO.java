package test.Movie;

import java.util.Date;

public class MovieDTO {
  
	private int mv_seq;
	private String mv_title;
	private Date mv_openday;
	private String mv_genre;
	private String mv_img;
	private int mv_like;
	private int mv_on;
	
	public MovieDTO() {
		
	}

	public int getMv_seq() {
		return mv_seq;
	}

	public void setMv_seq(int mv_seq) {
		this.mv_seq = mv_seq;
	}

	public String getMv_title() {
		return mv_title;
	}

	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}

	public Date getMv_openday() {
		return mv_openday;
	}

	public void setMv_openday(Date mv_openday) {
		this.mv_openday = mv_openday;
	}

	public String getMv_genre() {
		return mv_genre;
	}

	public void setMv_genre(String mv_genre) {
		this.mv_genre = mv_genre;
	}

	public String getMv_img() {
		return mv_img;
	}

	public void setMv_img(String mv_img) {
		this.mv_img = mv_img;
	}

	public int getMv_like() {
		return mv_like;
	}

	public void setMv_like(int mv_like) {
		this.mv_like = mv_like;
	}

	public int getMv_on() {
		return mv_on;
	}

	public void setMv_on(int mv_on) {
		this.mv_on = mv_on;
	}

	@Override
	public String toString() {
		return "MovieDTO [mv_seq=" + mv_seq + ", mv_title=" + mv_title + ", mv_openday=" + mv_openday + ", mv_genre="
				+ mv_genre + ", mv_img=" + mv_img + ", mv_like=" + mv_like + ", mv_on=" + mv_on + "]";
	}

	
	
}
