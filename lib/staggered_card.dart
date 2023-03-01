import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'AppBar.dart';

class StaggeredCard extends StatefulWidget {
  GlobalKey<ScaffoldState> keyGlobal;
  StaggeredCard({Key? key, required this.keyGlobal}) : super(key: key);

  @override
  State<StaggeredCard> createState() => _StaggeredCardState();
}

class _StaggeredCardState extends State<StaggeredCard> {
  @override
  Widget build(BuildContext context) {
    return AppBarCustom(
      body: sample(),
    );
  }

  Widget imageAndTitle() {
    return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        borderOnForeground: true,
        elevation: 20,
        child: Column(children: [
          Flexible(
              flex: 2,
              child: Container(
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0428/8063/0937/products/DayandNightCombo01_400x.jpg?v=1666074077',
                          ),
                          fit: BoxFit.cover)))),
          FittedBox(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: MediaQuery.of(context).size.width > 500 ? 20 : 0),
            Text(
              'Lotus Herbals WHITE GLOW Day And Night Pack',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.width > 500 ? 16 : 10),
            ),
            SizedBox(height: MediaQuery.of(context).size.width > 500 ? 20 : 0),
            MediaQuery.of(context).size.width > 500
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                        Text(
                          'MRP ₹ 696.00',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Text('MRP ₹ 870.00',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))
                      ])
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text(
                          'MRP ₹ 696.00',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: MediaQuery.of(context).size.width > 500
                                  ? 16
                                  : 10,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Text('MRP ₹ 870.00',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width > 500
                                        ? 16
                                        : 10,
                                fontWeight: FontWeight.w600))
                      ]),
            SizedBox(height: MediaQuery.of(context).size.width > 500 ? 10 : 0),
            MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width > 500 ? 30 : 20,
                    vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: const Color(0xff90215C),
                child: const Text('ADD TO CART',
                    style: TextStyle(color: Colors.white))),
            SizedBox(height: MediaQuery.of(context).size.width > 500 ? 20 : 0)
          ]))
        ]));
  }

  final options = const LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 1),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 500),

    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.05,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );
  Widget sample() {
    return // With predefined options
        LiveGrid.options(
      options: options,

      // Like GridView.builder, but also includes animation property
      itemBuilder: buildAnimatedItem,

      // Other properties correspond to the `ListView.builder` / `ListView.separated` widget
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 500 ? 3 : 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 100,
      ),
    );
  }

  // Build animated item (helper for all examples)
  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      // For example wrap with fade transition
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(0, -0.1),
          ).animate(animation),
          // Paste you Widget
          child: imageAndTitle(),
        ),
      );
}
