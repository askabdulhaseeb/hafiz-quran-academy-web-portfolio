import 'package:flutter/material.dart';
import '../../configs/app_images.dart';
import '../../configs/contact_handle.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  Future _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          if (size.width > 500) HomePageBackground(size: size),
          if (size.width > 500)
            Positioned(
              // right: (size.width < 830)
              //     ? (size.width < 600)
              //         ? size.width * 0.001
              //         : size.width * 0.13
              //     : size.width * 0.23,
              right: 20,
              bottom: 20,
              child: SizedBox(
                height: size.height * 0.9,
                width: size.width * 0.5,
                child: Image.asset(iQuranImage),
              ),
            ),
          Positioned(
            left: size.width / 12,
            top: size.height / 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  '''خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ      ''',
                  maxLines: 3,
                  minLines: 1,
                  style: TextStyle(
                    fontSize: (size.width > 830) ? 60 : 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SelectableText(
                  '“The best of you are those who learn the Quran and teach it.”',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    wordSpacing: 3,
                    fontSize: (size.width > 830) ? 14 : 10,
                  ),
                ),
                SelectableText(
                  '"تم سب میں بہتر وہ ہے جو قرآن مجید پڑھے اور پڑھائے"',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    wordSpacing: 3,
                    fontSize: (size.width > 830) ? 20 : 16,
                  ),
                ),
                SelectableText(
                  '( Ṣaḥīḥ al-Bukhārī 5027 )',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    wordSpacing: 3,
                    // fontSize: (size.width > 830) ? 20 : 16,
                  ),
                ),
                if (size.width >= 500) const SizedBox(height: 100),
                if (size.width <= 500)
                  SizedBox(
                    height: 240,
                    width: 240,
                    child: Image.asset(iQuranImage,
                        fit: BoxFit.cover, alignment: Alignment.center),
                  ),
                Text(
                  'Welcome to',
                  style: TextStyle(color: Colors.white70, letterSpacing: 2),
                ),
                SelectableText(
                  '''Hafiz Quran Academy''',
                  maxLines: 3,
                  minLines: 1,
                  style: TextStyle(
                    fontSize: (size.width > 830) ? 60 : 30,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Your Online Quran Teacher',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                    letterSpacing: 4,
                    wordSpacing: 3,
                    fontSize: (size.width > 830) ? 14 : 10,
                  ),
                ),
                const SizedBox(height: 50),
                OutlinedButton(
                  onPressed: () {
                    _launchURL(facebookPagehandle);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      'Hire Me',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomePageBackground extends StatelessWidget {
  const HomePageBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Container(
          width: size.width / 2.5,
          height: size.height,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
