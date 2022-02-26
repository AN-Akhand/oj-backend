-- Users
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('nafee', 'Mohammad Abrar Nafee Akhand', '$2b$10$gb/D7FoeIlS3yxat36qNZ.dNHoVqNGJZFoeck5S7WEcco/dekLm5.', TO_DATE('2022-02-08 22:51:25', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-24 05:34:52', 'YYYY-MM-DD HH24:MI:SS'), 1757, 'nafee@gmail.com', 'Bangladesh', 'School');
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('mjk', 'MJK Sabit', '$2b$10$xHQyljXze8pbCy/26utfNuUShDqtaHQ5843JgcN0J43pgJihSyrAy', TO_DATE('2022-02-23 07:40:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-23 07:43:27', 'YYYY-MM-DD HH24:MI:SS'), 1700, 'sabit@mjk.com', 'BD', 'BUET');
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('sa01', 'Sk Sabit', '$2b$10$odubYiDjR7v51jzgRlYrD.Ob/Dc5ZDjB.wCG6B1ybpDt3Rf/.Q94m', TO_DATE('2022-02-23 09:32:14', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-23 09:32:25', 'YYYY-MM-DD HH24:MI:SS'), 2100, 'sk@sabit.com', 'BD', 'BUET');
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('rony', 'Ismail Rony', '$2b$10$d8ABGhYSOlzIR0Zs8Ahi7.yP2tefbSpd4RQyD7G4DiqC8l1mYDdKi', TO_DATE('2022-02-09 11:26:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-09 11:26:44', 'YYYY-MM-DD HH24:MI:SS'), 1000, null, 'Bangladesh', 'EU');
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('ezmata', 'Mobaswirul Islam', '$2b$10$KYHcEb4D4NpIeIWgZvvax.ZhN8GvDK4v8YKlbNLSD4EYvBGV6cGCm', TO_DATE('2022-02-10 04:09:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-10 04:09:16', 'YYYY-MM-DD HH24:MI:SS'), 1000, null, 'Bangladesh', null);
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('sabit', 'SK Sabit', '$2b$10$pTGIgpdU6RQhcLTuVqDlxedniEs49mMzI4fn69.WRqPeCFP/no/GG', TO_DATE('2022-02-24 02:15:32', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-24 02:15:39', 'YYYY-MM-DD HH24:MI:SS'), 0, 'nafee@gmail.com', 'Bangladesh', 'BUET');
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('shafi', 'Mobaswir Shafi', '$2b$10$YDcnHu4AuCp1OnRosZ8nmO9jLC.UnAp6PcjK/YP.42ZE9WLh78gs6', TO_DATE('2022-02-21 03:11:02', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-24 05:35:43', 'YYYY-MM-DD HH24:MI:SS'), 1106, 'ezmata101@gmail.com', 'Bangladesh', 'inst');
INSERT INTO C##OJ.USERS (HANDLE, NAME, PASSWORD, JOIN_DATE, LAST_LOGIN, GLOBAL_RATING, EMAIL, COUNTRY, INSTITUTE) VALUES ('red1', 'Redwanul Karim', '$2b$10$LHHwIm1TYgqVh9EQBz5f8u8/80pPjFUIGHkR3o.c1atkiVzZfCmXa', TO_DATE('2022-02-23 02:30:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-02-24 05:37:14', 'YYYY-MM-DD HH24:MI:SS'), 2268, 'red1@red.com', 'BD', 'BUET');


-- CONTESTS
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (242, 'Demo Contest 2', null, null, 'nafee', 1645724760000, 1645725360000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (241, 'Demo Contest 1', null, null, 'nafee', 1645724700000, 1645725300000);


-- BLOGS
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('shafi', 264, 'A Bishop moves diagonally :)', null, 1645725289332, 'Bishops in King');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('red1', 263, '# ONLINE JUDGE' || chr(13)||chr(10) || '### welcome', null, 1645725240400, 'Online Judge');


-- ANNOUNCEMENTS


-- PROBLEMS
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 241, 'nafee', 2, 1000, 'Bishop and King', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'Ad Hoc/Brute Force', 241, 'nafee', 3, 1000, 'Chessboard and Queens', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'BFS/DFS/SSSP/Dijkstra', 241, 'nafee', 2, 1200, 'Shortest Routes I', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'DP', 242, 'nafee', 2, 1500, 'Edit Distance', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'APSP/SSSP/Dijkstra/DFS/BFS', 242, 'nafee', 3, 1600, 'Shortest Routes II', 2);


-- TUTORIAL
INSERT INTO C##OJ.TUTORIALS (BLOG_ID, CONTEST_ID, PROBLEM_ID) VALUES (264, 241, '1');

-- SUBMISSIONS
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 241, 201, null, null, 1645724863917, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 241, 202, null, null, 1645724888788, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 241, 203, null, null, 1645724906085, 'Compilation Error', ',,contests/241/2/submission/203.cpp: In function ''int main()'':' || chr(13)||chr(10) || 'contests/241/2/submission/203.cpp:29:9: error: ''i'' was not declared in this scope' || chr(13)||chr(10) || '   29 |     for(i=0; i<8; i++){' || chr(13)||chr(10) || '      |         ^' || chr(13)||chr(10) || '');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '2', 241, 204, null, null, 1645724918943, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 241, 205, null, null, 1645724932392, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '3', 241, 206, null, null, 1645724948377, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 241, 207, null, null, 1645724976426, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '2', 242, 208, null, null, 1645725007143, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 242, 209, null, null, 1645725022912, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '2', 242, 210, null, null, 1645725054372, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 242, 211, null, null, 1645725077077, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 242, 212, null, null, 1645725107842, 'AC', 'AC');

-- SUBMISSIONS
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (241, 'red1', 3, 106.06125, 1, 44);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (241, 'shafi', 1, 115.7323333333333, 2, -66);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (242, 'red1', 1, 26.4230833333333, 0, 24);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (242, 'shafi', 2, 103.5178333333333, 1, -4);


-- COMMENTS
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (81, 264, 'sabit', 'nice blog, @shafi', 1645725340513);
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (82, 264, 'shafi', 'thanks, @sk', 1645725353560);