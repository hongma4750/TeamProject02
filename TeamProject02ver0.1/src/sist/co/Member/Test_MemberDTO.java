package sist.co.Member;

public class Test_MemberDTO {
	
	private String M_Id;
	private String M_Pw;
	private String M_Name;/*
	private String M_Phone1;
	private String M_Phone2;
	private String M_Phone3;*/
	private String M_Email;
	private int auth;
	
	public Test_MemberDTO() {
	}

	public String getM_Id() {
		return M_Id;
	}

	public void setM_Id(String m_Id) {
		M_Id = m_Id;
	}

	public String getM_Pw() {
		return M_Pw;
	}

	public void setM_Pw(String m_Pw) {
		M_Pw = m_Pw;
	}

	public String getM_Name() {
		return M_Name;
	}

	public void setM_Name(String m_Name) {
		M_Name = m_Name;
	}

	public String getM_Email() {
		return M_Email;
	}

	public void setM_Email(String m_Email) {
		M_Email = m_Email;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "Test_MemberDTO [M_Id=" + M_Id + ", M_Pw=" + M_Pw + ", M_Name=" + M_Name + ", M_Email=" + M_Email
				+ ", auth=" + auth + "]";
	}

	
}
