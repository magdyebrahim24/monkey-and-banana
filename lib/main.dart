import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'themes.dart';
import 'package:game/widgets/design_patterns/iterator/iterator_main_code.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Monkey and Banana',
      theme: lightTheme,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
      home: IteratorExample(),
    );
  }
}
