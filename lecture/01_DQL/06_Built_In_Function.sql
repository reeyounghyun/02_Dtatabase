-- BUILT-IN FUNCTIONS
-- MySQL이 제공하는 함수로 값을 가공할 때 사용

-- 1. 문자열 관련 함수

-- ASCII(아스키 코드), CHAR(숫자)
-- ASCII: 아스키 코드 값 추출
-- CHAR: 아스키 코드로 문자 추출
SELECT
    ASCII('A'),
    CHAR(65);
-- (Workbench의 버그로 CHAR(65)의 결과가 'BLOB'으로 보일 수 있는데 일반 명령형 모드에서는 정상적으로 'A'로 출력된다.
-- 'BLOB' 글자에서 마우스 오른쪽 버튼 클릭하고 'Open Value in Viewer' 선택 후 Text 탭에서 확인할 수 있다.)

-- BIT_LENGTH(문자열), CHAR_LENGTH(문자열), LENGTH(문자열)
-- BIT_LENGTH: 할당된 비트 크기 반환
-- CHAR_LENGTH: 문자열의 길이 반환
-- LENGTH: 할당된 BYTE 크기 반환
-- [추가 설명] 영어, 숫자, 특수 기호를 제외한 나머지 문자는 모두 3byte 크기가 할당됨.
SELECT
    BIT_LENGTH('pie'),
    CHAR_LENGTH('pie'),
    LENGTH('pie');

SELECT
    menu_name,
    BIT_LENGTH(menu_name),
    CHAR_LENGTH(menu_name),
    LENGTH(menu_name)
FROM
    tbl_menu;


-- CONCAT(문자열1, 문자열2, ...), CONCAT_WS(구분자, 문자열1, 문자열2, ...)
-- CONCAT: 문자열을 이어붙임
-- CONCAT_WS: 구분자와 함께 문자열을 이어붙임
SELECT CONCAT('호랑이', '기린', '토끼');
SELECT CONCAT_WS(',', '호랑이', '기린', '토끼');
SELECT CONCAT_WS('-', '2023', '05', '31');

-- ELT(위치, 문자열1, 문자열2, ...), FIELD(찾을 문자열, 문자열1, 문자열2, ...),
-- FIND_IN_SET(찾을 문자열, 문자열 리스트), INSTR(기준 문자열, 부분 문자열),
-- LOCATE(부분 문자열, 기준 문자열)
-- ELT: 해당 위치의 문자열 반환
-- FIELD: 찾을 문자열 위치 반환
-- FIND_IN_SET: 찾을 문자열의 위치 반환
-- INSTR: 기준 문자열에서 부분 문자열의 시작 위치 반환
-- LOCATE: INSTR과 동일하고 순서는 반대
SELECT
    ELT(2, '사과', '딸기', '바나나'),
    FIELD('딸기', '사과', '딸기', '바나나'),
    FIND_IN_SET('바나나', '사과,딸기,바나나'),
    INSTR('사과딸기바나나', '딸기'),
    LOCATE('딸기', '사과딸기바나나');

-- FORMAT(숫자, 소수점 자릿수)
-- FORMAT: 1000단위마다 콤마(,) 표시를 해 주며 소수점 아래 자릿수(반올림)까지 표현한다.
SELECT FORMAT(123142512521.5635326, 3);

-- BIN(숫자), OCT(숫자), HEX(숫자)
-- BIN: 2진수 표현
-- OCT: 8진수 표현
-- HEX: 16진수 표현
SELECT BIN(65), OCT(65), HEX(65);

-- INSERT(기준 문자열, 위치, 길이, 삽입할 문자열)
-- INSERT: 기준 문자열의 위치부터 길이만큼을 지우고 삽입할 문자열을 끼워 넣는다.
SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');

-- LEFT(문자열, 길이), RIGHT(문자열, 길이)
-- LEFT: 왼쪽에서 문자열의 길이만큼을 반환
-- RIGHT: 오른쪽에서 문자열의 길이만큼을 반환
SELECT LEFT('Hello World!', 3), RIGHT('Hello World!', 3);

-- UPPER(문자열), LOWER(문자열)
-- UPPER: 소문자를 대문자로 변경
-- LOWER: 대문자를 소문자로 변경
SELECT LOWER('Hello World!'), UPPER('Hello World!');

-- LPAD(문자열, 길이, 채울 문자열), RPAD(문자열, 길이, 채울 문자열)
-- LPAD: 문자열을 길이만큼 왼쪽으로 늘린 후에 빈 곳을 문자열로 채운다.
-- RPAD: 문자열을 길이만큼 오른쪽으로 늘린 후에 빈 곳을 문자열로 채운다.
SELECT LPAD('왼쪽', 6, '@'), RPAD('오른쪽', 6 ,'@');

-- LTRIM(문자열), RTRIM(문자열)
-- LTRIM: 왼쪽 공백 제거
-- RTRIM: 오른쪽 공백 제거
SELECT LTRIM('    왼쪽'), RTRIM('오른쪽    ');

-- TRIM(문자열), TRIM(방향 자를_문자열 FROM 문자열)
-- TRIM은 기본적으로 앞뒤 공백을 제거하지만
-- 방향(LEADING(앞), BOTH(양쪽), TRAILING(뒤))이 있으면
-- 해당 방향에 지정한 문자열을 제거할 수 있다.
SELECT TRIM('    MySQL    '), TRIM(BOTH '@' FROM '@@@@MySQL@@@@');

-- REPEAT(문자열, 횟수)
-- REPEAT: 문자열을 횟수만큼 반복
SELECT REPEAT('재밌어', 3);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열)
-- REPLACE: 문자열에서 문자열을 찾아 치환
SELECT REPLACE('마이SQL', '마이', 'My');

-- REVERSE(문자열)
-- REVERSE: 문자열의 순서를 거꾸로 뒤집음
SELECT REVERSE('stressed');

-- SPACE(길이)
-- SPACE: 길이 만큼의 공백을 반환
SELECT CONCAT('제 이름은', SPACE(5), '이고 나이는', SPACE(3), '세입니다.');

-- SUBSTRING(문자열, 시작위치, 길이)
-- SUBSTRING: 시작 위치부터 길이만큼의 문자를 반환(길이를 생략하면 시작 위치부터 끝까지 반환)
SELECT
    SUBSTRING('안녕하세요 반갑습니다.', 7, 2),
    SUBSTRING('안녕하세요 반갑습니다.', 7);

-- SUBSTRING_INDEX(문자열, 구분자, 횟수)
-- SUBSTRING_INDEX: 구분자가 왼쪽부터 횟수 번쨰 나오면 그 이후의 오른쪽은 버린다.
-- 횟수가 음수일 경우 오른쪽부터 세고 왼쪽을 버린다.
SELECT
    SUBSTRING_INDEX('hong.test@gmail.com', '.', 2),
    SUBSTRING_INDEX('hong.test@gmail.com', '.', -2);

-- 2. 수학 관련 함수
-- ABS(숫자)
-- ABS: 절대값 반환
SELECT ABS(-123);

-- CEILING(숫자), FLOOR(숫자), ROUND(숫자)
-- CEILING: 올림값 반환
-- FLOOR: 버림값 반환
-- ROUND: 반올림값 반환
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV(숫자, 원래 진수, 변환할 진수)
-- CONV: 원래 진수에서 변환하고자 하는 진수로 변환
SELECT CONV('A', 16, 10), CONV('A', 16, 2), CONV(1010, 2, 8);

-- MOD(숫자1, 숫자2) 또는 숫자1 % 숫자2 또는 숫자1 MOD 숫자2
-- MOD: 숫자 1을 숫자 2로 나눈 나머지 추출
SELECT MOD(75, 10), 75 % 10, 75 MOD 10;

-- POW(숫자1, 숫자2), SQRT(숫자)
-- POW: 거듭제곱값 추출
-- SQRT: 제곱근을 추출
SELECT POW(2, 4), SQRT(16);

-- RAND()
-- RAND: 0이상 1 미만의 실수를 구한다.
-- 'm <= 임의의 정수 < n'을 구하고 싶다면
-- FLOOR((RAND() * (n - m) + m)을 사용한다.
-- 1부터 10까지 난수 발생: FLOOR(RAND() * (11 - 1) + 1)
SELECT RAND(), FLOOR(RAND() * (11 - 1) + 1);

-- SIGN(숫자)
-- SIGN: 양수면 1, 0이면 0, 음수면 -1을 반환
SELECT SIGN(10.1), SIGN(0), SIGN(-10.1);

-- TRUNCATE(숫자, 정수)
-- TRUNCATE: 소수점을 기준으로 정수 위치까지 구하고 나머지는 버림
SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);

-- 3. 날짜 및 시간 관련 함수
-- ADDDATE(날짜, 차이), SUBDATE(날짜, 차이)
-- ADDDATE: 날짜를 기준으로 차이를 더함
-- SUBDATE: 날짜를 기준으로 날짜를 뺌
SELECT
    ADDDATE('2023-05-31', INTERVAL 30 DAY),
    ADDDATE('2023-05-31', INTERVAL 6 MONTH);

SELECT
    SUBDATE('2023-05-31', INTERVAL 30 DAY),
    SUBDATE('2023-05-31', INTERVAL 6 MONTH);

-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간, 시간)
-- ADDTIME: 날짜 또는 시간을 기준으로 시간을 더함
-- SUBTIME: 날짜 또는 시간을 기준으로 시간을 뺌
SELECT
    ADDTIME('2023-05-31 09:00:00', '1:0:1'),
    SUBTIME('2023-05-31 09:00:00', '1:0:1');

-- CURDATE(), CURTIME(), NOW(), SYSDATE()
-- CURDATE: 현재 연-월-일 추출
-- CURTIME: 현재 시:분:초 추출
-- NOW() 또는 SYSDATE(): 현재 연-월-일 시:분:초 추출
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

-- CURDATE(), CURRENT_DATE(), CURRENT_DATE는 동일
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME(), CURRENT_TIME은 동일
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

-- NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP()는 동일
SELECT NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP();

-- YEAR(날짜), MONTH(날짜), DAY(날짜),
-- HOUR(시간), MINUTE(시간), SECOND(시간), MICROSECOND(시간)
-- 날짜 또는 시간에서 연, 월, 일, 시, 분, 초, 밀리초를 추출
SELECT
    YEAR(CURDATE()),
    MONTH(CURDATE()),
    DAYOFMONTH(CURDATE());

SELECT
    HOUR(CURTIME()),
    MINUTE(CURTIME()),
    SECOND(CURRENT_TIME),
    MICROSECOND(CURRENT_TIME);

-- DATE(), TIME()
-- DATE: 연-월-일만 추출
-- TIME: 시:분:초만 추출
SELECT DATE(NOW()), TIME(NOW());

-- DATEDIFF(날짜1, 날짜2), TIMEDIFF(날짜1 또는 시간1, 날짜1 또는 시간2)
-- DATEDIFF: 날짜1 - 날짜2의 일수를 반환
-- TIMEDIFF: 시간1 - 시간2의 결과를 구함
SELECT
    DATEDIFF('2023-05-31', NOW()),
    TIMEDIFF('17:07:11', '13:06:10');

-- DAYOFWEEK(날짜), MONTHNAME(), DAYOFYEAR(날짜)
-- DAYOFWEEK: 요일 반환(1이 일요일)
-- MONTHNAME: 해당 달의 이름 반환
-- DAYOFYEAR: 해당 년도에서 몇 일이 흘렀는지 반환
SELECT
    DAYOFWEEK(CURDATE()),
    MONTHNAME(CURDATE()),
    DAYOFYEAR(CURDATE());

-- LAST_DAY(날짜)
-- LAST_DAY: 해당 날짜의 달에서 마지막 날의 날짜를 구한다.
SELECT LAST_DAY('20240201');

-- MAKEDATE(연도, 정수)
-- MAKEDATE: 해당 연도의 정수만큼 지난 날짜를 구한다.
SELECT MAKEDATE(2023, 32);

-- MAKETIME(시, 분, 초)
-- MAKETIME: 시, 분, 초를 이용해서 '시:분:초'의 TIME 형식을 만든다.
SELECT MAKETIME(17, 03, 02);

-- PERIOD_ADD(연월, 개월 수), PERIOD_DIFF(연월1, 연월2)
-- PERIOD_ADD: 열월에서 개월 수 이후의 연월을 구한다.(연월은 YYYY 또는 YYYYMM형식을 사용한다.)
-- PERIOD_DIFF: 연월1 - 연월2의 개월 수를 구한다.
SELECT
    PERIOD_ADD(202305, 6),
    PERIOD_DIFF(202305, 202311);

-- QUARTER(날짜)
-- QUARTER: 해당 날짜의 분기를 구함
SELECT QUARTER('2023-05-31');

-- TIME_TO_SEC(시간)
-- TIME_TO_SEC: 시간을 초 단위로 구함
SELECT TIME_TO_SEC('1:1:1');
