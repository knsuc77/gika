-- select
-- 데이터베이스에 저장된 데이터를 가져오는 명령문

-- select * from 테이블명;

-- emp 테이블
-- empno 사원번호
-- ename 사원이름
-- job 직위
-- mgr 매니저
-- hiredate 입사일
-- sal 월급
-- comm 보너스
-- deptno 부서번호


-- dept 테이블
-- deptno 부서번호
-- dname 부서이름
-- loc 부서위치

-- slagrade 테이블
-- grade 등급
-- losal 최저월급
-- hisal 최고월급



-- 부서의 모든 정보를 가져온다
select * from dept;

-- 사원의 모든 정보를 가져온다
select * from emp;

-- 사원의 이름과 사원번호를 가져온다
select ename, empno from emp;

-- 사원의 이름과 사원번호, 직위, 급여를 가져온다
select ename, empno, job, sal from emp;

-- 부서번호와 부서이름을 가져온다
select deptno, dname from dept;


-- 산술연산자
-- 각 사원들의 급여액과 급여액에서 1000을 더한값, 200을 뺀값, 
-- 2를 곱한값, 2로 나눈값을 가져온다
select sal, sal + 1000, sal - 200, sal * 2, sal / 2
from emp;

-- 각 사원의 급여, 커미션, 급여 + 커미션을 가져온다
select sal, comm, sal + comm from emp;
-- nvl() 값이 null 이면 0으로 변환
select sal, nvl(comm, 0), sal + nvl(comm, 0) from emp;

-- null값은 할당될수없는, 적용할수없는, 활용할수없는, 알수없는 값을 의미
-- 0이나 공백을 의미하는것과 다르다



-- 연결연산자
select ename || '사원의 담당 업무는 ' || job || ' 입니다' from emp;


-- 조건절 where
-- 어떤 조건에 맞는 레코드에 대해서만 작업을 하고 싶을때 조건절을 사용한다

-- 근무부서가 10번인 사원들의 사원번호, 이름, 근무부서를 가져온다
select empno, ename, deptno from emp where deptno = 10;

-- 근무부서가 10번이 아닌 사원들의 사원번호, 이름, 근무부서를 가져온다
select empno, ename, deptno from emp where deptno <> 10;

-- 급여가 1500 이상인 사원들의 사원번호, 이름, 급여를 가져온다
select empno, ename, sal from emp where sal >= 1500;

-- 이름이 scott 사원의 사원번호, 이름, 직위, 급여를 가져온다
select empno, ename, job, sal from emp where ename = 'SCOTT';

-- 직위가 salesman인 사원의 사원번호, 이름, 직위를 가져온다
select empno, ename, job from emp where job = 'SALESMAN';

-- 직위가 clerk이 아닌 사원의 사원번호, 이름, 직위를 가져온다
select empno, ename, job from emp where job <> 'CLERK';

-- 1982년 1월 1일 이후에 입사한 사원의 사원번호, 이름, 입사일을 가져온다
select empno, ename, hiredate from emp where hiredate >= '1982-1-1';

-- 10번 부서에서 근무하고 직위가 MANAGER인 사원의 사원번호, 이름, 근무부서, 직위를 가져온다
select empno, ename, deptno, job from emp where deptno = 10 and job = 'MANAGER';

-- 입사년도가 1981년인 사원중에 급여가 1500이상인 사원의 사원번호, 이름, 급여, 입사일을 가져온다
select empno, ename, sal, hiredate from emp
where hiredate >= '1981-1-1' and hiredate <= '1981-12-31' and sal >= 1500;
-- between
select empno, ename, sal, hiredate from emp
where hiredate between '1981-1-1' and '1981-12-31' and sal >= 1500;

-- 20번부서에 근무하고 있는 사원중에 급여가 1500이상인 사원의 사원번호, 이름, 부서번호, 급여를 가져온다
select empno, ename, deptno, sal from emp where deptno = 20 and sal >= 1500; 

-- 직속상관 사원번호가 7698인 사원중에 직위가 CLERK인 사원의 사원번호, 이름, 직속상관번호, 직위를 가져온다
select empno, ename, mgr, job from emp where mgr = 7698 and job = 'CLERK';

-- 급여가 2000보다 크거나 1000보다 작은 사원의 사원번호, 이름, 급여를 가져온다
select empno, ename, sal from emp where sal > 2000 or sal < 1000;
select empno, ename, sal from emp where not(sal >= 1000 and sal <= 2000);
select empno, ename, sal from emp where not(sal between 1000 and 2000);

-- 부서번호가 20이거나 30인 사원의 사원번호, 이름, 부서번호를 가져온다
select empno, ename, deptno from emp where deptno = 20 or deptno = 30;

-- 직위가 CLERK, SALESMAN, ANALYST 인 사원의 사원번호, 이름, 직위를 가져온다
select empno, ename, job from emp where job = 'CLERK' or job = 'SALESMAN' or job = 'ANALYST';
-- in
select empno, ename, job from emp where job in ('CLERK', 'SALESMAN', 'ANALYST');

-- 사원번호가 7499, 7566, 7839가 아닌 사원들의 사원번호, 이름을 가져온다
select empno, ename from emp where empno <> 7499 and empno <> 7566 and empno <> 7839;
-- not in
select empno, ename from emp where empno not in (7499, 7566, 7839);
select empno, ename from emp where not(empno in (7499, 7566, 7839));


-- Like 연산자
-- 문자열을 비교하는 연산자
-- % 글자 여러개를 의미한다
-- _ 글자 하나를 의미한다

-- 이름이 F로 시작하는 사원의 이름과 사원번호를 가져온다
select ename, empno from emp where ename like 'F%';

-- 이름이 S로 끝나는 사원의 이름과 사원번호를 가져온다
select ename, empno from emp where ename like '%S';

-- 이름에 A가 포함되어 있는 사원의 이름과 사원번호를 가져온다
select ename, empno from emp where ename like '%A%';

-- 이름의 두번째 글자가 A인 사원의 이름과 사원번호를 가져온다
select ename, empno from emp where ename like '_A%';

-- 이름이 4글자인 사원의 이름과 사원번호를 가져온다
select ename, empno from emp where ename like '____';




-- null 비교
select * from emp;


-- 사원중에 커미션을 받지 않는 사원의 사원번호, 이름, 커미션을 가져온다
select empno, ename, comm from emp where comm is null; -- null 값만 가져온다
select empno, ename, comm from emp where comm is not null; -- null이 아닌 값만 가져온다

-- 회사대표의 이름과 사원번호를 가져온다
select ename, empno from emp where mgr is null;
