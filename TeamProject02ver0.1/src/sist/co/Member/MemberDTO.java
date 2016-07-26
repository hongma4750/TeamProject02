package sist.co.Member;

public class MemberDTO {
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	
	public MemberDTO() {
	
	}
	
	public MemberDTO(String m_id, String m_pw, String m_name, String m_email) {
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
	}
		
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String toString(){
		return "MEMBER[m_id:" + m_id + ",m_pw:" + m_pw + ",m_name:"
				+ m_name + ",m_email:" + m_email + "]"; 
	}
	
}

