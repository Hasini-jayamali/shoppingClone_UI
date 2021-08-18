import 'package:flutter/material.dart';
import 'package:shopping/json/constant.dart';
import 'package:shopping/pages/account_page.dart';
import 'package:shopping/pages/cart_page.dart';
import 'package:shopping/pages/home_page.dart';
import 'package:shopping/pages/more_page.dart';
import 'package:shopping/pages/store_page.dart';
import 'package:shopping/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  //AppBar appbar = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        StorePage(),
        AccountPage(),
        CartPage(),
        MorePage(),
      ],
    );
  }

  getAppBar() {
    switch (activeTab) {
      case 0:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "HOME",
            style: TextStyle(color: black),
          ),
        );
        break;
      case 1:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "STORE",
            style: TextStyle(color: black),
          ),
        );
        break;
      case 2:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "ACCOUNT",
            style: TextStyle(color: black),
          ),
        );
        break;
      case 3:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "CART",
            style: TextStyle(color: black),
          ),
        );
        break;
      case 4:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: Text(
            "MORE",
            style: TextStyle(color: black),
          ),
        );
        break;
      // default:

    }
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(itemsTab.length, (index) {
            return IconButton(
                icon: Icon(
                  itemsTab[index]['icon'],
                  size: itemsTab[index]['size'],
                  color: activeTab == index ? accent : blue,
                ),
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                });
          }),
        ),
      ),
    );
  }
}
