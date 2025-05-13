
-- 회원 관리 테이블
create table tbl_member (
    member_no varchar2(10) primary key, -- yymmdd + lpad를 통해 시퀀스 값을 4자리로 통일 0001, 0098 등등 항상 4자리로 통일
    member_id varchar2(30) unique not null,
    member_pw varchar2(30) not null,
    member_name varchar2(30) not null,
    member_email varchar2(300) unique not null,
    member_phone char(13) not null,
    member_addr varchar2(300) not null,
    member_level number default 3 not null, -- 1: 관리자, 2: 정회원, 3: 준회원
    enroll_date date default sysdate not null
);

-- 회원 번호 생성 시 사용할 시퀀스
create sequence seq_member
maxvalue 9999 -- 1 ~ 9999까지 1씩 증가
CYCLE; -- MAXVALUE에 도달할 경우, 다시 1부터 증가할 수 있도록

INSERT INTO tbl_member VALUES (
TO_CHAR(SYSDATE, 'yymmdd') || lpad(seq_member.nextval, 4, '0'),
'admin',
'1234',
'관리자',
'admin@naver.com',
'010-1234-1234',
'주소1',
1,
sysdate);

commit;

select *from tbl_member;

update tbl_member
   set member_level = 2
 where member_id = 'aaaaaaaa';
 
 commit;
 
 update tbl_member
   set member_addr = '경기'
 where member_id = 'aaaaaaaa';
 
 commit;
 
 select *from tbl_member;
 
 -- 게시판 테이블 생성
 -- on delete cascade 삭제 옵션 : 작성자 회원 정보가 tbl_member에서 delete되면, 해당 회원이 작성한 게시글도 삭제
 create table tbl_notice (
    notice_no varchar2(10) primary key,     -- 게시글 번호
    notice_title varchar2(300) not null,    -- 게시글 제목
    notice_content varchar2(2000) not null, -- 게시글 본문
    notice_writer varchar(10) references tbl_member(member_no) on delete cascade, -- 작성자(회원번호)
    notice_date date default sysdate not null, -- 작성일자
    read_count number default 0                -- 조회수
 );
 
 create sequence seq_notice
 maxvalue 9999
 cycle;
 
 insert into tbl_notice values (
 to_char(sysdate, 'yymmdd') || lpad(seq_notice.nextval, 4, '0'),
 '제목' || seq_notice.currval,
 '내용' || seq_notice.currval,
 '2505070012',
 sysdate,
 default)
 ;
 
 insert into tbl_notice values (
 to_char(sysdate, 'yymmdd') || lpad(seq_notice.nextval, 4, '0'),
 '제목' || seq_notice.currval,
 '내용' || seq_notice.currval,
 '2505070013',
 sysdate,
 default)
 ;
 
 select count(*) from tbl_notice;
 
 commit;
 
 select * from tbl_notice;
 
SELECT NOTICE_TITLE,(SELECT MEMBER_ID FROM TBL_MEMBER wHERE member_no = NOTICE_WRITER) AS NOTICE_WRITER,NOTICE_DATE,READ_COUNT FROM(SELECT ROWNUM RNUM, A.*FROM(SELECT *
              FROM TBL_NOTICE A
             ORDER BY NOTICE_DATE DESC
           ) A
     )
 WHERE RNUM >= 21 AND RNUM <= 30;
 
select count(*)
  from tbl_notice;


 insert into tbl_notice values (
 to_char(sysdate, 'yymmdd') || lpad(seq_notice.nextval, 4, '0'),
 '제목' || seq_notice.currval,
 '내용' || seq_notice.currval,
 '2505070012',
 sysdate,
 default)
 ;
 
 insert into tbl_notice values (
 to_char(sysdate, 'yymmdd') || lpad(seq_notice.nextval, 4, '0'),
 '제목' || seq_notice.currval,
 '내용' || seq_notice.currval,
 '2505070013',
 sysdate,
 default)
 ;
 
 commit;
 
create table tbl_notice_file (
    file_no number primary key, -- 파일 번호
    notice_no varchar2(10) references tbl_notice(notice_no) on delete cascade, -- 어떠한 게시글에 대한 파일인지(게시글 삭제 시, 파일도 삭제)
    file_name varchar2(300),    -- 사용자가 업로드한 파일 명칭
    file_path varchar2(300)    -- 서버내에 중복된 파일명이 존재하지 않도록, 생성한 파일 명칭
);

create sequence seq_notice_file;

commit;

select * from tbl_notice_file;
select * from tbl_notice order by notice_no desc;

delete from tbl_notice_file where file_no=1;
commit;

select notice_title, notice_content, notice_date, read_count, (select member_id from tbl_member where member_no = notice_writer) as notice_writer from tbl_notice where notice_no = 2505080001;

update tbl_notice 
   set notice_writer = '2504300001'
 where notice_no = '2505120226';
 
commit;

----------------------------------------------------------------아래는 게시판 댓글 테이블

CREATE TABLE TBL_NOTICE_COMMENT (
    COMMENT_NO NUMBER PRIMARY KEY, -- 댓글 번호
    COMMENT_WRITER VARCHAR2(10) REFERENCES TBL_MEMBER(MEMBER_NO) ON DELETE CASCADE, -- 작성자(회원번호)
    COMMENT_CONTENT VARCHAR2(300) NOT NULL, -- 댓글 내용
    COMMENT_DATE DATE DEFAULT SYSDATE NOT NULL, -- 댓글 작성일
    NOTICE_REF VARCHAR2(10) REFERENCES TBL_NOTICE(NOTICE_NO) ON DELETE CASCADE -- 게시글 번호(어떤 게시글의 댓글이지 알아야 하므로)
);

CREATE SEQUENCE SEQ_NOTICE_COMMENT;