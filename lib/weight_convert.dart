import 'package:flutter/material.dart';
import 'package:kilocraft/widgets/text_field.dart';

class WeightConvert extends StatefulWidget {
  const WeightConvert({super.key});

  @override
  State<WeightConvert> createState() => _WeightConvertState();
}

class _WeightConvertState extends State<WeightConvert> {
  final weightLbController = TextEditingController();

  final weightKgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              CustomTextField(controller: weightLbController, hintText: 'Weight(Lb)'),
              const SizedBox(height: 10,),
              CustomTextField(controller: weightKgController, hintText: 'Weight(Kg)'),
            ]

          ),
        )
      ),

    );
  }
}
