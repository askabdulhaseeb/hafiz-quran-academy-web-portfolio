import 'package:flutter/material.dart';
import '../../configs/app_images.dart';
import '../../configs/contact_handle.dart';
import '../widgets/customiz_underline_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: (size.width > 800)
          ? const EdgeInsets.all(100)
          : const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AboutImageCard(size: size),
          SizedBox(width: size.width * 0.06),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutMeTextDetail(size: size),
                const SizedBox(height: 20),
                AboutMeButtonWidgets(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMeButtonWidgets extends StatelessWidget {
  const AboutMeButtonWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future _launchURL(String url) async => await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              _launchURL(facebookPagehandle);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('  Contact Me  '),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.all(10),
        //   child: OutlinedButton(
        //     onPressed: () {
        //       html.window.open(
        //           'https://drive.google.com/file/d/1abY079fdgZ2VkNOAppX3KyY_wr3MuaGu/view?usp=sharing',
        //           "pdf");
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.all(12),
        //       child: Text(
        //         '   Resume   ',
        //         style: TextStyle(color: Theme.of(context).primaryColor),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class AboutMeTextDetail extends StatelessWidget {
  const AboutMeTextDetail({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomizeUnderlineText(size: size, title: 'About Me'),
        SizedBox(
          child: SelectableText(
            '''I am Hassan Khan and Hafiz-e-Quran since 20 years. I have tought Quran to lot of students. I have around 10+ years of teaching experience and for last two years I have been teaching Online during lockdown. Currently, I am teaching many students from Canada.''',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class AboutImageCard extends StatelessWidget {
  const AboutImageCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.22,
      width: size.width * 0.22,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.width * 0.19,
              width: size.width * 0.19,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: size.width * 0.2,
              width: size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 8,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              child: Image.asset(iPersonImage),
            ),
          ),
        ],
      ),
    );
  }
}
