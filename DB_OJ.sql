CREATE TABLE USERS
(
handle VARCHAR2(10), 
name VARCHAR2(255) NOT NULL, 
password VARCHAR2(255) NOT NULL, 
join_date DATE DEFAULT SYSDATE, 
last_login DATE DEFAULT SYSDATE, 
global_rating NUMBER DEFAULT 0, 
email VARCHAR(255),
country VARCHAR2(60),
institute VARCHAR2(255),
CONSTRAINT user_pk PRIMARY KEY (handle)
);


CREATE TABLE CONTESTS
(
contest_id NUMBER,
title VARCHAR2(255),
start_time DATE NOT NULL,
end_time DATE NOT NULL,
min_rating NUMBER,
max_rating NUMBER,
handle VARCHAR2(10),
CONSTRAINT c_u_fk FOREIGN KEY (handle) REFERENCES USERS,
CONSTRAINT contest_pk PRIMARY KEY (contest_id)
);

ALTER TABLE contests MODIFY title VARCHAR(255) UNIQUE NOT NULL;

CREATE SEQUENCE contest_seq;

CREATE OR REPLACE PROCEDURE insert_contest(start_time IN VARCHAR2, end_time IN VARCHAR2, handle IN VARCHAR2, title IN VARCHAR2, id OUT NUMBER)
IS
BEGIN
	id := contest_seq.nextval;
	INSERT INTO contests(contest_id, start_time, end_time, handle, title) VALUES(id, TO_DATE(start_time, 'DD/MM/YYYY HH24:MI:SS'), TO_DATE(end_time, 'DD/MM/YYYY HH24:MI:SS'), handle, title);
END;
/

CREATE TABLE PROBLEMS
(
problem_id VARCHAR2(1) NOT NULL,
statement VARCHAR2(100) NOT NULL,
time_limit NUMBER NOT NULL,
memory_limit NUMBER NOT NULL,
test_case VARCHAR2(100),
categories VARCHAR2(100),
contest_id NUMBER NOT NULL,
handle VARCHAR2(10) NOT NULL,
tries NUMBER DEFAULT 0,
CONSTRAINT p_u_fk FOREIGN KEY (handle) REFERENCES USERS,
CONSTRAINT p_c_fk FOREIGN KEY (contest_id) REFERENCES contests,
CONSTRAINT problem_pk PRIMARY KEY (contest_id, problem_id)
);


CREATE TABLE PARTICIPATIONS
(
contest_id NUMBER,
handle VARCHAR(10),
ac_problems NUMBER DEFAULT 0,
penalty NUMBER DEFAULT 0,
CONSTRAINT par_u_fk FOREIGN KEY(handle) REFERENCES users,
CONSTRAINT par_c_fk FOREIGN KEY(contest_id) REFERENCES contests,
CONSTRAINT participation_pk PRIMARY KEY (handle, contest_id)
);



CREATE TABLE SUBMISSIONS
(
handle VARCHAR(10) NOT NULL,
problem_id VARCHAR(1) NOT NULL,
contest_id NUMBER NOT NULL,
submission_id NUMBER,
sub_time DATE DEFAULT SYSDATE,
language VARCHAR2(10) NOT NULL,
time NUMBER,
memory NUMBER,
CONSTRAINT s_u_fk FOREIGN KEY (handle) REFERENCES users,
CONSTrAINT s_p_fk FOREIGN KEY (contest_id, problem_id) REFERENCES problems(contest_id, problem_id),
CONSTRAINT submission_pk PRIMARY KEY (submission_id)
);




CREATE TABLE BLOGS
(
handle VARCHAR2(10) NOT NULL,
blog_id NUMBER,
publish_date DATE DEFAULT SYSDATE,
data VARCHAR2(4000) NOT NULL,
category VARCHAR(100),
CONSTRAINT b_u_fk FOREIGN KEY (handle) REFERENCES users,
CONSTRAINT blog_pk PRIMARY KEY (blog_id)
);

CREATE SEQUENCE blog_seq;

CREATE OR REPLACE PROCEDURE insert_blog(handle IN VARCHAR2, data IN VARCHAR2, id OUT NUMBER)
IS
BEGIN
	id := blog_seq.nextval;
	INSERT INTO blogs(blog_id, handle, data) VALUES(id, handle, data);
END;
/


CREATE TABLE ANNOUNCEMENTS
(
blog_id NUMBER,
contest_id NUMBER NOT NULL,
CONSTRAINT a_b_fk FOREiGN KEY (blog_id) REFERENCES blogs,
CONSTRAINT a_c_fk FOREIGN KEY (contest_id) REFERENCES contests,
CONSTRAINT announcement_pk PRIMARY KEY (blog_id)
);



CREATE TABLE TUTORIALS
(
blog_id NUMBER,
contest_id NUMBER NOT NULL,
problem_id VARCHAR(1) NOT NULL,
CONSTRAINT t_b_fk FOREiGN KEY (blog_id) REFERENCES blogs,
CONSTRAINT t_p_fk FOREIGN KEY (contest_id, problem_id) REFERENCES problems(contest_id, problem_id),
CONSTRAINT tutorial_pk PRIMARY KEY (blog_id)
);


CREATE TABLE COMMENTS
(
comment_id NUMBER GENERATED ALWAYS AS IDENTITY,
blog_id NUMBER NOT NULL,
handle VARCHAR2(10) NOT NULL,
data VARCHAR2(100),
CONSTRAINT com_b_fk FOREIGN KEY (blog_id) REFERENCES blogs,
CONSTRAINT com_u_fk FOREIGN KEY (handle) REFERENCES users,
CONSTRAINT comment_pk PRIMARY KEY (comment_id)
);

ALTER TABLE PROBLEMS ADD difficulty NUMBER;
ALTER TABLE PROBLEMS ADD name VARCHAR(50);
ALTER TABLE PROBLEMS DROP COLUMN statement;
ALTER TABLE PROBLEMS DROP COLUMN TEST_CASE;


--TO BE UPDATED IN MOBASWIR'S END
ALTER TABLE PROBLEMS DROP COLUMN SOLVE;
ALTER TABLE PROBLEMS ADD SOLVES NUMBER DEFAULT 0;
UPDATE PROBLEMS SET SOLVES = 0 WHERE 1=1;