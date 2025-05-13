-- �ý��� �������� �Ϲ� ���� ����
CREATE USER server_test IDENTIFIED BY 1234;

-- ���� �� ���ҽ� ���� �ο�
GRANT CONNECT, RESOURCE TO server_test;


-- server_test ����
CREATE TABLE TBL_MEMBER (
    MEMBER_NO NUMBER PRIMARY KEY,           -- ȸ�� ��ȣ
    MEMBER_ID VARCHAR2(30) UNIQUE NOT NULL, -- ȸ�� ���̵�
    MEMBER_PW VARCHAR2(30) NOT NULL,        -- ȸ�� ��й�ȣ
    MEMBER_NAME VARCHAR2(30) NOT NULL,       -- ȸ�� �̸�
    MEMBER_PHONE CHAR(13) NOT NULL,         -- ȸ�� ��ȭ��ȣ (- ���� 13�ڸ�)
    MEMBER_ADDR VARCHAR2(300) NOT NULL,     -- ȸ�� �ּ�
    MEMBER_LEVEL NUMBER NOT NULL,           -- ȸ�� ���(1: ������, 2: ��ȸ��, 3:��ȸ��) -- ���� ��, ��ȸ��
    ENROLL_DATE DATE NOT NULL               -- ȸ��������
);

-- ȸ����ȣ ���� ��, ���� ������ ��ü
CREATE SEQUENCE SEQ_MEMBER;


-- ������ 
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'admin', '1234', '������', '010-1234-5678', '����� ������ ���ﵿ', 1, sysdate);

-- ��ȸ��
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user01', '1234', '����1', '010-1234-5678', '����� ������ �Ｚ��', 2, sysdate);
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user02', '1234', '����2', '010-1234-5678', '����� ������ ������', 2, sysdate);

-- ��ȸ��
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user03', '1234', '����3', '010-1234-5678', '����� ���ʱ� ������', 3, sysdate);
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user04', '1234', '����4', '010-1234-5678', '����� �������� ������', 3, sysdate);
INSERT INTO TBL_MEMBER 
VALUES
(SEQ_MEMBER.NEXTVAL, 'user05', '1234', '����5', '010-1234-5678', '����� ������ �б�����', 3, sysdate);

commit;

select *
  from  tbl_member;
  
