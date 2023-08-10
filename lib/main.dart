import 'package:flutter/material.dart';

class Player {
  String name = 'nico';
}

void main() {
  runApp(App()); // void runApp(Widget), 위에서 import 됨
  //App Widget은 우리 앱의 root, 시작점, 모든 화면과 버튼 등등 모든 것들이 App Widget으로부터 옴
  var nico = Player();
}

//class로는 flutter앱을 구현할 수 없음, Widget으로 만들어 줘야함.
//class가 Widget이 되려면 3개의 coreWidget 중 하나를 extend받아야 함
//App class가 StatelessWidget을 상속받으면서 Widget이 됨, 아주 기초적인 Widget이고 화면에 뭔가를 띄어주기만 함
//이 때 일종의 계약을 맺게 되는데 너 이거 상속받으면 StatelessWidget.build 메서드 구현해야해
// +모든 Widget은 build 메서드를 구현해야함.
//build 메서드는 flutter가 실행, 뭘 return하던지 그걸 화면에 띄어줌, 그래서 Widget을 return해줘야 함
class App extends StatelessWidget {
  @override //StatelessWidget에는 build 메서드가 이미 있고 우리는 override해서 우리만의 build 메서드를 구현
  Widget build(BuildContext context) {
    //build메서드의 return 값은 Widget, 즉 Widget을 return하는 Widget을 만든 거지
    //root Widget은 MaterialApp(구글), CupertinoApp(애플) 둘 중 하나를 return 해야함, 우리 앱이 어떻게 보이게 하고 싶냐
    //내가 커스터마이징 UI 앱을 만들고 싶어도 기본적으로 둘 중 하나를 선택해줘야함(root 앱이라 시작점을 선택해야함)
    return MaterialApp(
        home: Scaffold(
      //home은 property인데 Widget을 return, 그 Widget이 사용자가 앱의 home에 있을 때 보여짐
      //home안에 넣은 Widget은 Scaffold, 화면의 구성 및 구조에 관한 것들을 가지고 있음
      appBar: AppBar(
        //appBar property에 AppBar라는 Widget을 넣음
        elevation: 10, //AppBar 그림자
        centerTitle: true, //제목이 Center인지 아닌지
        title: Text(
            "Hello Flutter!"), //AppBar Widget에서 title property를 사용, 또 다른 Widget인 Text Widget을 사용
        backgroundColor: Color.fromARGB(255, 244, 202, 248), //다양한 색 표현 가능
      ),

      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Hello World"), Text("I'm Joon")],
      )),
    )
        //body의 리턴값도 Widget인 Text("Hello World!"), MaterialApp class 의 property 중 앱의 home에 뭘 보여줄지
        //매우 역겨운 화면이 나타날텐데 그 이유는 flutter개발의 또 하나의 규칙 때문
        //scaffold를 가져야하는 규칙인데 구조를 제공해줌, 모바일 앱의 모든 home 화면은 scaffold가 필요

        );
  }
}
