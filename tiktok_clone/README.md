# tiktok_clone

NomadCoders TikTok Clone project

## versions

- dart: 3.1.5
- flutter: 3.13.9

## review points

- `AnimatedOpacity` 로 자연스러운 on/off animation 연출 가능
- 글자 깨짐 현상은 디코딩 문제일 수 있음 `utf8.decode` 활용해보자 (feat. 김시윤 님)
- Material AppBar, Cupertino AppBar, Custom AppBar 기능 
- 각 위젯의 `key` 를 `Widget(key: GlobalKey())` 로 생성하면 고유하게 가져갈 수 있음, 아니면 재사용 될 수 있으니 주의
- `Offstage` 위젯을 활용하여 위젯이 사라지지 않고 그대로 state 를 가질 수 있게 유지하는 방법

### #9. Discover

- 