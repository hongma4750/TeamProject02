package sist.co.Reservation;

import java.util.List;
  
public interface iReservateionDAO {
	
	List<ReservationDTO> getHistoryList(String m_id);
	List<ReservationDTO> getTicketList(String m_id);
	//ReservationDTO getTicket(int r_seq);
	boolean cancleReserv(int r_seq, int th_req);
	int countPeople(int r_seq);
}
