import 'package:flutter/material.dart';
import 'package:ukk_kasir/component/button.dart';
import 'package:ukk_kasir/models/coffetile.dart';
import 'package:ukk_kasir/models/shop.dart';
import 'package:ukk_kasir/theme/color.dart';


class kasir extends StatefulWidget {
  const kasir({super.key});

  @override
  State<kasir> createState() => _kasirState();
}

class _kasirState extends State<kasir> {
  void NavigateToCoffeDetails(int index) {
    //menu dan shop
    final shop = context.read<Shop>();
    final coffeMenu = shop.coffeMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => coffedetail(
            Coffe: coffeMenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //menu dan shop
    final shop = context.read<Shop>();
    final coffeMenu = shop.coffeMenu;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 15),
        child: FloatingActionButton(
          backgroundColor: secondaryColor,
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 54, bottom: 8, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Search here.....",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.amber[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(left: 8, right: 2),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.archive_outlined,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(left: 2, right: 25),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: thirdColor, borderRadius: BorderRadius.circular(20), 
                  boxShadow: [
                    BoxShadow(
                       color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 5,                     // How much the shadow spreads
                        blurRadius: 7,                       // Softness of the shadow
                        offset: Offset(0, 3), 
                    )
                  ]),
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              padding:const  EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Coffe",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // reddem button
                      button(
                        text: "Reedem",
                        onTap: () {
                          Navigator.pushNamed(context, '/admin');
                        },
                      )
                    ],
                  ),
                  Image.asset(
                    'logo.png',
                    height: 100,
                    width: 80,
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: thirdColor,
                      ),
                      child:  Text("All Coffe"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text("Latte"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text("Machiato"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Text("Americacno"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Coffe menu",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeMenu.length,
                  itemBuilder: (context, index) => CoffeTile(
                    Coffe: coffeMenu[index],
                    onTap: () => NavigateToCoffeDetails(index),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeMenu.length,
                  itemBuilder: (context, index) => CoffeTile(
                    Coffe: coffeMenu[index],
                    onTap: () => NavigateToCoffeDetails(index),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'logo.png',
                        height: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "machiato",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "25k",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 28,
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
