package sist.movie;

public interface IReservation {

	boolean judgereserve(int seq, String id);
	boolean judgepoll(int seq, String id);
}
