import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormFieldWidget(
                  labelText: 'Minimum',
                  intValueSetter: (value) => _min = value,
                ),
                SizedBox(
                    height: 12
                ),
                FormFieldWidget(
                    labelText: 'Maximum',
                  intValueSetter: (value) => _max = value,
                ),
              ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          // TODO: Validate the form
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();

          }
          // TODO: Navigate to the generator page
        },
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
  final void Function(int value) intValueSetter;

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
