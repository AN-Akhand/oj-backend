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
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (143, 'redwan special', null, null, 'red1', 1645562460000, 1645563000000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (167, 'Title66as', null, null, 'nafee', 1645585290048, 1645585320000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (169, 'Title 99', null, null, 'nafee', 1645585290048, 1645585740000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (172, 'Title 90', null, null, 'nafee', 1645585560000, 1645586400000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (181, 'T Contest', null, null, 'nafee', 1645591440000, 1645591616570);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (182, 'Final Test', null, null, 'nafee', 1645592040000, 1645592259562);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (185, 'Test test test', null, null, 'shafi', 1645600001607, 1645600260000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (187, 'New COntest', null, null, 'shafi', 1645600200000, 1645600800000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (141, 'Final Contest', null, null, 'nafee', 1645556700000, 1645557295745);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (226, 'not visible', null, null, 'nafee', 1645659060000, 1645659180000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (227, 'Invisible', null, null, 'nafee', 1645659240000, 1645659300000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (129, 'Demo Contest', null, null, 'shafi', 1645407409354, 1645410960000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (183, 'OJ Contest', null, null, 'nafee', 1645599360000, 1645599360000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (221, 'The End Game', null, null, 'nafee', 1645648020000, 1645648020000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (142, 'test contest test', null, null, 'nafee', 1645561500000, 1645562100000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (173, 'Morning Contest', null, null, 'nafee', 1645588800000, 1645589700000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (201, 'Rony Contest', null, null, 'shafi', 1645625220000, 1645625220000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (202, 'Red1 Special', null, null, 'shafi', 1645631100000, 1645631100000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (203, 'demo css contest', null, null, 'red1', 1645631940000, 1645635420000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (204, 'Upcoming contest', null, null, 'red1', 1645635480000, 1645639080000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (222, 'Infinity', null, null, 'nafee', 1645656900000, 1645657800000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (223, 'Infinity War 2', null, null, 'nafee', 1645657200000, 1645657492486);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (161, 'Meo Contest', null, null, 'shafi', 1645574880000, 1645575300000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (162, 'Final Test of a contest', null, null, 'shafi', 1645577100000, 1645577940000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (224, 'Civil War', null, null, 'nafee', 1645657920000, 1645658400000);
INSERT INTO C##OJ.CONTESTS (CONTEST_ID, TITLE, MIN_RATING, MAX_RATING, HANDLE, START_TIME, END_TIME) VALUES (228, 'CPP Special', null, null, 'nafee', 1645659540000, 1645659796913);


-- BLOGS
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('red1', 203, 'The  **queen**  (♕, ♛) is the most powerful  [piece](https://en.wikipedia.org/wiki/Chess_piece "Chess piece")  in the game of  [chess](https://en.wikipedia.org/wiki/Chess "Chess"), able to move any number of squares vertically, horizontally or  [diagonally](https://en.wikipedia.org/wiki/Diagonal "Diagonal"), combining the power of the  [rook](https://en.wikipedia.org/wiki/Rook_(chess) "Rook (chess)")  and  [bishop](https://en.wikipedia.org/wiki/Bishop_(chess) "Bishop (chess)"). Each player starts the game with one queen, placed in the middle of the first  [rank](https://en.wikipedia.org/wiki/Glossary_of_chess#rank "Glossary of chess")  next to the  [king](https://en.wikipedia.org/wiki/King_(chess) "King (chess)"). Because the queen is the strongest piece, a  [pawn](https://en.wikipedia.org/wiki/Pawn_(chess) "Pawn (chess)")  is  [promoted](https://en.wikipedia.org/wiki/Promotion_(chess) "Promotion (chess)")  to a queen in the vast majority of cases.

The predecessor to the queen is the  _ferz_, a weak piece only able to move or capture one step diagonally, originating from the Persian game of  _[shatranj](https://en.wikipedia.org/wiki/Shatranj "Shatranj")_. The modern queen gained its power in the 15th century.

## Placement and movement

The white queen starts on d1, while the black queen starts on d8. With the  [chessboard](https://en.wikipedia.org/wiki/Chessboard "Chessboard")  oriented correctly, the white queen starts on a white square and the black queen starts on a black square—thus the  [mnemonics](https://en.wikipedia.org/wiki/Mnemonic "Mnemonic")  "queen gets her color", "queen on [her] [own] color", or "the dress [queen piece] matches the shoes [square]" (Latin:  _servat rēgīna colōrem_).

The queen can be moved any number of unoccupied squares in a straight line vertically, horizontally, or diagonally, thus combining the moves of the  [rook](https://en.wikipedia.org/wiki/Rook_(chess) "Rook (chess)")  and  [bishop](https://en.wikipedia.org/wiki/Bishop_(chess) "Bishop (chess)"). The queen captures by occupying the square on which an enemy piece sits.

Although both players start with one queen each, a [pawn](https://en.wikipedia.org/wiki/Pawn_(chess) "Pawn (chess)") can be [promoted](https://en.wikipedia.org/wiki/Promotion_(chess) "Promotion (chess)") to any of several types of pieces, including a queen, when the pawn is moved to the player''s furthest rank (the opponent''s first rank). Such a queen created by promotion can be an additional queen, or if the player''s queen has been captured, a replacement queen. Pawn promotion to a queen is colloquially called _queening_, which is by far the most common type of piece a pawn is promoted to due to the relative power of a queen.', null, 1645592056620, 'Chess and Queens');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('sabit', 242, '# Title
## Subtitle

Demo blog', null, 1645647544644, 'Test Blog');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 243, 'The bishop (♗, ♝) is a piece in the game of chess. It moves and captures along diagonals without jumping over intervening pieces. Each player begins the game with two bishops. One starts between the king''s knight and the king, the other between the queen''s knight and the queen. The starting squares are c1 and f1 for White''s bishops, and c8 and f8 for Black''s bishops.

### Placement and movement
The bishop has no restrictions in distance for each move but is limited to diagonal movement. Bishops, like all other pieces except the knight, cannot jump over other pieces. A bishop captures by occupying the square on which an enemy piece sits.

The bishops may be differentiated according to which wing they begin on, e.g. the king''s bishop and queen''s bishop. As a consequence of its diagonal movement, each bishop always remains on either the white or black squares, and so it is also common to refer to them as light-squared or dark-squared bishops.


<a href="https://imgbb.com/"><img src="https://i.ibb.co/Mstf9R5/New-Bitmap-Image.png" alt="New-Bitmap-Image" border="0"></a>

<a href="https://imgbb.com/"><img src="https://i.ibb.co/R9fQmyC/New-Bitmap-Image.png" alt="New-Bitmap-Image" border="0"></a>', null, 1645647651113, 'Bishops in Chess');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 244, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...', null, 1645647757311, 'The End Game');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 249, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...

This contest is rated,
there will be **3 problems** and and **1 hour** to solve them ', null, 1645658989714, 'not visible');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 241, 'The bishop (♗, ♝) is a piece in the game of chess. It moves and captures along diagonals without jumping over intervening pieces. Each player begins the game with two bishops. One starts between the king''s knight and the king, the other between the queen''s knight and the queen. The starting squares are c1 and f1 for White''s bishops, and c8 and f8 for Black''s bishops.

### Placement and movement
The bishop has no restrictions in distance for each move but is limited to diagonal movement. Bishops, like all other pieces except the knight, cannot jump over other pieces. A bishop captures by occupying the square on which an enemy piece sits.

The bishops may be differentiated according to which wing they begin on, e.g. the king''s bishop and queen''s bishop. As a consequence of its diagonal movement, each bishop always remains on either the white or black squares, and so it is also common to refer to them as light-squared or dark-squared bishops.


<a href="https://imgbb.com/"><img src="https://i.ibb.co/Mstf9R5/New-Bitmap-Image.png" alt="New-Bitmap-Image" border="0"></a>

<a href="https://imgbb.com/"><img src="https://i.ibb.co/R9fQmyC/New-Bitmap-Image.png" alt="New-Bitmap-Image" border="0"></a>


', null, 1645643840927, 'Bishops in Chess');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 247, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...

This contest is rated,
there will be **3 problems** and and **1 hour** to solve them ', null, 1645657753770, 'Civil War');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 248, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...

This contest is rated,
there will be **3 problems** and and **1 hour** to solve them ', null, 1645658273453, 'WW III');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 250, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...

This contest is rated,
there will be **3 problems** and and **1 hour** to solve them ', null, 1645659336391, 'CPP Special');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 204, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...', null, 1645599144495, 'OJ Contest');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 245, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...

This contest is rated,
there will be **3 problems** and and **1 hour** to solve them ', null, 1645656719193, 'Infinity');
INSERT INTO C##OJ.BLOGS (HANDLE, BLOG_ID, DATA, CATEGORY, PUBLISH_DATE, TITLE) VALUES ('nafee', 246, '#### Hello Everyone?

So, there is this announcement of a new contest.

You all are invited to participate...

This contest is rated,
there will be **3 problems** and and **1 hour** to solve them ', null, 1645656969273, 'Infinity War 2');


-- ANNOUNCEMENTS
INSERT INTO C##OJ.ANNOUNCEMENTS (BLOG_ID, CONTEST_ID) VALUES (244, 221);
INSERT INTO C##OJ.ANNOUNCEMENTS (BLOG_ID, CONTEST_ID) VALUES (249, 226);
INSERT INTO C##OJ.ANNOUNCEMENTS (BLOG_ID, CONTEST_ID) VALUES (204, 183);
INSERT INTO C##OJ.ANNOUNCEMENTS (BLOG_ID, CONTEST_ID) VALUES (247, 224);
INSERT INTO C##OJ.ANNOUNCEMENTS (BLOG_ID, CONTEST_ID) VALUES (250, 228);
INSERT INTO C##OJ.ANNOUNCEMENTS (BLOG_ID, CONTEST_ID) VALUES (245, 222);
INSERT INTO C##OJ.ANNOUNCEMENTS (BLOG_ID, CONTEST_ID) VALUES (246, 223);


-- PROBLEMS
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 181, 'nafee', 2, 1000, 'Bishop and King', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 182, 'nafee', 1, 1000, 'Bishop and King', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'Ad Hoc', 182, 'nafee', 4, 1000, 'Chessboard and Queens', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'DP/APSP/SSSP/Dijkstra', 182, 'nafee', 4, 1000, 'Shortest Routes I', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('4', 1, 100, null, 182, 'nafee', 0, 1000, 'Shortest Routes II', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc/Brute Force/Greedy', 143, 'red1', 5, 1000, 'Chessboard and Queens', 4);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('5', 1, 100, 'DP', 182, 'nafee', 1, 1000, 'Edit Distance', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, null, 187, 'shafi', 0, 1000, 'Bishop and King', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'Ad Hoc/Brute Force', 201, 'shafi', 2, 1000, 'Chessboard and Queens', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, null, 141, 'nafee', 4, 1000, 'Chessboard and Queens', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, null, 141, 'nafee', 1, 1000, 'Edit Distance', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 221, 'nafee', 3, 1000, 'Chessboard and Queens', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc/Brute Force', 129, 'shafi', 2, 1000, 'Chessboard and Queens', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 183, 'nafee', 1, 1000, 'Bishop and King', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, null, 183, 'nafee', 2, 1000, 'Shortest Routes I', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, null, 227, 'nafee', 0, 1000, 'Shortest Routes I', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'Ad Hoc', 221, 'nafee', 1, 1000, 'Shortest Routes I', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'DP', 221, 'nafee', 1, 1000, 'Edit Distance', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, null, 227, 'nafee', 0, 1000, 'Chessboard and Queens', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, null, 227, 'nafee', 0, 1000, 'Shortest Routes II', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'DP', 142, 'nafee', 0, 1000, 'Edit Distance', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 142, 'nafee', 0, 1000, 'Chessboard and Queens', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'DFS/Dijkstra/SSSP/APSP', 142, 'nafee', 0, 1000, 'Shortest Path I', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'DP', 143, 'red1', 2, 1000, 'Edit Distance', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'DFS/BFS/SSSP/APSP', 143, 'red1', 0, 1000, 'Shortest Path I', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 173, 'nafee', 0, 1000, 'Bishop and King', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'DP/Ad Hoc', 161, 'shafi', 3, 1000, 'Chessboard and Queens', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'DP', 161, 'shafi', 1, 1000, 'Edit Distance', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, null, 161, 'shafi', 0, 1000, 'Shortest Path II', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('4', 1, 100, null, 161, 'shafi', 0, 1000, 'Shortest Path I', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 201, 'shafi', 1, 1000, 'Bishop and King', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'SSSP/APSP/BFS/DFS', 201, 'shafi', 3, 1000, 'Shortest Routes I', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 202, 'shafi', 3, 1000, 'Bishop and King', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'Ad Hoc', 202, 'shafi', 2, 1000, 'Shortest Routes I', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, null, 202, 'shafi', 3, 1000, 'Chessboard and Queens', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'BFS/DFS/Dijkstra/SSSP/APSP', 223, 'nafee', 2, 1000, 'Shortest Routes I', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 223, 'nafee', 2, 1000, 'Chessboard and Queens', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'DP', 223, 'nafee', 1, 1000, 'Edit Distance', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('4', 1, 100, 'APSP', 223, 'nafee', 4, 1000, 'Shortest Routes II', 2);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 224, 'nafee', 2, 1000, 'Chessboard and Queens', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('4', 1, 100, 'SSSP/APSP', 224, 'nafee', 0, 1000, 'Shortest Routes II', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'DP', 224, 'nafee', 0, 1000, 'Edit Distance', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'BFS/DFS/Dijkstra/SSSP', 224, 'nafee', 0, 1000, 'Shortest Routes I', 0);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('3', 1, 100, 'SSSP', 228, 'nafee', 2, 1000, 'Shortest Routes I', 1);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('1', 1, 100, 'Ad Hoc', 228, 'nafee', 3, 1000, 'Chessboard and Queens', 3);
INSERT INTO C##OJ.PROBLEMS (PROBLEM_ID, TIME_LIMIT, MEMORY_LIMIT, CATEGORIES, CONTEST_ID, HANDLE, TRIES, DIFFICULTY, NAME, SOLVES) VALUES ('2', 1, 100, 'DP', 228, 'nafee', 2, 1000, 'Edit Distance', 2);


-- TUTORIAL
INSERT INTO C##OJ.TUTORIALS (BLOG_ID, CONTEST_ID, PROBLEM_ID) VALUES (243, 181, '1');
INSERT INTO C##OJ.TUTORIALS (BLOG_ID, CONTEST_ID, PROBLEM_ID) VALUES (241, 182, '1');


-- SUBMISSIONS
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 181, 122, null, null, 1645591578399, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 181, 121, null, null, 1645591514543, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 182, 123, null, null, 1645592103558, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 182, 124, null, null, 1645592123632, 'Compilation Error', ',,contests/182/2/submission/124.cpp: In function ''int main()'':
contests/182/2/submission/124.cpp:29:9: error: ''i'' was not declared in this scope
   29 |     for(i=0; i<8; i++){
      |         ^
');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '3', 182, 125, null, null, 1645592147506, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 182, 126, null, null, 1645592167638, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '5', 182, 127, null, null, 1645592191393, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '1', 201, 141, null, null, 1645625303496, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 201, 142, null, null, 1645625337734, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '2', 201, 143, null, null, 1645625368162, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 201, 144, null, null, 1645625404108, 'Compilation Error', ',,contests/201/3/submission/144.cpp: In function ''int main()'':
contests/201/3/submission/144.cpp:29:9: error: ''i'' was not declared in this scope
   29 |     for(i=0; i<8; i++){
      |         ^
');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 129, 68, null, null, 1645407789150, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '1', 141, 81, null, null, 1645556850072, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 141, 82, null, null, 1645556893298, 'Compilation Error', ',,contests/141/1/submission/82.cpp: In function ''int main()'':
contests/141/1/submission/82.cpp:29:9: error: ''i'' was not declared in this scope
   29 |     for(i=0; i<8; i++){
      |         ^
');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 141, 83, null, null, 1645556913646, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 141, 84, null, null, 1645557112991, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '2', 141, 85, null, null, 1645557157592, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 129, 67, null, null, 1645407775442, 'Compilation Error', ',,contests/129/1/submission/67.cpp: In function ''int main()'':
contests/129/1/submission/67.cpp:29:9: error: ''i'' was not declared in this scope
   29 |     for(i=0; i<8; i++){
      |         ^
');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '2', 183, 129, null, null, 1645599408373, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 183, 130, null, null, 1645599434066, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('sabit', '2', 182, 161, null, null, 1645647388501, 'Compilation Error', ',,contests/182/2/submission/161.cpp: In function ''int main()'':
contests/182/2/submission/161.cpp:29:9: error: ''i'' was not declared in this scope
   29 |     for(i=0; i<8; i++){
      |         ^
');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('sabit', '2', 182, 162, null, null, 1645647409264, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('sabit', '2', 182, 163, null, null, 1645647434231, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 182, 164, null, null, 1645647918412, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 182, 165, null, null, 1645647947566, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 183, 128, null, null, 1645599372309, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 221, 166, null, null, 1645648064207, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '3', 221, 167, null, null, 1645648081614, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 221, 168, null, null, 1645648137957, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 221, 169, null, null, 1645648152995, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 221, 170, null, null, 1645648178374, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 142, 87, null, null, 1645561732523, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 142, 88, null, null, 1645561868227, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '1', 143, 89, null, null, 1645562483674, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '2', 143, 90, null, null, 1645562537984, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '1', 143, 91, null, null, 1645562586514, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 143, 92, null, null, 1645562683454, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 143, 93, null, null, 1645562703793, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '2', 143, 94, null, null, 1645562753630, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 201, 145, null, null, 1645625427210, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '2', 201, 146, null, null, 1645625454846, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 142, 86, null, null, 1645561552043, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '1', 161, 101, null, null, 1645574944847, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '1', 161, 102, null, null, 1645574978894, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 161, 103, null, null, 1645575196357, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 161, 104, null, null, 1645575236713, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 202, 147, null, null, 1645631137229, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '2', 202, 148, null, null, 1645631154436, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 202, 149, null, null, 1645631170874, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 202, 150, null, null, 1645631219884, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 202, 151, null, null, 1645631255887, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '3', 202, 152, null, null, 1645631272989, 'Compilation Error', ',,contests/202/3/submission/152.cpp: In function ''int main()'':
contests/202/3/submission/152.cpp:29:9: error: ''i'' was not declared in this scope
   29 |     for(i=0; i<8; i++){
      |         ^
');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 129, 66, null, null, 1645407458596, 'Compilation Error', ',,contests/129/1/submission/66.cpp: In function ''int main()'':
contests/129/1/submission/66.cpp:29:9: error: ''i'' was not declared in this scope
   29 |     for(i=0; i<8; i++){
      |         ^
');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('nafee', '3', 202, 153, null, null, 1645631292580, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 202, 154, null, null, 1645631339930, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 143, 155, null, null, 1645631901974, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 223, 171, null, null, 1645657232954, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '3', 223, 172, null, null, 1645657251538, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 223, 173, null, null, 1645657274973, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '3', 223, 174, null, null, 1645657288771, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 223, 175, null, null, 1645657301195, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '4', 223, 176, null, null, 1645657344128, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '4', 223, 177, null, null, 1645657355818, 'TLE', 'TLE on test: 5');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '4', 223, 178, null, null, 1645657374119, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '4', 223, 179, null, null, 1645657394405, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 224, 180, null, null, 1645657957428, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 224, 181, null, null, 1645657979189, 'WA', 'WA on test: 1');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 228, 182, null, null, 1645659568327, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '2', 228, 183, null, null, 1645659590799, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '1', 228, 184, null, null, 1645659612371, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '3', 228, 185, null, null, 1645659647136, 'TLE', 'TLE on test: 6');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '2', 228, 186, null, null, 1645659680076, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('shafi', '1', 228, 187, null, null, 1645659698858, 'AC', 'AC');
INSERT INTO C##OJ.SUBMISSIONS (HANDLE, PROBLEM_ID, CONTEST_ID, SUBMISSION_ID, TIME, MEMORY, SUB_TIME, VERDICT, VERDICT_DETAIL) VALUES ('red1', '3', 228, 188, null, null, 1645659728154, 'AC', 'AC');


-- STANDINGS
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (161, 'nafee', 1, 11.7730952380952, 0, 38);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (161, 'red1', 1, 42.4658333333333, 0, 8);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (181, 'shafi', 1, 6.21191666666667, 0, 44);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (181, 'red1', 1, 11.53325, 0, 38);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (182, 'shafi', 2, 54.97571759259259, 1, 45);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (201, 'nafee', 2, 76.5285, 1, 23);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (129, 'shafi', 1, 44.6517337971738, 0, null);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (141, 'nafee', 1, 5.0024, 0, 45);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (141, 'shafi', 2, 42.5842333333334, 2, 37);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (201, 'red1', 1, 67.2675, 1, -17);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (183, 'shafi', 1, 50.1865, 1, 0);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (202, 'red1', 2, 132.98475, 2, -33);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (221, 'red1', 2, 14.76683333333337, 0, 85);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (224, 'red1', 0, 50, 1, null);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (143, 'nafee', 2, 9.41277777777778, 0, 91);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (143, 'shafi', 2, 99.7613888888889, 1, 0);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (183, 'red1', 0, 0, 0, 0);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (221, 'shafi', 1, 63.1978333333333, 1, -13);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (182, 'red1', 1, 52.95458333333333, 1, -3);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (202, 'nafee', 1, 116.0483333333333, 2, -66);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (223, 'red1', 3, 54.58078787878788, 1, 95);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (223, 'shafi', 2, 103.98318181818182, 2, -4);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (228, 'red1', 3, 27.01189393939395, 0, 123);
INSERT INTO C##OJ.STANDINGS (CONTEST_ID, HANDLE, AC_PROBLEMS, PENALTY, WRONG_SUBS, RATING_CHANGE) VALUES (228, 'shafi', 2, 65.88310606060609, 1, 34);

-- COMMENTS
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (21, 203, 'shafi', 'Good blog', 1645592077292);
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (22, 203, 'red1', 'Thank you', 1645592084503);
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (41, 203, 'shafi', 'Hey there!', 1645625731353);
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (42, 203, 'red1', 'Heiiii!', 1645625745253);
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (62, 242, 'nafee', 'Comment', 1645647573578);
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (23, 203, 'shafi', 'Comment', 1645599237798);
INSERT INTO C##OJ.COMMENTS (COMMENT_ID, BLOG_ID, HANDLE, DATA, TIME) VALUES (61, 241, 'sabit', 'nice blog', 1645647361350);
