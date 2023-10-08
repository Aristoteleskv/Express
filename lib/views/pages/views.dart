import 'package:carousel_slider/carousel_slider.dart';
import 'package:express/util/colors.dart';
import 'package:express/util/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_buttom.dart';

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

class Compras extends StatefulWidget {
  const Compras({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ComprasState();
  }
}

class _ComprasState extends State<Compras> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: SizedBox(
            height: 55,
            child: Image.asset(ConstantAssets().logo_white),
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "COMPRAS",
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
                                ? const Color.fromARGB(255, 253, 152, 29)
                                : const Color.fromARGB(255, 211, 188, 154))
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
                      Navigator.of(context).pushNamed('/transfe');
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
      ]),
    );
  }
}

//Consultas
class Consultas extends StatefulWidget {
  const Consultas({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConsultasState();
  }
}

class _ConsultasState extends State<Consultas> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: SizedBox(
            height: 55,
            child: Image.asset(ConstantAssets().logo_white),
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "CONSULTAS",
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
                                ? const Color.fromARGB(255, 253, 152, 29)
                                : const Color.fromARGB(255, 211, 188, 154))
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
                      Navigator.of(context).pushNamed('/transfe');
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
      ]),
    );
  }
}

//Pagamentos
class Pagamentos extends StatefulWidget {
  const Pagamentos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PagamentosState();
  }
}

class _PagamentosState extends State<Pagamentos> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: SizedBox(
            height: 55,
            child: Image.asset(ConstantAssets().logo_white),
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "PAGAMENTOS",
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
                                ? const Color.fromARGB(255, 253, 152, 29)
                                : const Color.fromARGB(255, 211, 188, 154))
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
                      Navigator.of(context).pushNamed('/transfe');
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
      ]),
    );
  }
}

//Transferencias
class Transferencias extends StatefulWidget {
  const Transferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TransferenciasState();
  }
}

class _TransferenciasState extends State<Transferencias> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: SizedBox(
            height: 55,
            child: Image.asset(ConstantAssets().logo_white),
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "TRANSFERENCIAS",
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
                                ? const Color.fromARGB(255, 253, 152, 29)
                                : const Color.fromARGB(255, 211, 188, 154))
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
                      Navigator.of(context).pushNamed('/transfe');
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
      ]),
    );
  }
}

//Levantamento
class Levantamento extends StatefulWidget {
  const Levantamento({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LevantamentoState();
  }
}

class _LevantamentoState extends State<Levantamento> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: SizedBox(
            height: 55,
            child: Image.asset(ConstantAssets().logo_white),
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                "LEVANTAMENTO",
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
                                ? const Color.fromARGB(255, 253, 152, 29)
                                : const Color.fromARGB(255, 211, 188, 154))
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
                      Navigator.of(context).pushNamed('/transfe');
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
      ]),
    );
  }
}
