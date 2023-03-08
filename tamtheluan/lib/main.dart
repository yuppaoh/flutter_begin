import 'package:flutter/material.dart';
import 'package:tamtheluan/date_picker_app.dart';
import 'package:tamtheluan/home_page.dart';

void main() {
  runApp(const MyApp());
  // runApp(const DatePickerExample());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: Column(
            children: const [
              Expanded(
                flex: 1,
                child: DatePickerApp()),
              Expanded(flex: 2,
              child: HomePage())
            ],
          ),
        );
  }
}
