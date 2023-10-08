import 'package:express/util/colors.dart';
import 'package:flutter/material.dart';

import '../../../util/constants.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onPress;
  final String? texto;
  final Image? icone;
  const CustomButton({Key? key, this.texto, this.icone, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: ConstantColors().SecundaColor,
                  border: Border.all(
                    color: Colors.black38,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, top: 9, right: 5, bottom: 3),
                        child: Center(
                          heightFactor: 0.9,
                          child: icone,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        texto.toString(),
                        style: const TextStyle(
                            fontSize: 10.6, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
