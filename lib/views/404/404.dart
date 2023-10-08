// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../../util/constants.dart';

class Erro extends StatelessWidget {
  const Erro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                child: Image.asset(ConstantAssets().pin_image),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(38.0),
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                            child: Image.asset(ConstantAssets().erro),
                          ),
                        ),
                        const Center(
                            child: Text(
                                textAlign: TextAlign.center,
                                'O codigo PIN que foi inserido não esta correto. Porfavor,tente novamente. (001)',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20))),
                      ],
                    ),
                  ),
                  Align(
                    heightFactor: 3,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 30.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ConstantColors().PrimaryColor),
                      child: GestureDetector(
                          child: Center(
                            child: Text(
                              "Continuar",
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 19,
                                color: ConstantColors().TextoColor3,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("/pin");
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
