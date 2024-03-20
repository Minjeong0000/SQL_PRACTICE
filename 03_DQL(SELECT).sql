--DQL == DATA QUERY LANGUAGES(SELECT)

/*
<SELECT>��
    [����]
       (��ȸ)SELECT �÷�, �÷�, �÷�, ....
             FROM ���̺���;
        
    -�����͸� ��ȸ�� �� ���
    -SELECT�� ���� ���� ����� RESULT SET �̶�� �Ѵ�.(�ܼ�â?�� ���� ���)
    -��ȸ�Ϸ��� Į���� �ݵ�� FROM���� ����� ���̺��� �����ؾ��Ѵ�.
*/
--EMPLOYEE ���̺����� EMP_ID, EMP_NAME ��ȸ
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE;
--EMPLOYEE ���̺����� �����ȣ, �����, �̸���, �޿���ȸ

SELECT EMP_ID, EMP_NAME,EMAIL,SALARY
FROM EMPLOYEE;

--EMPLOYEE ���̺����� ��ü ����� ��� �÷�(*)���� ��ȸ
SELECT*
FROM EMPLOYEE;
--DB������ ��ҹ��� ������ ����.

/*
<�������>
    SELECT���� Į���� �Է� �κп��� ��� ������ �� �� �ִ�.
*/


--�����, ����(����*12) ��ȸ
SELECT EMP_NAME, SALARY*12
FROM EMPLOYEE;

--������, ����, ���ʽ�,���ʽ��� ���Ե� ����((�޿�+(�޿�+���ʽ�))*12)��ȸ
--������� �� NULL���� ������ ���, ������� ������ NULL
SELECT EMP_NAME, SALARY*12, BONUS, (SALARY+ (SALARY*BONUS))*12
FROM EMPLOYEE;

--������,�Ի���,�ٹ��ϼ�(���ó�¥-�Ի���)SYSDATE : ����ð�
SELECT EMP_NAME, HIRE_DATE,FLOOR(SYSDATE- HIRE_DATE) AS "�ٹ��ϼ�"
FROM EMPLOYEE;

/*
<Į������ ��Ī ����>
    [����]
        Į���� AS ��Ī
        Į���� AS "��Ī"
        Į���� ��Ī
        Į���� "��Ī"
        
        -��Ī ������ ����, Ư�����ڰ� ���Ե� ��� �ݵ�� ū����ǥ�� ���ξ� �Ѵ�.
        -�־�? ���� �������
        -��� ���� : ������� ������ ���� Į������ �������� �� ���, ����ϰ� �ۼ��ϱ� ����
    
*/
/*
<���ͷ�>
    SELECT ���� ���ͷ�(�� ��ü)�� ����ϸ� ���̺��� �����ϴ� ������ó�� ��ȸ�� �����ϴ�.
    ���ͷ��� RESULT SET �� ��� �࿡ �ݺ������� ��µȴ�.

*/
SELECT EMP_NAME, SALARY AS �޿�, '����(��)' AS �޿�����
FROM EMPLOYEE;


/*
    <DISTINCT>: �ߺ� ����
        Į���� ���Ե� �ߺ� ���� �ѹ����� ǥ��
        SELECT ���� �ѹ��� ��� ����
        ������ Į���� ������� �ϸ� ��� Į���� �ߺ��Ǿ�� �����Ѵ�.
*/

-- �����ڵ� ��ȸ.�ߺ�����
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

--�����ڵ�, �μ��ڵ� ��ȸ
SELECT DISTINCT JOB_CODE, DEPT_CODE
FROM EMPLOYEE;

/*
    <���� ������> : ||
        ���� Į�� ���� �ϳ��� �÷��� ��ó�� �����ϰų�,
        Į���� ���ͷ��� ������ �� �ִ�.

*/
--���, �����, �޿� �����ؼ� ��ȸ
SELECT EMP_ID||EMP_NAME||'�� ������' ||SALARY||'�� �Դϴ�.' AS "��� ���� �� �޿�"
FROM EMPLOYEE;

------------------------------------------------------

/*

    <WHERE ��>
        [����]
            SELECT Į��, Į��, ..., Į��
              FROM ���̺���
             WHERE ���ǽ�;
             
        - ��ȸ�ϰ��� �ϴ� ���̺����� �ش� ���ǿ� �����ϴ� ������� ��ȸ�ϰ��� �� �� ����Ѵ�.
        - ���ǽĿ��� �پ��� �����ڵ��� ����� �� �ִ�.
        
    <�� ������>
        >, <, >=, <= : ��� ��
        =            : ���� ��
        !=, ^=, <>   : ���� �ʴ�
*/
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID =210;



-- �μ� �ڵ尡 D9�� ��ġ�ϴ� ������� ��� �÷� ���� ��ȸ
-- �μ� �ڵ尡 D9�� �ƴ� ������� ���, �����, �μ� �ڵ� ��ȸ
-- �޿��� 400���� �̻��� �������� ������, �μ� �ڵ�, �޿� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

SELECT EMP_NAME, EMP_ID, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;


-- �ǽ�����
--1. ������ Į������ 'N' �� ������� ���,�̸�,�Ի��� ��ȸ
--2. ������ 5000���� �̻��� ������ ���,�̸�,���� ��ȸ

SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N';

SELECT EMP_ID, EMP_NAME, SALARY*12 AS ����
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;
/*
    <���� ������>
        AND 
        OR 
        NOT
*/
--�μ� �ڵ尡 D6�̸鼭 �޿��� 300���� �̻��� �������� ��� �÷� ��ȸ

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' AND SALARY >= 3000000;

--�޿��� 400���� �̻�, ���� �ڵ尡 J2�� ����� ��� �÷� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE ='J2' AND SALARY >= 4000000;

--�μ��ڵ尡 D6�̰ų� D2�� �ش��ϴ� �������� ��� Į�� ��ȸ

SELECT*
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' 
OR DEPT_CODE = 'D2';

--�޿��� 350 ������ �̻�, 600���� ������ ������ �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >=3500000 AND SALARY <=6000000;

/*
    <BETWEEN AND>
        [����]
            WHERE �񱳴���÷� BETWEEN A AND B
            - A~B����
            
        - WHERE ������ ���Ǵ� �������� ������ ���� ������ ������ �� ����Ѵ�.
        - �񱳴���÷� ���� ���Ѱ� �̻��̰�, ���Ѱ� ������ ��� TRUE�� �����Ѵ�.
*/

--�޿��� 350 ������ �̻�, 600���� ������ ������ �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

--�޿��� 350 ���� �̻�, 600���� ���ϰ� �ƴ� ������ �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;

--�Ի��� '90/01/01'~ '01/01/01'�� ����� ��� Į�� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

/*
    <LIKE>
        [����]
            WHERE �񱳴��Į�� LIKE 'Ư�� ����';
            
        - ���Ϸ��� Į�� ���� ������ Ư�� ���Ͽ� ������ ��� TRUE�� �����Ѵ�.
        - Ư�� ���Ͽ��� '%', '_'�� ���ϵ�ī��� ����� �� �ִ�.
          '%' : 0���� �̻�
            ex) �񱳴��Į�� LIKE '����%'  => �񱳴��Į�� �� �߿� '����'�� �����ϴ� ��� ���� ��ȸ�Ѵ�.
                �񱳴��Į�� LIKE '%����'  => �񱳴��Į�� �� �߿� '����'�� ������ ��� ���� ��ȸ�Ѵ�.
                �񱳴��Į�� LIKE '%����%' => �񱳴��Į�� �� �߿� '����'�� ���ԵǾ� �ִ� ��� ���� ��ȸ�Ѵ�.
                
          '_' : 1����
            ex) �񱳴��Į�� LIKE '_����'  => �񱳴��Į�� �� �߿� '����'�տ� ������ �� ���ڰ� ���� ��� ���� ��ȸ�Ѵ�.
                �񱳴��Į�� LIKE '__����' => �񱳴��Į�� �� �߿� '����'�տ� ������ �� ���ڰ� ���� ��� ���� ��ȸ�Ѵ�.
*/

--���� ������ ����� ��� Į�� ��ȸ
SELECT*
FROM EMPLOYEE
WHERE EMP_NAME LIKE'��%';

--�̸� �� '��'�� ���Ե� ����� ��� Į�� ��ȸ
SELECT*
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

--��ȭ��ȣ 4��° �ڸ��� 9�� �����ϴ� ����� �����,��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___9%';

--�̸��� �� �� ���ڰ� 3�ڸ��� �̸��� �ּҸ� ���� ����� ���, �����,�̸��� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '___a_%'ESCAPE'a';--Ư���ѹ��ڷ� �����=>ESCAPE
-----------�ǽ� ����-----------------
--��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�,��ȭ��ȣ ��ȸ
--�ؿܿ����ο� ���� ��� �÷� ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%'
;

SELECT *
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D5'
OR DEPT_CODE = 'D6'
OR DEPT_CODE = 'D7'
;

/*
    <IS NULL / IS NOT NULL>
        [����]
            WHERE �񱳴��Į�� IS [NOT] NULL;
            
        - Į�� ���� NULL�� ���� ��� NULL �� �񱳿� ���ȴ�.
          IS NULL : �񱳴��Į�� ���� NULL�� ��� TRUE�� �����Ѵ�.
          IS NOT NULL : �񱳴��Į�� ���� NULL�� �ƴ� ��� TRUE �����Ѵ�.
*/  

--���ʽ��� ���� �ʴ� ����� ��� Į�� ��ȸ
SELECT*
FROM EMPLOYEE
WHERE BONUS IS NULL;

--�μ��� ���� ����� ��� Į�� ��ȸ
SELECT*
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

--�μ��� �ְ�, ���ʽ� ���� �ʴ� ����� ��� Į�� ��ȸ
SELECT*
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
AND BONUS IS NULL;

/*

 <IN>
        [����]
            WHERE �񱳴��Į�� IN('��', '��', '��', ..., '��');
        
        - �� ��� �߿� ��ġ�ϴ� ���� ���� �� TRUE �����Ѵ�.
*/

--�ؿܿ����ο� ���� ��� �÷� ��ȸ
SELECT *
FROM EMPLOYEE 
WHERE DEPT_CODE IN('D5','D6','D7')
;

--�����ڵ尡 J2,J3,J4�� �ش��ϴ� ��� ��� ��ȸ
SELECT*
FROM EMPLOYEE
WHERE JOB_CODE IN ('J2','J3','J4');

/*
    <������ �켱����>
        0. ()
        1. ��� ������
        2. ���� ������
        3. �� ������
        4. IS NULL, LIKE, IN
        5. BETWEEN AND
        6. ���� ������ - NOT
        7. ���� ������ - AND
        8. ���� ������ - OR
*/
/*
    <ORDER BY>���� ��ȸ�� ����� ������ �ű� ��
        [����]
            SELECT Į��, Į��, ..., Į��
              FROM ���̺���
             WHERE ���ǽ�
          ORDER BY ���Ľ�Ű���� �ϴ� Į����|��Ī|Į�� ���� [ASC|DESC] [NULLS FIRST | NULLS LAST];
          
        - SELECT ������ ���� �������� �����ϴ� �������� ���� ���� ���� �������� ����ȴ�.
        - ASC : ������������ �����Ѵ�. (ASC �Ǵ� DESC ���� �� �⺻��)
        - DESC : ������������ �����Ѵ�.���������� ���������� 
        - NULLS FIRST : �����ϰ��� �ϴ� Į�� ���� NULL�� �ִ� ��� �ش� ������ ���� �� ������ �����Ѵ�.
        - NULLS LAST : �����ϰ��� �ϴ� Į�� ���� NULL�� �ִ� ��� �ش� ������ ���� �� �ڷ� �����Ѵ�.
*/
--�޿� ���� ����
SELECT *
FROM EMPLOYEE
ORDER BY SALARY DESC
;

--���ʽ� ���� ����
SELECT EMP_NAME, BONUS
FROM EMPLOYEE
ORDER BY BONUS DESC NULLS FIRST--NULL���� �⺻���� ���� ��
;