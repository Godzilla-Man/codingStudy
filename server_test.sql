-- 시스템 계정으로 일반 계정 생성
CREATE USER server_test IDENTIFIED BY 1234;

-- 접속 및 리소스 권한 부여
GRANT CONNECT, RESOURCE TO server_test;


-- server_test 계정
CREATE TABLE TBL_MEMBER (
    MEMBER_NO NUMBER PRIMARY KEY,           -- 회원 번호
    MEMBER_ID VARCHAR2(30) UNIQUE NOT NULL, -- 회원 아이디
    MEMBER_PW VARCHAR2(30) NOT NULL,        -- 회원 비밀번호
    MEMBER_NAME VARCHAR2(30) NOT NULL,       -- 회원 이름
    MEMBER_PHONE CHAR(13) NOT NULL,         -- 회원 전화번호 (- 포함 13자리)
    MEMBER_ADDR VARCHAR2(300) NOT NULL,     -- 회원 주소
    MEMBER_LEVEL NUMBER NOT NULL,           -- 회원 등급(1: 관리자, 2: 정회원, 3:준회원) -- 가입 시, 준회원
    ENROLL_DATE DATE NOT NULL               -- 회원가입일
);

-- 회원번호 삽입 시, 사용될 시퀀스 객체
CREATE SEQUENCE SEQ_MEMBER;


-- 관리자 
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'admin', '1234', '관리자', '010-1234-5678', '서울시 강남구 역삼동', 1, sysdate);

-- 정회원
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user01', '1234', '유저1', '010-1234-5678', '서울시 강남구 삼성동', 2, sysdate);
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user02', '1234', '유저2', '010-1234-5678', '서울시 강남구 논현동', 2, sysdate);

-- 준회원
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user03', '1234', '유저3', '010-1234-5678', '서울시 서초구 반포동', 3, sysdate);
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user04', '1234', '유저4', '010-1234-5678', '서울시 영등포구 문래동', 3, sysdate);
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user05', '1234', '유저5', '010-1234-5678', '서울시 강남구 압구정동', 3, sysdate);

commit;

select *
  from  tbl_member;
  
