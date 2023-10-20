import 'package:flutter/material.dart';
import 'package:flutter_app_demo/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

typedef IntValueSetter = void Function(int value);

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormFieldWidget(
              labelText: 'Minimum',
              // intValueSetter: (value) => _min = value,
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().min = value,
            ),
            const SizedBox(height: 12),
            FormFieldWidget(
              labelText: 'Maximum',
              // intValueSetter: (value) => _max = value,
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class FormFieldWidget extends StatelessWidget {
  // Creating custom widget with optional key and mandatory labelText
  const FormFieldWidget({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;

  // Create a callback function that takes in int as param
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        // If the text provided is not a string, return error message
        if (value == null || int.tryParse(value) == null) {
          return 'Must enter integer values.';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
