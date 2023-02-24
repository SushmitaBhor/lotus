import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
  List cardList = [
    Image.network(
      "https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200x1200_ce7d5bae-67b3-4e47-8d87-0fec82ae6072_x800.jpg?v=1677161687",
      fit: BoxFit.cover,
    ),
    Image.network(
      'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/Banner-for-Combos--Makeup-Webstore_1080x1080_5a0004cc-098d-4477-931f-9df9d647b39f_x800.jpg?v=1677050467',
      fit: BoxFit.cover,
    ),
    Image.network(
      'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200-x-1200_0beca3ad-8029-443f-87c1-ab235f96de2e_x800.gif?v=1676458262',
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200x1200_Creative_1_x800.jpg?v=1677138933",
      fit: BoxFit.cover,
    )
  ];
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

  @override
  void onLoad() {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
                      onPressed: () {},
                    ),
                    Image.network(
                      'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/logo_8682e62f-92f9-4366-adc6-a683d89e79ba_140x@2x.png?v=1671636499',
                      height: 30,
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
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: Alignment.center, children: [
                  Card(
                    child: card,
                  ),
                  Positioned(
                    top: 300,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(
                          cardList,
                          (index, url) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(color: Color(0xff91215c)),
                                  color: _currentIndex == index
                                      ? Color(0xff91215c)
                                      : Color.fromRGBO(0, 0, 0, 0)),
                            );
                          },
                        )),
                  ),
                ]),
              );
            });
          }).toList(),
        ),
      ),
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
        icon: Icon(Icons.search),
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
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          Navigator.pop(context);
        },
      ),
    ];
  }
}
