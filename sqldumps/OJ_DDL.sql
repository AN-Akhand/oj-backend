create sequence CONTEST_SEQ;


create sequence BLOG_SEQ;


create sequence SUB_SEQ;

create sequence COMMENT_SEQ;


create table USERS
(
    HANDLE        VARCHAR2(10)  not null
        constraint USER_PK
            primary key,
    NAME          VARCHAR2(255) not null,
    PASSWORD      VARCHAR2(255) not null,
    JOIN_DATE     DATE   default SYSDATE,
    LAST_LOGIN    DATE   default SYSDATE,
    GLOBAL_RATING NUMBER default 0,
    EMAIL         VARCHAR2(255),
    COUNTRY       VARCHAR2(60),
    INSTITUTE     VARCHAR2(255)
);

create table CONTESTS
(
    CONTEST_ID NUMBER        not null
        constraint CONTEST_PK
            primary key,
    TITLE      VARCHAR2(255) not null
        unique,
    MIN_RATING NUMBER,
    MAX_RATING NUMBER,
    HANDLE     VARCHAR2(10)
        constraint C_U_FK
            references USERS,
    START_TIME NUMBER,
    END_TIME   NUMBER
);

create table PROBLEMS
(
    PROBLEM_ID   VARCHAR2(1)  not null,
    TIME_LIMIT   NUMBER       not null,
    MEMORY_LIMIT NUMBER       not null,
    CATEGORIES   VARCHAR2(100),
    CONTEST_ID   NUMBER       not null
        constraint P_C_FK
            references CONTESTS,
    HANDLE       VARCHAR2(10) not null
        constraint P_U_FK
            references USERS,
    TRIES        NUMBER default 0,
    DIFFICULTY   NUMBER,
    NAME         VARCHAR2(50),
    SOLVES       NUMBER default 0,
    constraint PROBLEM_PK
        primary key (CONTEST_ID, PROBLEM_ID)
);

create table STANDINGS
(
    CONTEST_ID    NUMBER       not null
        constraint PAR_C_FK
            references CONTESTS,
    HANDLE        VARCHAR2(10) not null
        constraint PAR_U_FK
            references USERS,
    AC_PROBLEMS   NUMBER default 0,
    PENALTY       NUMBER default 0,
    WRONG_SUBS    NUMBER default 0,
    RATING_CHANGE NUMBER,
    constraint PARTICIPATION_PK
        primary key (HANDLE, CONTEST_ID)
);

create table SUBMISSIONS
(
    HANDLE         VARCHAR2(10) not null
        constraint S_U_FK
            references USERS,
    PROBLEM_ID     VARCHAR2(1)  not null,
    CONTEST_ID     NUMBER       not null,
    SUBMISSION_ID  NUMBER       not null
        constraint SUBMISSION_PK
            primary key,
    TIME           NUMBER,
    MEMORY         NUMBER,
    SUB_TIME       NUMBER,
    VERDICT        VARCHAR2(30),
    VERDICT_DETAIL VARCHAR2(2000),
    constraint S_P_FK
        foreign key (CONTEST_ID, PROBLEM_ID) references PROBLEMS
);

create table BLOGS
(
    HANDLE       VARCHAR2(10)   not null
        constraint B_U_FK
            references USERS,
    BLOG_ID      NUMBER         not null
        constraint BLOG_PK
            primary key,
    DATA         VARCHAR2(4000) not null,
    CATEGORY     VARCHAR2(100),
    PUBLISH_DATE NUMBER,
    TITLE        VARCHAR2(100)
);

create table TUTORIALS
(
    BLOG_ID    NUMBER      not null
        constraint TUTORIAL_PK
            primary key
        constraint T_B_FK
            references BLOGS
                on delete cascade,
    CONTEST_ID NUMBER      not null,
    PROBLEM_ID VARCHAR2(1) not null,
    constraint T_P_FK
        foreign key (CONTEST_ID, PROBLEM_ID) references PROBLEMS
);

create table ANNOUNCEMENTS
(
    BLOG_ID    NUMBER not null
        constraint A_B_FK
            references BLOGS
                on delete cascade,
    CONTEST_ID NUMBER not null
);

create table COMMENTS
(
    COMMENT_ID NUMBER       not null
        constraint COMMENT_PK
            primary key,
    BLOG_ID    NUMBER       not null
        constraint COM_B_FK
            references BLOGS
                on delete cascade,
    HANDLE     VARCHAR2(10) not null
        constraint COM_U_FK
            references USERS,
    DATA       VARCHAR2(100),
    TIME       NUMBER
);

create or replace PROCEDURE insert_contest(start_time IN NUMBER, end_time IN NUMBER, handle IN VARCHAR2, title IN VARCHAR2, id OUT NUMBER)
IS
BEGIN
id := contest_seq.nextval;
INSERT INTO contests(contest_id, start_time, end_time, handle, title) VALUES(id, start_time, end_time, handle, title);
END;
/

create or replace PROCEDURE insert_blog(handle IN VARCHAR2, data IN VARCHAR2, publishDate IN NUMBER, title IN VARCHAR2, id OUT NUMBER)
IS
BEGIN
id := blog_seq.nextval;
INSERT INTO blogs(blog_id, handle, data, publish_date, title) VALUES(id, handle, data, publishDate, title);
END;
/

create or replace PROCEDURE insert_sub(handle IN VARCHAR2, contestId IN NUMBER, problemId IN VARCHAR2, subTime IN VARCHAR2, id OUT NUMBER)
IS
BEGIN
id := sub_seq.nextval;
INSERT INTO submissions(handle, contest_id, problem_id, submission_id, sub_time, verdict) VALUES(handle, contestId, problemId, id, subTime, 'testing');
END;
/

create or replace PROCEDURE update_rating(contestId IN NUMBER)
IS
BEGIN
UPDATE STANDINGS SET RATING_CHANGE = ROUND(AC_PROBLEMS * 50 - PENALTY) WHERE CONTEST_ID = contestId;
FOR R IN (SELECT HANDLE, RATING_CHANGE DEL_RAT FROM STANDINGS WHERE CONTEST_ID = contestId)
LOOP
UPDATE USERS SET GLOBAL_RATING = GLOBAL_RATING + R.DEL_RAT WHERE HANDLE = R.HANDLE;
END LOOP;
END;
/

create or replace PROCEDURE insert_comment(handle IN VARCHAR2, data IN VARCHAR2, blogId IN NUMBER, time in NUMBER, id out NUMBER)
IS
BEGIN
id := comment_seq.nextval;
INSERT INTO comments(comment_id, blog_id, handle, data, time) values(id, blogId, handle, data, time);
END;
/


create or replace trigger DELETE_PROBLEM
    before delete
    on PROBLEMS
    for each row
DECLARE
blogId NUMBER;
BEGIN
SELECT BLOG_ID INTO blogId FROM TUTORIALS WHERE CONTEST_ID = :old.contest_id AND PROBLEM_ID = :old.problem_id;
DELETE FROM TUTORIALS WHERE BLOG_ID = :old.problem_id;
DELETE FROM BLOGS WHERE BLOG_ID = blogId;
EXCEPTION
WHEN no_data_found THEN
NULL;
END;
/


create or replace trigger DELETE_CONTEST
    before delete
    on CONTESTS
    for each row
DECLARE
blogId NUMBER;
BEGIN
FOR r IN (SELECT PROBLEM_ID FROM PROBLEMS WHERE CONTEST_ID = :old.contest_id)
loop
    DELETE FROM PROBLEMS WHERE CONTEST_ID = :old.contest_id AND PROBLEM_ID = r.problem_id;
end loop;
SELECT BLOG_ID INTO blogId FROM ANNOUNCEMENTS WHERE CONTEST_ID = :old.contest_id;
DELETE FROM ANNOUNCEMENTS WHERE CONTEST_ID = :old.contest_id;
DELETE FROM BLOGS WHERE BLOG_ID = blogId;
EXCEPTION
WHEN no_data_found THEN
NULL;
END;
/