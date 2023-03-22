import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'AppBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  final controller = PageController(viewportFraction: 1, keepPage: true);

  List cardList = [
    "https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200x1200_ce7d5bae-67b3-4e47-8d87-0fec82ae6072_x800.jpg?v=1677161687",
    'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/Banner-for-Combos--Makeup-Webstore_1080x1080_5a0004cc-098d-4477-931f-9df9d647b39f_x800.jpg?v=1677050467',
    'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200-x-1200_0beca3ad-8029-443f-87c1-ab235f96de2e_x800.gif?v=1676458262',
    "https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200x1200_Creative_1_x800.jpg?v=1677138933",
  ];
  List<String> beautyImage = [
    'imagess/Artificial_fragrance_Free.png',
    'imagess/Clinically_tested.png',
    'imagess/Cruelty_Free.png',
    'imagess/Dermatologist_Tested.png',
    'imagess/parabenfree.png'
  ];
  int _currNext = 0;
  int _currPrev = 0;
  @override
  void initState() {
    controller.addListener(_scrollPage);
    super.initState();
    pagination();

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

  late Timer timer;
  bool movePrevious = false;
  void pagination() {
    timer = Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (controller.hasClients) {
        if (controller.page == 3) {
          movePrevious = true;
          controller.previousPage(
              duration: const Duration(seconds: 2), curve: Curves.easeIn);
        } else {
          if (movePrevious) {
            movePrevious = false;
            controller.previousPage(
                duration: const Duration(seconds: 2), curve: Curves.easeIn);
          } else {
            controller.nextPage(
                duration: const Duration(seconds: 2), curve: Curves.easeIn);
          }
        }
      }
    });
  }

  void _scrollPage() {
    _currNext = controller.page!.ceil();
    _currPrev = controller.page!.ceil();
    if (controller.position.userScrollDirection == ScrollDirection.reverse) {
      controller.animateToPage(_currNext,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    } else if (controller.position.userScrollDirection ==
        ScrollDirection.forward) {
      controller.animateToPage(_currPrev,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        cardList.length,
        (index) => Container(
              margin: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  cardList[index],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  fit: BoxFit.cover,
                ),
              ),
            ));
    return AppBarCustom(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                child: SmoothPageIndicator(
                  count: pages.length,
                  controller: controller,
                  effect: WormEffect(
                    radius: 16,
                    spacing: 20,
                    strokeWidth: 1,
                    activeDotColor: Color(0xff91215c),
                    dotColor: Color(0xff91215c),
                    dotHeight: 10,
                    paintStyle: PaintingStyle.stroke,
                    dotWidth: 10,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) => Image.asset(
                        beautyImage[i],
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                  separatorBuilder: (ctx, i) => Container(
                        width: 10,
                      ),
                  itemCount: beautyImage.length),
            ),
            const SizedBox(height: 20),
            const Text(
              'NON-TOXIC BEAUTY FOR YOU',
              style: TextStyle(
                  fontFamily: 'NotoSerif',
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'We make products that cater to all skin types. They are intuitive, solution oriented & inclusive of all Indian skin types and shades.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 500,
                  childAspectRatio: 1,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 200,
                  width: 100,
                  child: Stack(children: [
                    Image.network(
                      'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/1200x1200_creative_for_Probrite_Range_750x960_crop_center.jpg?v=1671181217',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Probrite collection'.toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'NotoSerif',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.white)),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('view products'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'NotoSerif',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll<
                                        EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 28)),
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color(0xffFFFFFF))),
                          )
                        ],
                      ),
                    )
                  ]),
                );
              },
              itemCount: 12,
            )
          ],
        ),
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
