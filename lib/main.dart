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
  var map = {'name': 'dami', 'age': 10};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _incrementCounter() {
    print(map['name']);

    map['name'] = 'john';
    print(map['name']);
    map = {
      'ten': 10,
      'eleven': 11,
      'twelve': 12,
      'thirteen': 13,
      'fourteen': 14,
      'fifteen': 15,
      'sixteen': 16
    };
    map.remove('twelve');
    map.removeWhere((key, value) {
      return (int.parse(value.toString()) % 2 == 0);
    });
    print(map);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 0),
        () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    actionsAlignment: MainAxisAlignment.center,
                    contentPadding: const EdgeInsets.all(10),
                    actionsPadding: const EdgeInsets.all(30),
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
        title: _typer(), backgroundColor: Color(0xffF6F4F5),
        elevation: 0.5, toolbarHeight: 200,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,

        leading: IconButton(
          icon: const Icon(Icons.search, color: Color(0xff212529)),
          onPressed: () {
            showSearch(
                context: context,
                delegate: CustomSearchHintDelegate(
                    hintText: 'Search for products...'));
          },
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
          TyperAnimatedText('– Dalai Lama', speed: Duration(milliseconds: 100)),
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
        },
      ),
    ];
  }
}
