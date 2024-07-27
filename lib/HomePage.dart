
import 'package:asswak_comm/tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
    key: scaffoldKey,
    drawer: Drawer(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
    
                  ),
                  width: 100,
                  height: 100,
                  child: Image.asset('images/avatar.png'),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Diaa Ahmed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                    Text("diaaahmed@gmail.com", style: TextStyle(fontSize: 16),),
                  ],
                ),
              ],
            ),
    
            const ListTile(
              title: Text("Saved"),
              leading: Icon(Icons.bookmark_added_outlined),
            ),
            const ListTile(
              title: Text("Dark theme"),
              leading: Icon(Icons.dark_mode_outlined),
              
            ),
            const ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    ),
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
      bottom: const TabBar(
        labelColor: Colors.green,
        dividerColor: Colors.black,
        indicatorColor: Colors.green,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Cart",
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
    
      
    ),
    
    body: Container(
      padding: const EdgeInsets.all(10),
      child: TabBarView(
        children: [
           HomeTab(),
          Cart(),
        ],
      ),
    )
          ),
        );
  }
}
