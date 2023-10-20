import 'package:flutter/material.dart';
import 'package:flutter_app_demo/randomizer_page.dart';
import 'package:flutter_app_demo/range_selector_form.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: FormWidget(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => RandomizerPage(),
                ),
            );
          }
        },
      ),
    );
  }
}
