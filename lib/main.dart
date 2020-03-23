import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // 다른 연산을 다끝내고  context가 준비 됬을 때 사용하는 방법
    Future.delayed(Duration.zero).then((_) {
      final color = Theme.of(context).primaryColor;
    });
  }

  @override
  // context가 바뀔 때 마다 호출 된다.
  void didChangeDependencies() {
    super.didChangeDependencies();
    final color = Theme.of(context).primaryColor;
  }

  void showMyDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alent'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(),
          RaisedButton(
            child: Text('show dialog'),
            onPressed: () {
              showMyDialog();
            },
          ),
          Simple(),
        ],
      ),
      // 현재 화면의 컨텍스트 안에 scaffold를 찾아준다
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('액션버튼 테스트')));
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        );
      }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Simple extends StatelessWidget {
  void showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Simple Alent'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('simple Button'),
      onPressed: () {
        showMyDialog(context);
      },
    );
  }
}
