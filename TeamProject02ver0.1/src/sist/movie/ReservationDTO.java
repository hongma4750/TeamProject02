package sist.movie;

public class ReservationDTO {

	private int r_seq;
	private String m_id;
	private int th_seq;
	private int r_totalprice;
	private int r_adult;
	private int r_student;
	private int r_elder;
	
	public ReservationDTO() {
	
	}
	
	public ReservationDTO(int r_seq, String m_id, int th_seq, int r_totalprice, int r_adult, int r_student, int r_elder) {
		this.r_seq = r_seq;
		this.m_id = m_id;
		this.th_seq = th_seq;
		this.r_totalprice = r_totalprice;
		this.r_adult = r_adult;
		this.r_student = r_student;
		this.r_elder = r_elder;		
	}

	public int getR_seq() {
		return r_seq;
	}

	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getTh_seq() {
		return th_seq;
	}

	public void setTh_seq(int th_seq) {
		this.th_seq = th_seq;
	}

	public int getR_totalprice() {
		return r_totalprice;
	}

	public void setR_totalprice(int r_totalprice) {
		this.r_totalprice = r_totalprice;
	}

	public int getR_adult() {
		return r_adult;
	}

	public void setR_adult(int r_adult) {
		this.r_adult = r_adult;
	}

	public int getR_student() {
		return r_student;
	}

	public void setR_student(int r_student) {
		this.r_student = r_student;
	}

	public int getR_elder() {
		return r_elder;
	}

	public void setR_elder(int r_elder) {
		this.r_elder = r_elder;
	}

	public String toString(){
		return "THEATER[r_seq:" + r_seq + ",m_id:" + m_id + ",th_seq:"
				+ th_seq + ",r_totalprice:" + r_totalprice + ",r_adult:" + r_adult + ",r_student:" 
				+ r_student + ",r_elder:" + r_elder + "]"; 
	}
	
	
	
}
