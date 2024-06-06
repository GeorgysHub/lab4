import 'package:flutter/material.dart';
import 'package:lab4/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Представьтесь:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Ваше имя',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyAppWithInheritedData(
                        child: SecondPage(name: _controller.text),
                        name: _controller.text,
                      );
                    },
                  ),
                );
              },
              child: Text('Войти'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(150, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// InheritedWidget для передачи данных между виджетами
class MyAppWithInheritedData extends InheritedWidget {
  final String name;

  MyAppWithInheritedData({
    required Widget child,
    required this.name,
  }) : super(child: child);

  static MyAppWithInheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyAppWithInheritedData>();
  }

  @override
  bool updateShouldNotify(MyAppWithInheritedData oldWidget) {
    return name != oldWidget.name;
  }
}
