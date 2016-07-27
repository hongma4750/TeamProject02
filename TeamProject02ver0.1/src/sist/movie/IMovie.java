package sist.movie;

public interface IMovie {

	MovieDTO getmoviedetail(int seq);
	boolean addlike(int seq, int likeorhate);

}
