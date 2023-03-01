import 'package:dsa/staggered_card.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  GlobalKey<ScaffoldState> keyGlobal;
  NavBar({Key? key, required this.keyGlobal}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xffe8f5f3),
        child: ListView(shrinkWrap: true, children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
          ),
          ListView(shrinkWrap: true, children: [
            UserAccountsDrawerHeader(
              margin: const EdgeInsets.only(left: 50, top: 50),
              decoration: const BoxDecoration(color: Color(0xffe8f5f3)),
              currentAccountPictureSize: const Size(100, 40),
              currentAccountPicture: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.shopify.com/s/files/1/0428/8063/0937/files/logo_8682e62f-92f9-4366-adc6-a683d89e79ba_140x@2x.png?v=1671636499',
                          ),
                          fit: BoxFit.cover))),
              accountName: Text(''),
              accountEmail: Text(''),
            ),
            login(),
            const SizedBox(height: 10),
            navList(),
            const SizedBox(height: 10),
            otherList()
          ])
        ]));
  }

  Widget login() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: const [
          Icon(
            Icons.account_circle_outlined,
            size: 14,
          ),
          SizedBox(width: 4),
          Text('LOGIN | SIGNUP', style: TextStyle(fontSize: 14))
        ]),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff91215C)),
            child: const Text('TRACK MY ORDER',
                style: TextStyle(color: Colors.white, fontSize: 10)))
      ]),
    );
  }

  Widget navList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              onExpansionChanged: (i) {
                setState(() {
                  isPress = i;
                  expandedEntity[index].isPress = isPress;
                });
              },
              title: Text(nav[index]),
              backgroundColor: Colors.transparent,
              trailing: expandedEntity[index].isPress
                  ? const Icon(Icons.remove)
                  : Icon(expandedEntity[index].icon.icon),
              children: [
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    title: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StaggeredCard(
                                      keyGlobal: widget.keyGlobal,
                                    ))),
                        child: Text(baby[index])),
                  ),
                  itemCount: baby.length,
                  shrinkWrap: true,
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: 6);
  }

  Widget otherList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(other[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemCount: other.length);
  }

  var nav = [
    'NEW LAUNCH',
    'SKIN',
    'MAKE UP',
    'BABY',
    'HAIR',
    'BEST COLLECTIONS'
  ];

  var other = [
    'FAQs',
    'Terms and Conditions',
    'Track My Order',
    'Shipping and Returns',
    'Privacy Policy',
    'CSR Policy',
    'Store Locator',
    'About'
  ];

  var baby = ['BABY', 'BEST SELLERS', 'WHAT\'S NEW'];
  var expandedEntity = [
    isExpanded(isPress: false, icon: Icon(Icons.add)),
    isExpanded(isPress: false, icon: Icon(Icons.add)),
    isExpanded(isPress: false, icon: Icon(Icons.add)),
    isExpanded(isPress: false, icon: Icon(Icons.add)),
    isExpanded(isPress: false, icon: Icon(Icons.add)),
    isExpanded(isPress: false, icon: Icon(Icons.add)),
  ];
}

class isExpanded {
  bool isPress;
  Icon icon;
  isExpanded({required this.isPress, required this.icon});
}
