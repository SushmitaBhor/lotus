import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dsa/NavBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AppBarCustom extends StatefulWidget {
  final Widget body;
  GlobalKey<ScaffoldState> keyGlobal = GlobalKey<ScaffoldState>();
  AppBarCustom({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.keyGlobal,
      drawerEnableOpenDragGesture: true,
      drawerDragStartBehavior: DragStartBehavior.start,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Color(0xffF6F4F5),
        elevation: 0.5,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Container(
          color: const Color(0xff91215c),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Contact: ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "1800120036231",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Email ID: ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "care@lotusherbals.com",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actionsIconTheme: IconThemeData(
          color: const Color(0xffffffff),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              color: const Color(0xff91215c),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.person), Text('Login/Signup')],
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 6),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xff212529),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.keyGlobal.currentState?.openDrawer();
                        });
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(title: '')));
                      },
                      child: Image.network(
                        'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/logo_8682e62f-92f9-4366-adc6-a683d89e79ba_140x@2x.png?v=1671636499',
                        height: 30,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Color(0xff212529),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search, color: Color(0xff212529)),
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: CustomSearchHintDelegate(
                              hintText: 'Search for products...'));
                    },
                  ),
                  _typer(),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: NavBar(
        keyGlobal: widget.keyGlobal,
      ),
      body: widget.body,
    );
  }

  Widget _typer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: DefaultTextStyle(
        style: const TextStyle(
            fontSize: 12.0, fontFamily: 'popin', color: Color(0xff212529)),
        child: AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
          TyperAnimatedText('Search for WhiteGlow',
              speed: Duration(milliseconds: 100)),
          TyperAnimatedText('Search for Facial Kit',
              speed: Duration(milliseconds: 100)),
          TyperAnimatedText(' Search for Makeup',
              speed: Duration(milliseconds: 100)),
        ]),
      ),
    );
  }
}
