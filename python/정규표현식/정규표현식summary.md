## [python 정규표현식]



### 정규 표현식 적용 방법

```
import re
```

### 정규표현식에 쓰이는 메타문자

| 문자   | 설명                                                         | 사용법                                                       |
| ------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| ^      | 문자열 맨 앞에 오는지 판단                                   | ```print(re.search("^hello", "hello, world"))```             |
| $      | 문자열 맨 뒤에 오는지 판단                                   | ```print(re.search("world$", "hello, world"))```             |
| \|     | 문자열을 포함하는지 여부                                     | ```print(re.match("hello\|world","hello"))```                |
| ( )    |                                                              |                                                              |
| { }    |                                                              |                                                              |
| [ ]    | 대괄호 안의 어느 문자중 하나(매치할 문제에 여러 문자 있을 때는 맨 앞의 문자만 매치되는지)와 매치가 되는지 여부 | ```print(re.match("[abcdef]","a")),[.]일때는 .이 있는지 판단함``` |
| \\\\\\ | 역슬래시 자체를 찾는 것                                      | 또는 r''\\\찾는문자                                          |
| -      | from - to                                                    |                                                              |
| [^ ]   | 제외한 문자                                                  | [^0-9]-->0에서 9까지를 제외한 문자                           |
| \d     | 숫자([0-9])와 같음                                           |                                                              |
| \D     | Not \d의 의미,                                               |                                                              |





### 함수

| 함수      | 설명                                                        |
| --------- | ----------------------------------------------------------- |
| match()   | 왼쪽에서 순서대로 비교하면서 일치하는 것을 찾고 없으면 종료 |
| search()  | 문자열 전체에서 해당하는 것이 있으면 찾음                   |
| findall   | 정규식과 매치되는 모든 문자열을 리스트로 리턴               |
| Finditer  | 정규식과 매치되는 모든 문자열을 반복가능한 객체 형태로 리턴 |
| complie() |                                                             |
| start()   | 매치된 대상의 시작위치를 알고싶을 때                        |
| end()     | 매치 끝 위치                                                |
| Group()   |                                                             |
| Span()    |                                                             |

|      |                        |                                                              |
| ---- | ---------------------- | ------------------------------------------------------------ |
| re.i | 대소문자 관계없이 출력 | ```pat=re.compile("[a-z]",re.I)-->print(pat.match("python"))``` |

## 그룹에 대한 표현

|                 |      |
| --------------- | ---- |
| (?P<그룹명>...) |      |
|                 |      |
|                 |      |
|                 |      |
|                 |      |
|                 |      |
|                 |      |
|                 |      |

