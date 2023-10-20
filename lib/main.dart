import 'package:flutter/material.dart';
import 'package:flutter_app_demo/randomizer_change_notifier.dart';
import 'package:flutter_app_demo/range_selector_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      // Now this change notifier is accessible anywhere in the app
      child: MaterialApp(
        title: 'Randomizer',
        home: RangeSelectorPage(),
      ),
    );
  }
}
