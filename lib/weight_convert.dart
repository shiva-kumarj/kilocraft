import 'package:flutter/material.dart';
import 'package:kilocraft/widgets/text_field.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

class WeightConvert extends StatefulWidget {
  const WeightConvert({super.key});

  @override
  State<WeightConvert> createState() => _WeightConvertState();
}

class _WeightConvertState extends State<WeightConvert> {
  final weightLbController = TextEditingController();
  FocusNode lbFocusNode = FocusNode();

  final weightKgController = TextEditingController();
  FocusNode kgFocusNode = FocusNode();

  TextEditingController currentController = TextEditingController();

  onKeyboardTap(String value) {
    setState(() {
      weightLbController.text = weightLbController.text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    if (lbFocusNode.hasFocus) {
                      print("lb field has focus");
                      currentController = weightLbController;
                    } else if (kgFocusNode.hasFocus) {
                      print("kg field has focus");
                      currentController = weightKgController;
                    }
                  }
                },
                child: CustomTextField(
                    controller: weightLbController,
                    hintText: 'Weight(Lb)',
                    focusNode: lbFocusNode),
              ),
              const SizedBox(
                height: 10,
              ),
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    if (kgFocusNode.hasFocus) {
                      print('kg field has focus');
                      currentController = weightKgController;
                    } else if (lbFocusNode.hasFocus) {
                      print('lb field has focus');
                      currentController = weightLbController;
                    }
                  }
                },
                child: CustomTextField(
                    controller: weightKgController,
                    hintText: 'Weight(Kg)',
                    focusNode: kgFocusNode),
              ),
              NumericKeyboard(
                onKeyboardTap: onKeyboardTap,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
                rightButtonFn: () {
                  if (currentController.text.isEmpty) return;
                  setState(() {
                    currentController.text = currentController.text
                        .substring(0, currentController.text.length - 1);
                  });
                },
                rightButtonLongPressFn: () {
                  if (currentController.text.isEmpty) return;
                  setState(() {
                    currentController.text = '';
                  });
                },
                rightIcon: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.blueGrey,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
