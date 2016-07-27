package sist.movie;

import java.util.Date;

public class TheaterDTO {

	private int th_seq;
	private String th_name;
	private int mv_seq;
	private String th_cinema;
	private int th_num;
	private int th_totalseat;
	private int th_leftseat;
	private Date th_time;
	
	public TheaterDTO() {
		
	}

	public TheaterDTO(int th_seq, String th_name, int mv_seq, String th_cinema, int th_num, int th_totalseat, int th_leftseat, Date th_time) {
		this.th_seq = th_seq;
		this.th_name = th_name;
		this.mv_seq = mv_seq;
		this.th_cinema = th_cinema;
		this.th_num = th_num;
		this.th_totalseat = th_totalseat;
		this.th_leftseat = th_leftseat;
		this.th_time = th_time;
	}

	public int getTh_seq() {
		return th_seq;
	}

	public void setTh_seq(int th_seq) {
		this.th_seq = th_seq;
	}

	public String getTh_name() {
		return th_name;
	}

	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}

	public int getMv_seq() {
		return mv_seq;
	}

	public void setMv_seq(int mv_seq) {
		this.mv_seq = mv_seq;
	}

	public String getTh_cinema() {
		return th_cinema;
	}

	public void setTh_cinema(String th_cinema) {
		this.th_cinema = th_cinema;
	}

	public int getTh_num() {
		return th_num;
	}

	public void setTh_num(int th_num) {
		this.th_num = th_num;
	}

	public int getTh_totalseat() {
		return th_totalseat;
	}

	public void setTh_totalseat(int th_totalseat) {
		this.th_totalseat = th_totalseat;
	}

	public int getTh_leftseat() {
		return th_leftseat;
	}

	public void setTh_leftseat(int th_leftseat) {
		this.th_leftseat = th_leftseat;
	}

	public Date getTh_time() {
		return th_time;
	}

	public void setTh_time(Date th_time) {
		this.th_time = th_time;
	}
	
	public String toString(){
		return "THEATER[th_seq:" + th_seq + ",th_name:" + th_name + ",mv_seq:"
				+ mv_seq + ",th_cinema:" + th_cinema + ",th_num:" + th_num + ",th_totalseat:" 
				+ th_totalseat + ",th_leftseat:" + th_leftseat + ",th_time:" + th_time + "]"; 
	}

	
}