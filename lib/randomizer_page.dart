import 'package:flutter/material.dart';
import 'package:flutter_app_demo/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';


class RandomizerPage extends StatelessWidget {

  const RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Randomizer')
      ),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
            builder: (context, notifier, child) {
              return Text(
                notifier.generatedNumber?.toString() ?? 'Generate a number',
                style: const TextStyle(fontSize: 42),
              );
            }
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
            context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}