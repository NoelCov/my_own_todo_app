import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF1D1F25),
        ),
        home: HomePage(),
      ),
    );
  }
}
