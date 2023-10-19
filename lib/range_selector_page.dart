import 'package:flutter/material.dart';
import 'package:flutter_app_demo/randomizer_page.dart';
import 'package:flutter_app_demo/range_selector_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RangeSelectorPage extends HookWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    void updateMin(int value) {
      min.value = value;
    }

    void updateMax(int value) {
      max.value = value;
    }

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
            print(
                'Form state has been saved. min: ${min.value} & max: ${max.value}');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    RandomizerPage(min: min.value, max: max.value)));
          }
        },
      ),
    );
  }
}
