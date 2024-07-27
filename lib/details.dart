
import 'package:asswak_comm/tabs.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key, this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Asswak ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "comm ",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("${data['image']}", height: 400,),
               Text(
                "${data['title']}",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
               Text(
                "${data['price']}",
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              
              Container(
                child: const Text(
                    "The heart of the app, the Chrono-Map, displays a mesmerizing web of interconnected timelines. Pinch to zoom, swipe across epochs, and explore historical events. Want to witness the signing of the Magna Carta? Simply set your coordinates and hit “Jump."),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  cart.add({"title": data['title'], "image": data["image"], "price": data['price']});
                },
                color: Colors.black,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.add_shopping_cart,color: Colors.white, size: 30,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
