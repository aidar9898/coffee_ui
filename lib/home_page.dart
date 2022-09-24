import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondopjatam/coffee_tile.dart';
import 'package:ondopjatam/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeetype = [
    [
      'cappucino',
      true,
    ],
    [
      'latte',
      false,
    ],
    [
      'black',
      false,
    ],
    [
      'tea',
      false,
    ],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeetype.length; i++) {
        coffeetype[i][1] = false;
      }

      coffeetype[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: '',
          )
        ]),
        body: Column(
          children: [
            // naiti luchshiy cofe dlya vas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("даамдуу жана таттуу кофелер",
                  style: GoogleFonts.elMessiri(
                    fontSize: 45,
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            // panel poiska
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: (TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'сүйгөн кофенизди издениз',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade600))))),
            ),

            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeetype.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      coffeeType: coffeetype[index][0],
                      isSelected: coffeetype[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      },
                    );
                  }),
            ),

            //horizontal spisok kofeinyh plitok
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/coffeeeki.jpeg',
                    coffeeName: 'latte',
                    coffeePrice: '4.20',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/cofe.jpg',
                    coffeeName: 'cappucino',
                    coffeePrice: '4.10',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/latteuch.jpg',
                    coffeeName: 'milk coffee thing',
                    coffeePrice: '4.60',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
