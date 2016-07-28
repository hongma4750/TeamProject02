
--[1] member

DROP TABLE MEMBER
CASCADE CONSTRAINT;

SELECT * FROM MEMBER

CREATE TABLE MEMBER(
	M_ID VARCHAR2(50) PRIMARY KEY,
	M_PW VARCHAR2(50) NOT NULL,
	M_NAME VARCHAR2(100) NOT NULL,
	M_EMAIL VARCHAR2(200) NOT NULL,
	M_AUTH NUMBER NOT NULL,
	M_PHOTO VARCHAR2(100) NOT NULL
)

--[2] movie : MV_LIKE : 좋아요, MV_ON : 상영중인영화

DROP TABLE MOVIE
CASCADE CONSTRAINT;

DROP SEQUENCE MV_SEQ; 

SELECT * FROM MOVIE

CREATE TABLE MOVIE(
	MV_SEQ NUMBER PRIMARY KEY,
	MV_TITLE VARCHAR2(200) NOT NULL,
	MV_OPENDAY DATE NOT NULL,
	MV_GENRE VARCHAR2(50) NOT NULL,
	MV_IMG VARCHAR2(500) NOT NULL,
	MV_LIKE NUMBER NOT NULL,
	MV_ON NUMBER NOT NULL
)

CREATE SEQUENCE MV_SEQ
START WITH 1 INCREMENT BY 1


--[3] theater

DROP TABLE THEATER
CASCADE CONSTRAINT;

DROP SEQUENCE TH_SEQ; 

SELECT * FROM THEATER

CREATE TABLE THEATER(
	TH_SEQ NUMBER PRIMARY KEY,
	TH_NAME VARCHAR2(100) NOT NULL,
	MV_SEQ NUMBER NOT NULL, 
	TH_CINEMA VARCHAR2(500) NOT NULL,
	TH_NUM NUMBER NOT NULL,
	TH_TOTALSEAT NUMBER NOT NULL,
	TH_LEFTSEAT NUMBER NOT NULL,
	TH_TIME DATE NOT NULL
)

CREATE SEQUENCE TH_SEQ
START WITH 1 INCREMENT BY 1

ALTER TABLE THEATER 
ADD CONSTRAINT FK_THEATER_MV_SEQ FOREIGN KEY(MV_SEQ)
REFERENCES MOVIE(MV_SEQ);


--[4] SEAT : 좌석 수 == COLUMN 수 

DROP TABLE SEAT
CASCADE CONSTRAINT;

SELECT * FROM SEAT

CREATE TABLE SEAT(
	TH_SEQ NUMBER NOT NULL,
	S1 NUMBER NOT NULL,
	S2 NUMBER NOT NULL,
	S3 NUMBER NOT NULL,
	S4 NUMBER NOT NULL,
	S5 NUMBER NOT NULL,
	S6 NUMBER NOT NULL,
	S7 NUMBER NOT NULL,
	S8 NUMBER NOT NULL,
	S9 NUMBER NOT NULL,
	S10 NUMBER NOT NULL
)


ALTER TABLE SEAT 
ADD CONSTRAINT FK_SEAT_TH_SEQ FOREIGN KEY(TH_SEQ)
REFERENCES THEATER(TH_SEQ);


--[5] reservation : 예매

DROP TABLE RESERVATION
CASCADE CONSTRAINT;

DROP SEQUENCE R_SEQ

SELECT * FROM RESERVATION

CREATE TABLE RESERVATION(
	R_SEQ NUMBER PRIMARY KEY,
	M_ID VARCHAR2(50) NOT NULL,
	TH_SEQ NUMBER NOT NULL,
	R_TOTALPRICE NUMBER NOT NULL,
	R_ADULT NUMBER NOT NULL,
	R_STUDENT NUMBER NOT NULL,
	R_ELDER NUMBER NOT NULL,
	R_DATE DATE NOT NULL
)

CREATE SEQUENCE R_SEQ
START WITH 1 INCREMENT BY 1

ALTER TABLE RESERVATION 
ADD CONSTRAINT FK_RESERVATION_M_ID FOREIGN KEY(M_ID)
REFERENCES MEMBER(M_ID);

ALTER TABLE RESERVATION 
ADD CONSTRAINT FK_RESERVATION_TH_SEQ FOREIGN KEY(TH_SEQ)
REFERENCES THEATER(TH_SEQ);


--[6] PRICE : 영화가격표 // P_GRADE : ADULT, STUDENT, ELDER

DROP TABLE PRICE
CASCADE CONSTRAINT;

DROP SEQUENCE P_SEQ

SELECT * FROM PRICE

CREATE TABLE PRICE(
	P_SEQ NUMBER PRIMARY KEY,
	P_GRADE VARCHAR2(10) NOT NULL,
	P_PRICE NUMBER NOT NULL,
)

CREATE SEQUENCE P_SEQ
START WITH 1 INCREMENT BY 1

-- [7] FRIEND : (SNS)

DROP TABLE FRIEND
CASCADE CONSTRAINT;

SELECT * FROM FRIEND

CREATE TABLE FRIEND()


-- [8] REVIEW : (SNS)

DROP TABLE REVIEW
CASCADE CONSTRAINT;

SELECT * FROM REVIEW

CREATE TABLE REVIEW(
	r_seq number(5) primary key,
	m_id varchar2(50) not null,
	r_title varchar2(500) not null,
	r_content varchar2(3000) not null,
	r_writedate date default sysdate,
	r_like number default 0,
	r_readcount number default 0
)

alter table REVIEW
add constraint fk_review_id foreign key(m_id)
references member(m_id)

drop sequence review_seq;
create sequence review_seq
start with 1 increment by 1;



insert into review (r_seq,m_id,r_title,r_content) values (review_seq.nextval,'hong','안녕하세요1','안녕하세요1');
insert into review (r_seq,m_id,r_title,r_content) values (review_seq.nextval,'hong','안녕하세요2','안녕하세요2');
insert into review (r_seq,m_id,r_title,r_content) values (review_seq.nextval,'hong','안녕하세요3','안녕하세요3');


-- [9] r_comment : (SNS - 댓글)

DROP TABLE r_comment
CASCADE CONSTRAINT;

SELECT * FROM r_comment

CREATE TABLE r_comment(
	com_seq number(5) primary key,
	r_seq number(5) not null,
	m_id varchar2(50) not null,
	com_content varchar2(500) not null,
	com_writedate date default sysdate
)

alter table r_comment
add constraint fk_comment_r_seq foreign key(r_seq)
references review(r_seq)

drop sequence comment_seq;
create sequence comment_seq
start with 1 increment by 1;

insert into r_comment values (comment_seq.nextval,1,'hong','ㅋㅋㅋㅋ아닌듯',sysdate);
insert into r_comment values (comment_seq.nextval,1,'ma','간지나요',sysdate);





