import 'package:flutter/material.dart';
import '../animation/entrance_fader.dart';
import '../pages/about/about.dart';
import '../pages/contact/contact.dart';
import '../pages/home/home.dart';
import '../pages/services/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 25.0);
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionListener = ItemPositionsListener.create();

  final List<String> _sectionsName = ["Home", "About", "Services", "Contact"];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.phone,
  ];

  void _scroll(int i) {
    _itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return AboutPage();
    } else if (i == 2) {
      return ServicePage();
    } else if (i == 3) {
      return ContactPage();
    } else if (i == 4) {
      return SizedBox(
        height: 20.0,
      );
    } else {
      return Container();
    }
  }

  Widget _appBarActions(String childText, int index, IconData icon) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: Offset(0, -20),
            delay: Duration(seconds: 3),
            duration: Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor: Theme.of(context).primaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              tooltip: '$childText',
              padding: const EdgeInsets.all(10),
              splashRadius: 20,
              hoverColor: Theme.of(context).primaryColor,
              onPressed: () => _scroll(index),
              icon: Icon(icon, color: Colors.white70),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: (MediaQuery.of(context).size.width > 500)
            ? SelectableText(
                ' WhatsApp/Skype: +92 315 1119144',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor,
                ),
              )
            : SelectableText(
                ' WhatsApp/Skype:\n+92 315 1119144',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor,
                  fontSize: 10,
                ),
              ),
        centerTitle: false,
        elevation: 0,
        actions: [
          for (int i = 0; i < _sectionsName.length; i++)
            _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
          if (MediaQuery.of(context).size.width > 500)
            const SizedBox(width: 20),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          // thumbColor: kPrimaryColor,
          thickness: 5.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 8,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }
}
