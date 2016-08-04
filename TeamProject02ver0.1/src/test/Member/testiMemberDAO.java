package test.Member;

import sist.co.Member.MemberDTO;

public interface testiMemberDAO {
	boolean updateMember (String pw, String email, String photo, String id);
	boolean outMember (MemberDTO dto);  
}
