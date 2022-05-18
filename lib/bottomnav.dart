import 'package:apprenticeflutter/Recipe.dart';
import 'package:apprenticeflutter/page1.dart';
import 'package:apprenticeflutter/page2.dart';
import 'package:apprenticeflutter/page3.dart';
import 'package:apprenticeflutter/page4.dart';
import 'package:flutter/material.dart';



class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;

  final pages = [
    const Recipe(),
    const Page2(),
    const Page3(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),

      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Column(
            children: [
      IconButton(
      enableFeedback: false,
        onPressed: () {
          setState(() {
            pageIndex = 0;
          });
        },
        icon: pageIndex == 0
            ? const Icon(
          Icons.receipt_long,
          color: Colors.white,
          size: 35,
        )
            : const Icon(
      Icons.receipt_long_outlined,
      color: Colors.white,
        size: 35,
      ),

    ),
              Text("Recipes",style: TextStyle(
               fontSize: 15,color: Colors.white
              ),)
            ],
          ),

          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 35,
                )
                    : const Icon(
                  Icons.bookmark_outline_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text("Bookmarks",style: TextStyle(
                  fontSize: 15,color: Colors.white
              ),)
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                  Icons.local_grocery_store,
                  color: Colors.white,
                  size: 35,
                )
                    : const Icon(
                  Icons.local_grocery_store_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              Text("Groceries",style: TextStyle(
                  fontSize: 15,color: Colors.white
              ),)
            ],
          ),

        ],
      ),
    );
  }
}