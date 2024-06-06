import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final String name;
  final DateTime selectedDate;

  ThirdPage({required this.name, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    // Вычисление возраста
    final age = DateTime.now().year - selectedDate.year;

    return Scaffold(
      appBar: AppBar(
        title: Text('Третья страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$name вам $age лет'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Переход на предыдущую страницу
                Navigator.of(context).popUntil(
                  (route) => route.isFirst,
                );
              },
              child: Text('Вернуться на главную'),
            ),
          ],
        ),
      ),
    );
  }
}
