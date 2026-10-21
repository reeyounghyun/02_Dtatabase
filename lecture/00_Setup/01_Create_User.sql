show databases;

use mysql;

-- 계정 생성
use mysql;
-- 계정 생성은 use DB에서 할 수 있다.
-- (시스템 데이터베이스)
-- 사용자 계정 및 권한, 타임존, 로그 등을 포함한 데이터베이스

 -- 계정 생성 방법
# create user '사용자이름@''접속가능한 위치' identified by '비밀번호'
#  ip 저장, 와일드 카드어느위치에서든 접속을 허용
-- create user  'young'@'localhost' identified by 'young'
create user  'young'@'localhost' identified by 'young';

-- database (Schema)생성
create database menudb;

show databases;

-- 모든 권한 부여
-- 새 계정을 만들었을때 권한이 없어 테이블에 관련된 권한을 만들어 줄수있다.
-- grant all privileges on (권한을줄데이터베이스).(권한을줄데이블). to (권한을줄계정)@'범위';
-- all privileges은 모든권한 부여, select는 원하는 권한을 선택할수 있다.

grant all privileges on menudb.* to 'young'@'localhost';