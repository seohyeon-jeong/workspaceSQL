/* ERD : Entity Relationship Diagram 개체 관계 지도
    ERD notation(표기법)은 크게 다섯가지 존재 
    1. Entity = Table 
    2. Attribute : 테이블 안의 정보 (이름, 데이터타입)
        - decimal() : 정밀한 숫자 표기가 중요한 경우. 돈!
        - float() : 정확도는 조금 떨어져도 속도가 중요한 경우 사용 
        - char() : 글자 수가 일정
        - varchar() : 글자수가 가변적
        - timestamp() : datatime() + timezone
        * 그럼 왜 Order table에 날짜는 varchar()로 받았는가? ex)12/8/1968 -> 필요에 따라 함수로 str을 date로 바꿔주면 된다.
    3. Relationship 
    https://www.lucidchart.com/pages/er-diagrams#section_5
*/


