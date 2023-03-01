import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsa/NavBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'AppBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
          title: '',
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  int _currentIndex = 0;
  List cardList = [];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    actionsAlignment: MainAxisAlignment.center,
                    contentPadding: const EdgeInsets.all(10),
                    actionsPadding: const EdgeInsets.symmetric(vertical: 30),
                    scrollable: true,
                    title: const Text(
                      'Would you like to recieve Push Notifications?',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text(
                      'We promise to only send you relevant content and give you updates on your transactions',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(20),
                        color: Colors.grey,
                        child: const Text('No Thanks!',
                            style: TextStyle(color: Colors.white)),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: const EdgeInsets.all(20),
                        color: Colors.orangeAccent,
                        child: const Text('Sign me up!',
                            style: TextStyle(color: Colors.white)),
                      )
                    ])));
  }

  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AppBarCustom(
      body: CarouselSlider(
        carouselController: controller,
        options: CarouselOptions(
          height: 380.0,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: MediaQuery.of(context).size.width > 500 ? 0.3 : 1,
        ),
        items: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200x1200_ce7d5bae-67b3-4e47-8d87-0fec82ae6072_x800.jpg?v=1677161687",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/Banner-for-Combos--Makeup-Webstore_1080x1080_5a0004cc-098d-4477-931f-9df9d647b39f_x800.jpg?v=1677050467',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200-x-1200_0beca3ad-8029-443f-87c1-ab235f96de2e_x800.gif?v=1676458262',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200x1200_Creative_1_x800.jpg?v=1677138933",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchHintDelegate extends SearchDelegate {
  CustomSearchHintDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      );

  @override
  Widget buildSuggestions(BuildContext context) => const Text('suggestions');

  @override
  Widget buildResults(BuildContext context) => const Text('results');

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          Navigator.pop(context);
        },
      ),
    ];
  }
}
