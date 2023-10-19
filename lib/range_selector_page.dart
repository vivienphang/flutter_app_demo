import 'package:flutter/material.dart';
import 'package:flutter_app_demo/randomizer_page.dart';
import 'package:flutter_app_demo/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();

  int _min = 0;
  int _max = 0;

  void updateMin(int value) {
    setState(() {
      _min = value;
    });
  }

  void updateMax(int value) {
    setState(() {
      _max = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: FormWidget(
        formKey: formKey,
        minValueSetter: updateMin,
        maxValueSetter: updateMax,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            print('Form state has been saved. min: $_min & max: $_max');
            Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => RandomizerPage(
                    min: _min,
                    max: _max)));
          }
        },
      ),
    );
  }
}
