import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: const Form(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormFieldWidget(
                  labelText: 'Minimum',
                ),
                SizedBox(height: 12),
                FormFieldWidget(
                    labelText: 'Maximum')
              ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {},
      ),
      // TODO: Validate the form
      // TODO: Navigate to the generator page
    );
  }
}

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  // Creating widget with optional key and mandatory labelText
  const FormFieldWidget({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
    ),
    keyboardType: TextInputType.numberWithOptions(
      decimal: false,
      signed: true,
    ),
              );
  }
}
