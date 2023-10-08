import 'package:express/util/colors.dart';
import 'package:express/views/data/pin_repository.dart';
import 'package:express/views/widgets/button_of_numpad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/constants.dart';
import '../auth/authentication_pin_bloc.dart';
import '../widgets/pin_sphere.dart';
import 'create_pin_page.dart';
import 'home/home_screen.dart';

class AuthenticationPIN extends StatelessWidget {
  static const String PIN = "PIN";
  static const String useSixDigitsPIN = "Use 6-digitos PIN";
  static const String authenticationSuccess = "sucesso";
  static const String authenticationFailed = "Autenticação falhou";

  const AuthenticationPIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      body: SafeArea(
        child: BlocProvider(
          lazy: false,
          create: (_) =>
              AuthenticationPinBloc(pinRepository: HivePINRepository()),
          child: BlocListener<AuthenticationPinBloc, AuthenticationPinState>(
            listener: (context, state) {
              if (state.pinStatus == AuthenticationPINStatus.equals) {
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    widthFactor: 500,
                    heightFactor: 500,
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      backgroundColor: Colors.orange,
                      color: Colors.grey,
                    ),
                  ),
                );
                Future.delayed(
                  const Duration(seconds: 2),
                  () => Navigator.of(context).pushNamed('/home'),
                );
              } else if (state.pinStatus == AuthenticationPINStatus.unequals) {
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    widthFactor: 500,
                    heightFactor: 500,
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      backgroundColor: Colors.orange,
                      color: Colors.grey,
                    ),
                  ),
                );
                Future.delayed(
                  const Duration(seconds: 1),
                  () => Navigator.of(context).pushNamed('/erro'),
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    child: Image.asset(ConstantAssets().pin_image),
                  ),
                ),
                _MainPart(),
                Flexible(flex: 1, child: _NumPad()),
                Flexible(
                    flex: 1,
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Color.fromARGB(255, 198, 191, 191),
                                width: 2)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, CreatePIN.route());
                              },
                              child: const Center(
                                  child: Text('APOIO AO CLIENTE',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24))),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, CreatePIN.route());
                              },
                              child: const Center(child: Text('Criar PIN')),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());
}

class _NumPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: ButtonOfNumPad(
                        num: "1",
                        onPressed: () =>
                            BlocProvider.of<AuthenticationPinBloc>(context).add(
                                const AuthenticationPinAddEvent(pinNum: 1))),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  Expanded(
                    child: ButtonOfNumPad(
                        num: "2",
                        onPressed: () =>
                            BlocProvider.of<AuthenticationPinBloc>(context).add(
                                const AuthenticationPinAddEvent(pinNum: 2))),
                  ),
                  const SizedBox(width: 21),
                  Expanded(
                    child: ButtonOfNumPad(
                        num: "3",
                        onPressed: () =>
                            BlocProvider.of<AuthenticationPinBloc>(context).add(
                                const AuthenticationPinAddEvent(pinNum: 3))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                      child: ButtonOfNumPad(
                          num: "4",
                          onPressed: () =>
                              BlocProvider.of<AuthenticationPinBloc>(context)
                                  .add(const AuthenticationPinAddEvent(
                                      pinNum: 4)))),
                  const SizedBox(width: 21),
                  Expanded(
                      child: ButtonOfNumPad(
                          num: "5",
                          onPressed: () =>
                              BlocProvider.of<AuthenticationPinBloc>(context)
                                  .add(const AuthenticationPinAddEvent(
                                      pinNum: 5)))),
                  const SizedBox(width: 21),
                  Expanded(
                      child: ButtonOfNumPad(
                          num: "6",
                          onPressed: () =>
                              BlocProvider.of<AuthenticationPinBloc>(context)
                                  .add(const AuthenticationPinAddEvent(
                                      pinNum: 6)))),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                      child: ButtonOfNumPad(
                          num: "7",
                          onPressed: () =>
                              BlocProvider.of<AuthenticationPinBloc>(context)
                                  .add(const AuthenticationPinAddEvent(
                                      pinNum: 7)))),
                  const SizedBox(width: 21),
                  Expanded(
                      child: ButtonOfNumPad(
                          num: "8",
                          onPressed: () =>
                              BlocProvider.of<AuthenticationPinBloc>(context)
                                  .add(const AuthenticationPinAddEvent(
                                      pinNum: 8)))),
                  const SizedBox(width: 21),
                  Expanded(
                      child: ButtonOfNumPad(
                          num: "9",
                          onPressed: () =>
                              BlocProvider.of<AuthenticationPinBloc>(context)
                                  .add(const AuthenticationPinAddEvent(
                                      pinNum: 9)))),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                      child: ButtonOfTxtPad(
                    num: "DEL",
                    onPressed: () =>
                        BlocProvider.of<AuthenticationPinBloc>(context)
                            .add(const AuthenticationPinEraseEvent()),
                  )),
                  const SizedBox(width: 21),
                  Expanded(
                      child: ButtonOfNumPad(
                          num: "0",
                          onPressed: () =>
                              BlocProvider.of<AuthenticationPinBloc>(context)
                                  .add(const AuthenticationPinAddEvent(
                                      pinNum: 0)))),
                  const SizedBox(width: 73),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainPart extends StatelessWidget {
  static const String enterYourPIN = "PIN de serviço MULTICAIXA";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationPinBloc, AuthenticationPinState>(
      buildWhen: (previous, current) => previous.pin != current.pin,
      builder: (context, state) {
        return Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6,
                  (index) => PinSphere(input: index < state.getCountsOfPIN())),
            ),
          ),
          const Text(enterYourPIN,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ]);
      },
    );
  }
}

class Cd extends StatelessWidget {
  static const String createPINCode = "Criar codigo PIN";
  static const String authenticationByPINCode = "Autenticação por PIN";

  const Cd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, CreatePIN.route());
              },
              child: const Center(child: Text(createPINCode)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, AuthenticationPIN.route());
              },
              child: const Center(child: Text(authenticationByPINCode)),
            ),
          ],
        ),
      ),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AuthenticationPIN());
  }
}
