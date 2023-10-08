import 'dart:async';

import 'package:express/util/colors.dart';
import 'package:express/util/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_buttom.dart';

final List<Widget> imageSliders = banners
    .map((item) => Container(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
          ),
        ))
    .toList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 50), () {
      Navigator.of(context).pushNamed('/pin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, size: 32, color: Colors.black54),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(
          child: SizedBox(
            height: 55,
            child: Image.asset(ConstantAssets().logo_white),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.message, color: Colors.black45),
              title: Text('A'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('B'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('C'),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "CARTÕES",
                style: TextStyle(
                    color: ConstantColors().TextoColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0),
              ),
            ),
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeFactor: 0.5,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                textAlign: TextAlign.center,
                "Matutadidi A.Kivova",
                style: TextStyle(color: Colors.black26, fontSize: 25.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: banners.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 179, 171, 163)
                                : const Color.fromARGB(255, 253, 152, 29))
                            .withOpacity(_current == entry.key ? 0.9 : 0.3)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    icone: Image.asset(
                      ConstantAssets().a,
                      scale: 1.8,
                    ),
                    texto: "PAGAMENTOS",
                    onPress: () {
                      Navigator.of(context).pushNamed('/pagamentos');
                    },
                  ),
                  CustomButton(
                    icone: Image.asset(
                      ConstantAssets().b,
                      scale: 1.6,
                    ),
                    texto: "TRANSFERENCIAS",
                    onPress: () {
                      Navigator.of(context).pushNamed('/transferencias');
                    },
                  ),
                  CustomButton(
                    icone: Image.asset(
                      ConstantAssets().c,
                      scale: 1.8,
                    ),
                    texto: "LEVANTAMENTOS SEM CARTÃO",
                    onPress: () {
                      Navigator.of(context).pushNamed('/levantamento');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    icone: Image.asset(
                      ConstantAssets().d,
                      scale: 1.6,
                    ),
                    texto: "CONSULTAS",
                    onPress: () {
                      Navigator.of(context).pushNamed('/consultas');
                    },
                  ),
                  CustomButton(
                    icone: Image.asset(
                      ConstantAssets().e,
                      scale: 1.8,
                    ),
                    texto: "COMPRAS EM CURSO",
                    onPress: () {
                      Navigator.of(context).pushNamed('/compras');
                    },
                  ),
                  CustomButton(
                    icone: Image.asset(
                      ConstantAssets().f,
                      scale: 1.7,
                    ),
                    texto: "COMPRAS",
                    onPress: () {
                      Navigator.of(context).pushNamed('/compras');
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
