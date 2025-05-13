
-- ȸ�� ���� ���̺�
create table tbl_member (
    member_no varchar2(10) primary key, -- yymmdd + lpad�� ���� ������ ���� 4�ڸ��� ���� 0001, 0098 ��� �׻� 4�ڸ��� ����
    member_id varchar2(30) unique not null,
    member_pw varchar2(30) not null,
    member_name varchar2(30) not null,
    member_email varchar2(300) unique not null,
    member_phone char(13) not null,
    member_addr varchar2(300) not null,
    member_level number default 3 not null, -- 1: ������, 2: ��ȸ��, 3: ��ȸ��
    enroll_date date default sysdate not null
);

-- ȸ�� ��ȣ ���� �� ����� ������
create sequence seq_member
maxvalue 9999 -- 1 ~ 9999���� 1�� ����
CYCLE; -- MAXVALUE�� ������ ���, �ٽ� 1���� ������ �� �ֵ���

INSERT INTO tbl_member VALUES (
TO_CHAR(SYSDATE, 'yymmdd') || lpad(seq_member.nextval, 4, '0'),
'admin',
'1234',
'������',
'admin@naver.com',
'010-1234-1234',
'�ּ�1',
1,
sysdate);

commit;

select *from tbl_member;

update tbl_member
   set member_level = 2
 where member_id = 'aaaaaaaa';
 
 commit;
 
 update tbl_member
   set member_addr = '���'
 where member_id = 'aaaaaaaa';
 
 commit;
 
 select *from tbl_member;
 
 -- �Խ��� ���̺� ����
 -- on delete cascade ���� �ɼ� : �ۼ��� ȸ�� ������ tbl_member���� delete�Ǹ�, �ش� ȸ���� �ۼ��� �Խñ۵� ����
 create table tbl_notice (
    notice_no varchar2(10) primary key,     -- �Խñ� ��ȣ
    notice_title varchar2(300) not null,    -- �Խñ� ����
    notice_content varchar2(2000) not null, -- �Խñ� ����
    notice_writer varchar(10) references tbl_member(member_no) on delete cascade, -- �ۼ���(ȸ����ȣ)
    notice_date date default sysdate not null, -- �ۼ�����
    read_count number default 0                -- ��ȸ��
 );
 
 create sequence seq_notice
 maxvalue 9999
 cycle;
 
 insert into tbl_notice values (
 to_char(sysdate, 'yymmdd') || lpad(seq_notice.nextval, 4, '0'),
 '����' || seq_notice.currval,
 '����' || seq_notice.currval,
 '2505070012',
 sysdate,
 default)
 ;
 
 insert into tbl_notice values (
 to_char(sysdate, 'yymmdd') || lpad(seq_notice.nextval, 4, '0'),
 '����' || seq_notice.currval,
 '����' || seq_notice.currval,
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
 '����' || seq_notice.currval,
 '����' || seq_notice.currval,
 '2505070012',
 sysdate,
 default)
 ;
 
 insert into tbl_notice values (
 to_char(sysdate, 'yymmdd') || lpad(seq_notice.nextval, 4, '0'),
 '����' || seq_notice.currval,
 '����' || seq_notice.currval,
 '2505070013',
 sysdate,
 default)
 ;
 
 commit;
 
create table tbl_notice_file (
    file_no number primary key, -- ���� ��ȣ
    notice_no varchar2(10) references tbl_notice(notice_no) on delete cascade, -- ��� �Խñۿ� ���� ��������(�Խñ� ���� ��, ���ϵ� ����)
    file_name varchar2(300),    -- ����ڰ� ���ε��� ���� ��Ī
    file_path varchar2(300)    -- �������� �ߺ��� ���ϸ��� �������� �ʵ���, ������ ���� ��Ī
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

----------------------------------------------------------------�Ʒ��� �Խ��� ��� ���̺�

CREATE TABLE TBL_NOTICE_COMMENT (
    COMMENT_NO NUMBER PRIMARY KEY, -- ��� ��ȣ
    COMMENT_WRITER VARCHAR2(10) REFERENCES TBL_MEMBER(MEMBER_NO) ON DELETE CASCADE, -- �ۼ���(ȸ����ȣ)
    COMMENT_CONTENT VARCHAR2(300) NOT NULL, -- ��� ����
    COMMENT_DATE DATE DEFAULT SYSDATE NOT NULL, -- ��� �ۼ���
    NOTICE_REF VARCHAR2(10) REFERENCES TBL_NOTICE(NOTICE_NO) ON DELETE CASCADE -- �Խñ� ��ȣ(� �Խñ��� ������� �˾ƾ� �ϹǷ�)
);

CREATE SEQUENCE SEQ_NOTICE_COMMENT;