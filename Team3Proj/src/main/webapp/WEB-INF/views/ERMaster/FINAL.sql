
/* Drop Tables */

DROP TABLE AUTH_SECURITY CASCADE CONSTRAINTS;
DROP TABLE GALLARY_COMMENT CASCADE CONSTRAINTS;
DROP TABLE GALLARY_DEC CASCADE CONSTRAINTS;
DROP TABLE GALLARY_LIKE CASCADE CONSTRAINTS;
DROP TABLE GALLARY_SCRAP CASCADE CONSTRAINTS;
DROP TABLE GAL_FILE CASCADE CONSTRAINTS;
DROP TABLE GALLARY_BOARD CASCADE CONSTRAINTS;
DROP TABLE NOTICE_COMMENT CASCADE CONSTRAINTS;
DROP TABLE NOTICE_FILE CASCADE CONSTRAINTS;
DROP TABLE NOTICE_BOARD CASCADE CONSTRAINTS;
DROP TABLE NUTRIENT CASCADE CONSTRAINTS;
DROP TABLE REC_COMMENT CASCADE CONSTRAINTS;
DROP TABLE REC_DEC CASCADE CONSTRAINTS;
DROP TABLE REC_FILE CASCADE CONSTRAINTS;
DROP TABLE REC_LIKE CASCADE CONSTRAINTS;
DROP TABLE REC_SCRAP CASCADE CONSTRAINTS;
DROP TABLE REC_BOARD CASCADE CONSTRAINTS;
DROP TABLE RES_FILE CASCADE CONSTRAINTS;
DROP TABLE RES_REVIEW_DEC CASCADE CONSTRAINTS;
DROP TABLE RES_REVIEW_LIKE CASCADE CONSTRAINTS;
DROP TABLE RES_REVIEW_SCRAP CASCADE CONSTRAINTS;
DROP TABLE RES_VIEW CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT CASCADE CONSTRAINTS;
DROP TABLE USER_DIET CASCADE CONSTRAINTS;
DROP TABLE USER_DM CASCADE CONSTRAINTS;
DROP TABLE USER_FILE CASCADE CONSTRAINTS;
DROP TABLE USER_FOLLOW CASCADE CONSTRAINTS;
DROP TABLE VG_USER CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE AUTH_SECURITY
(
	auth_no number NOT NULL,
	authority nvarchar2(10) DEFAULT '''USER''' NOT NULL,
	enabled number DEFAULT 1 NOT NULL,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (auth_no)
);


CREATE TABLE GALLARY_BOARD
(
	gallary_no number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	postDate date DEFAULT SYSDATE,
	visitCount number DEFAULT 0,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (gallary_no)
);


CREATE TABLE GALLARY_COMMENT
(
	gallary_com_no number NOT NULL,
	content nvarchar2(100) NOT NULL,
	parent number,
	postDate date DEFAULT SYSDATE,
	userID varchar2(20 char) NOT NULL,
	gallary_no number NOT NULL,
	PRIMARY KEY (gallary_com_no)
);


CREATE TABLE GALLARY_DEC
(
	content nvarchar2(100),
	userID varchar2(20 char) NOT NULL,
	gallary_no number NOT NULL,
	PRIMARY KEY (userID, gallary_no)
);


CREATE TABLE GALLARY_LIKE
(
	gallary_no number NOT NULL,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (gallary_no, userID)
);


CREATE TABLE GALLARY_SCRAP
(
	userID varchar2(20 char) NOT NULL,
	gallary_no number NOT NULL,
	PRIMARY KEY (userID, gallary_no)
);


CREATE TABLE GAL_FILE
(
	gallary_file_no number NOT NULL,
	f_path nvarchar2(300) NOT NULL,
	f_name nvarchar2(100) NOT NULL,
	userID varchar2(20 char) NOT NULL,
	gallary_no number NOT NULL,
	PRIMARY KEY (gallary_file_no)
);


CREATE TABLE NOTICE_BOARD
(
	notice_no number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	postDate date DEFAULT SYSDATE,
	visitCount number DEFAULT 0,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (notice_no)
);


CREATE TABLE NOTICE_COMMENT
(
	notice_com_no number NOT NULL,
	content nvarchar2(100) NOT NULL,
	parent number,
	postDate date DEFAULT SYSDATE,
	userID varchar2(20 char) NOT NULL,
	notice_no number NOT NULL,
	PRIMARY KEY (notice_com_no)
);


CREATE TABLE NOTICE_FILE
(
	notice_file_no number NOT NULL,
	f_path nvarchar2(300) NOT NULL,
	f_name nvarchar2(100) NOT NULL,
	userID varchar2(20 char) NOT NULL,
	notice_no number NOT NULL,
	PRIMARY KEY (notice_file_no)
);


CREATE TABLE NUTRIENT
(
	nur_no number NOT NULL,
	PRIMARY KEY (nur_no)
);


CREATE TABLE REC_BOARD
(
	rec_no nvarchar2(50) NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	postDate date DEFAULT SYSDATE,
	visitCount number DEFAULT 0,
	userID varchar2(20 char) NOT NULL,
	vg_level nvarchar2(20) NOT NULL,
	PRIMARY KEY (rec_no)
);


CREATE TABLE REC_COMMENT
(
	rec_com_no number NOT NULL,
	content nvarchar2(100) NOT NULL,
	parent number,
	postDate date DEFAULT SYSDATE,
	userID varchar2(20 char) NOT NULL,
	rec_no nvarchar2(50) NOT NULL,
	PRIMARY KEY (rec_com_no)
);


CREATE TABLE REC_DEC
(
	content nvarchar2(100),
	userID varchar2(20 char) NOT NULL,
	rec_no nvarchar2(50) NOT NULL,
	PRIMARY KEY (userID, rec_no)
);


CREATE TABLE REC_FILE
(
	rec_file_no number NOT NULL,
	f_path nvarchar2(300) NOT NULL,
	f_name nvarchar2(100) NOT NULL,
	userID varchar2(20 char) NOT NULL,
	rec_no nvarchar2(50) NOT NULL,
	PRIMARY KEY (rec_file_no)
);


CREATE TABLE REC_LIKE
(
	userID varchar2(20 char) NOT NULL,
	rec_no nvarchar2(50) NOT NULL,
	PRIMARY KEY (userID, rec_no)
);


CREATE TABLE REC_SCRAP
(
	userID varchar2(20 char) NOT NULL,
	rec_no nvarchar2(50) NOT NULL,
	PRIMARY KEY (userID, rec_no)
);


CREATE TABLE RESTAURANT
(
	res_no number NOT NULL,
	res_name nvarchar2(20) NOT NULL,
	res_addr nvarchar2(50) NOT NULL,
	res_tel nvarchar2(20) NOT NULL,
	category nvarchar2(20) NOT NULL,
	PRIMARY KEY (res_no)
);


CREATE TABLE RES_FILE
(
	res_file_no number NOT NULL,
	f_path nvarchar2(300) NOT NULL,
	f_name nvarchar2(100) NOT NULL,
	res_no number NOT NULL,
	PRIMARY KEY (res_file_no)
);


CREATE TABLE RES_REVIEW_DEC
(
	content nvarchar2(50) NOT NULL,
	review_no number NOT NULL,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (review_no, userID)
);


CREATE TABLE RES_REVIEW_LIKE
(
	review_no number NOT NULL,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (review_no, userID)
);


CREATE TABLE RES_REVIEW_SCRAP
(
	review_no number NOT NULL,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (review_no, userID)
);


CREATE TABLE RES_VIEW
(
	review_no number NOT NULL,
	star number DEFAULT 3 NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(100) NOT NULL,
	postDate date DEFAULT SYSDATE,
	userID varchar2(20 char) NOT NULL,
	res_no number NOT NULL,
	PRIMARY KEY (review_no)
);


CREATE TABLE USER_DIET
(
	diet_no number NOT NULL,
	category nvarchar2(20) DEFAULT 'DINNER',
	eatDate date DEFAULT SYSDATE,
	kal nvarchar2(10),
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (diet_no)
);


CREATE TABLE USER_DM
(
	dm_no number NOT NULL,
	toOtherUser nvarchar2(20) NOT NULL,
	content nvarchar2(100) NOT NULL,
	postDate date DEFAULT SYSDATE,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (dm_no)
);


CREATE TABLE USER_FILE
(
	user_file_no number NOT NULL,
	f_path nvarchar2(300) NOT NULL,
	f_name nvarchar2(100) NOT NULL,
	userID varchar2(20 char) NOT NULL,
	PRIMARY KEY (user_file_no)
);


CREATE TABLE USER_FOLLOW
(
	otherID nvarchar2(20) NOT NULL,
	userID varchar2(20 char) NOT NULL
);


CREATE TABLE VG_USER
(
	userID varchar2(20 char) NOT NULL,
	password nvarchar2(20) NOT NULL,
	nickname nvarchar2(10) NOT NULL,
	gender nvarchar2(10) DEFAULT 'MALE' NOT NULL,
	name nvarchar2(10) NOT NULL,
	age number NOT NULL,
	addr nvarchar2(50),
	vg_level varchar2(20),
	selfintro nvarchar2(2000),
	PRIMARY KEY (userID)
);



/* Create Foreign Keys */

ALTER TABLE GALLARY_COMMENT
	ADD FOREIGN KEY (gallary_no)
	REFERENCES GALLARY_BOARD (gallary_no)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_DEC
	ADD FOREIGN KEY (gallary_no)
	REFERENCES GALLARY_BOARD (gallary_no)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_LIKE
	ADD FOREIGN KEY (gallary_no)
	REFERENCES GALLARY_BOARD (gallary_no)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_SCRAP
	ADD FOREIGN KEY (gallary_no)
	REFERENCES GALLARY_BOARD (gallary_no)
	ON DELETE CASCADE
;


ALTER TABLE GAL_FILE
	ADD FOREIGN KEY (gallary_no)
	REFERENCES GALLARY_BOARD (gallary_no)
	ON DELETE CASCADE
;


ALTER TABLE NOTICE_COMMENT
	ADD FOREIGN KEY (notice_no)
	REFERENCES NOTICE_BOARD (notice_no)
	ON DELETE CASCADE
;


ALTER TABLE NOTICE_FILE
	ADD FOREIGN KEY (notice_no)
	REFERENCES NOTICE_BOARD (notice_no)
	ON DELETE CASCADE
;


ALTER TABLE REC_COMMENT
	ADD FOREIGN KEY (rec_no)
	REFERENCES REC_BOARD (rec_no)
	ON DELETE CASCADE
;


ALTER TABLE REC_DEC
	ADD FOREIGN KEY (rec_no)
	REFERENCES REC_BOARD (rec_no)
	ON DELETE CASCADE
;


ALTER TABLE REC_FILE
	ADD FOREIGN KEY (rec_no)
	REFERENCES REC_BOARD (rec_no)
	ON DELETE CASCADE
;


ALTER TABLE REC_LIKE
	ADD FOREIGN KEY (rec_no)
	REFERENCES REC_BOARD (rec_no)
	ON DELETE CASCADE
;


ALTER TABLE REC_SCRAP
	ADD FOREIGN KEY (rec_no)
	REFERENCES REC_BOARD (rec_no)
	ON DELETE CASCADE
;


ALTER TABLE RES_FILE
	ADD FOREIGN KEY (res_no)
	REFERENCES RESTAURANT (res_no)
	ON DELETE CASCADE
;


ALTER TABLE RES_VIEW
	ADD FOREIGN KEY (res_no)
	REFERENCES RESTAURANT (res_no)
	ON DELETE CASCADE
;


ALTER TABLE RES_REVIEW_DEC
	ADD FOREIGN KEY (review_no)
	REFERENCES RES_VIEW (review_no)
	ON DELETE CASCADE
;


ALTER TABLE RES_REVIEW_LIKE
	ADD FOREIGN KEY (review_no)
	REFERENCES RES_VIEW (review_no)
	ON DELETE CASCADE
;


ALTER TABLE RES_REVIEW_SCRAP
	ADD FOREIGN KEY (review_no)
	REFERENCES RES_VIEW (review_no)
	ON DELETE CASCADE
;


ALTER TABLE AUTH_SECURITY
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_BOARD
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_COMMENT
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_DEC
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_LIKE
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE GALLARY_SCRAP
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE GAL_FILE
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE NOTICE_BOARD
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE NOTICE_COMMENT
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE NOTICE_FILE
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE REC_BOARD
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE REC_COMMENT
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE REC_DEC
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE REC_FILE
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE REC_LIKE
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE REC_SCRAP
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE RES_REVIEW_DEC
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE RES_REVIEW_LIKE
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE RES_REVIEW_SCRAP
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE RES_VIEW
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE USER_DIET
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE USER_DM
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE USER_FILE
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;


ALTER TABLE USER_FOLLOW
	ADD FOREIGN KEY (userID)
	REFERENCES VG_USER (userID)
	ON DELETE CASCADE
;

/* SEQUENCE */
CREATE SEQUENCE SEQ_DIET_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_AUTH_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_USER_FILE_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_GAL_FILE_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_GALLARY_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_GAL_COM_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_USERID
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_REC_COM_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_REC_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_REC_FILE_NO
NOCACHE
NOCYCLE;

CREATE SEQUENCE SEQ_USER_DM_NO
NOCACHE
NOCYCLE;



