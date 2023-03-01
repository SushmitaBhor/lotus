import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class StaggeredCard extends StatefulWidget {
  const StaggeredCard({Key? key}) : super(key: key);

  @override
  State<StaggeredCard> createState() => _StaggeredCardState();
}

class _StaggeredCardState extends State<StaggeredCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: sample());
  }

  Widget card() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Text('Hey '),
          Image.network(
              'https://cdn.shopify.com/s/files/1/0428/8063/0937/products/DayandNightCombo01_400x.jpg?v=1666074077')
        ],
      ),
    );
  }

  final options = LiveOptions(
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
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
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
          child: card(),
        ),
      );
}
