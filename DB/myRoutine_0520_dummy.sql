INSERT INTO users (id, email, nickname, password, gender, age, is_public, is_admin, is_expert)
VALUES (1, "woo01@ssafy.com", "관리자1", "1234", "여성", 27, 1, 1, 1),
(2, "hong01@ssafy.com", "관리자2", "1234", "여성", 29, 1, 1, 1);

INSERT INTO users (email, nickname, password, gender, age, is_expert)
VALUES ("dokgo11@ssafy.com", "독고수", "1234", "남성", 45, 1),
("yoga11@ssafy.com", "요가영", "1234", "여성", 36, 1);

INSERT INTO users (email, nickname, password, gender, age)
VALUES ("strong123@ssafy.com", "강해진", "1234", "여성", 27),
("powerful11@ssafy.com", "힘세진", "1234", "남성", 24),
("vally11@ssafy.com", "배구빈", "1234", "여성", 31),
("baseball11@ssafy.com", "야구민", "1234", "남성", 22);

-- delete from users where user_id = 1;
-- ------------------------------------------------------
	SELECT * from users;
-- ------------------------------------------------------

INSERT INTO routines (writer, title, content, part1, part2, workout_time, user_id)
VALUES ("강해진", "평일 3회", "실내 사이클 30분, 땅끄부부 칼소폭 10분, 스쿼트20회 3세트, 스트레칭 10분", "유산소", "전신", 60, 13),
("강해진", "주말 루틴", "실내 사이클 30분, 스쿼트20회 3세트, 런지 20회 3세트, 스트레칭 10분", "유산소", "하체", 60, 13),
("힘세진", "평일 등어깨", "등 어깨 등등 어깨어깨", "등", "어깨", 90, 14);

INSERT INTO routines (writer, title, content, part1, workout_time, user_id)
VALUES ("힘세진", "주말", "상체 하체 럴럴럴", "전신", 120, 14),
("야구민", "주말", "상체 하체 랄랄라", "전신", 120, 16),
("요가영", "주말 전신 순환~", "전신 순환", "전신", 40, 12),
("배구빈", "주말 전신 순환 배구빈", "전신 순환", "전신", 40, 15);

-- ------------------------------------------------------
	SELECT * FROM routines;
    select * from routines where id = 3;
    select * from routines where delete_at is null;
    select * from routines where id = 3 and delete_at is null;
-- ------------------------------------------------------

INSERT INTO questions (writer, title, content, user_id)
VALUES ("익명", "헬스장 초보자 루틴 추천 좀 해주세요!!!!🚨🚨🚨", "헬스 완전 초보라서 루틴 추천 부탁드립니다! 기구사용 아무것도 몰라서 걱정이에요..", 13);

INSERT INTO questions (writer, title, content, user_id, routine_id)
VALUES ("힘세진", "추가로 할 운동 추천해주세요", 
"매일 하는 운동만 해서 아무래도 자극이 잘 오지 않습니다. 
제 루틴에서 다른 운동 좀 추가하고 싶은데,
혹시 추천해주실 분 있으신가요?", 14, 3);

INSERT INTO questions (writer, title, content, user_id)
VALUES ("야구민", "야구보고 헬스", 
"스트레스 지수 높을때 운동해도 됩니까? 살짝 걱정이네요", 16);

INSERT INTO questions (writer, title, content, user_id, routine_id)
VALUES ("힘세진", "등 운동 추천 해주실 분", 
"등 자극 잘오는 운동 추천 해주세요. 지금은 이 루틴으로 하고 있습니다.", 14, 4);

INSERT INTO questions (writer, title, content, user_id)
VALUES ("배구빈", "취미 여자배구팀 질문", 
"여자배구단 취미로 하는 팀에 들어가고싶은데, 혹시 있나요?", 15);

-- ------------------------------------------------------
	select * from questions;
    desc questions;
-- drop TABLE questions;
-- ------------------------------------------------------

INSERT INTO answers (writer, content, question_id, user_id)
VALUES ("독고수", "충분히 잘 하고 계십니다. 세트만 추가해보세요^^", 2, 11),
("요가영", "추가로 요가는 어떠신지요?ㅎㅎ 요가로 전신을 순환시켜 보세요", 2, 12);

-- delete from answers where answer_id in (3, 4); 

-- ------------------------------------------------------
	select * from answers;
-- ------------------------------------------------------

INSERT INTO point (record, amount, user_id)
VALUES ("회원가입 선물", "1000", 13),
("회원가입 선물", "1000", 14),
("회원가입 선물", "1000", 15),
("회원가입 선물", "1000", 16);

INSERT INTO point (record, amount, user_id)
VALUES ("루틴 완료", "100", 13),
("루틴 완료", "100", 14),
("루틴 완료", "100", 15),
("루틴 완료", "100", 16);
-- ------------------------------------------------------
	SELECT * FROM point;
-- ------------------------------------------------------


INSERT INTO mile (record, amount, user_id)
VALUES ("회원가입 선물", "500", 13),
("회원가입 선물", "500", 14),
("회원가입 선물", "500", 15),
("회원가입 선물", "500", 16);

-- ------------------------------------------------------
	SELECT * FROM mile;
-- ------------------------------------------------------


-- SELECT * FROM user_keyword;
-- SELECT * FROM user_routine_box;