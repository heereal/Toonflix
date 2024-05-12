# Toonflix
## 앱 소개

- [Flutter 로 웹툰 앱 만들기](https://nomadcoders.co/flutter-for-beginners) 강의를 수강하면서 만든 웹툰 앱입니다.
- 네이버 웹툰 오늘의 웹툰 리스트를 제공하며, 각 웹툰별 기본 정보와 최신 에피소드를 확인할 수 있습니다.

<br/>

<table>
  <tr>
    <td align="center">홈 스크린</td>
    <td align="center">디테일 스크린</td>
    <td align="center">에피소드 리스트</td>
  </tr>
  <tr>
    <td align="center"><img src="https://github.com/heereal/Toonflix/assets/117061017/cf00094b-bf6e-40e6-9302-a86ce09f0330" width="300px" /></td>
    <td align="center"><img src="https://github.com/heereal/Toonflix/assets/117061017/6df6d49a-5ad7-4304-824c-ad2c484a5090" width="300px" /></td>
    <td align="center"><img src="https://github.com/heereal/Toonflix/assets/117061017/3d0be369-61ff-4c24-b2e8-4c3d0ab6ad21" width="300px" /></td>
  </tr>
</table>

<br/>

## 사용한 Flutter 패키지
- `http 1.2.1`
- `url_launcher 6.2.6`
- `shared_preferences 2.2.3`

<br/>

## 리팩토링
강의 내용 외에 다음의 항목들을 개인적으로 리팩토링했습니다.
1. `ColorScheme`, `AppBarTheme` 적용
2. 반복 사용되는 `WebtoonThumb` 위젯 분리
3. `Column`을 `ListView.builder`로 변경하기
4. 에피소드 리스트에 섬네일 이미지 추가
5. 위젯에서 클래스 메소드 호출 시 인자 전달하기

<br/>

## 블로그 링크
- [20일 동안 Flutter 공부한 후기](https://velog.io/@heer/flutter-is-cool)
- [[Flutter] 웹툰 앱 리팩토링](https://velog.io/@heer/flutter-toonflix-refactoring)

