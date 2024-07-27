
import 'package:asswak_comm/details.dart';
import 'package:flutter/material.dart';

List products = [
  {
    "title": "watch",
    "image": "images/1.png",
    "price": "350 \$",
    "is saved": false
  },
  {
    "title": "Headphone",
    "image": "images/2.png",
    "price": "300 \$",
    "is saved": true
  },
  {
    "title": "sneakers",
    "image": "images/3.png",
    "price": "150 \$",
    "is saved": false
  },
  {
    "title": "Hoodie",
    "image": "images/4.png",
    "price": "200 \$",
    "is saved": true
  },
  {
    "title": "Perfume",
    "image": "images/5.jpg",
    "price": "500 \$",
    "is saved": true
  },
  {
    "title": "Laptop",
    "image": "images/6.jpg",
    "price": "1000 \$",
    "is saved": false
  },
  {
    "title": "T-shirt",
    "image": "images/7.jpg",
    "price": "40 \$",
    "is saved": false
  },
];
List cart = [];

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details(data: products[i],)));
                },
                child: CustomCardView(
                  title: products[i]['title'],
                  price: products[i]['price'],
                  image: products[i]['image'],
                  isSaved: products[i]['is saved'],
                ),
              );
            }));
  }
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              title: Text(cart[i]['title']),
              subtitle: Text(cart[i]['price']),
              leading: Image.asset(cart[i]['image']),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomCardView extends StatefulWidget {
  CustomCardView(
      {super.key, this.title, this.image, required this.isSaved, this.price});

  String? title;
  String? image;
  bool isSaved = false;
  String? price;

  @override
  State<CustomCardView> createState() => _CustomCardViewState();
}

class _CustomCardViewState extends State<CustomCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 150,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(82, 209, 209, 209)),
            child: Image.asset("${widget.image}"),
          ),
          Positioned(
              top: 5,
              right: 10,
              child: IconButton(
                icon: Icon(
                    widget.isSaved ? Icons.bookmark : Icons.bookmark_outline),
                color: widget.isSaved ? Colors.green : Colors.black,
                onPressed: () {
                  setState(() {
                    widget.isSaved = !widget.isSaved;
                  });
                },
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(173, 4, 4, 4),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            width: 150,
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.title}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.price}",
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
