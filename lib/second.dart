import 'package:flutter/material.dart';
import 'package:lab4/main.dart';
import 'package:lab4/third.dart'; // Импортируйте ThirdPage из вашего проекта

class SecondPage extends StatefulWidget {
  final String name;
  SecondPage({required this.name});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    // Получение имени пользователя из InheritedWidget
    String name = MyAppWithInheritedData.of(context)?.name ?? 'Default Name';

    return Scaffold(
      appBar: AppBar(
        title: Text('Вторая страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$name, добро пожаловать!'),
            SizedBox(height: 20),
            Text('Второй текст'),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Дата рождения',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  _selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (_selectedDate != null) {
                    setState(() {
                      _controller.text =
                          '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedDate != null) {
                  // Переход на ThirdPage с передачей выбранной даты
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ThirdPage(name: name, selectedDate: _selectedDate!),
                    ),
                  );
                }
              },
              child: Text('Рассчитать возраст'),
            ),
          ],
        ),
      ),
    );
  }
}
