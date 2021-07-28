import 'package:flutter/material.dart';
import '../../configs/app_images.dart';
import '../widgets/customiz_underline_text.dart';
import 'service_card.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizeUnderlineText(size: size, title: 'Services'),
          SizedBox(
            width: size.width / 1.5,
            child: SelectableText(
              '''I teach Nazra Quran, Norani Quida, Namaz, Quran Recitation, Hadees and Duas to childern and learners of any age and gender. I have experience in teaching for more than 10 years in this field. You may feel free to contact me regarding the following services.''',
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            direction: Axis.horizontal,
            children: [
              ServiceCard(
                color: Theme.of(context).primaryColor,
                assetsImage: iQuranImage,
                title: 'Nazra Quran',
              ),
              ServiceCard(
                color: Colors.blue,
                assetsImage: iNooraniQuidaBG,
                title: 'Noorani Qaida',
              ),
              ServiceCard(
                color: Colors.red,
                assetsImage: iQuranImage,
                title: 'Quran with Translation',
              ),
              ServiceCard(
                color: Colors.brown,
                assetsImage: iNamazBG,
                title: 'Namaz',
              ),
              ServiceCard(
                color: Colors.purple,
                assetsImage: iQuranImage,
                title: 'Quran Recitation',
              ),
              ServiceCard(
                color: Colors.deepPurpleAccent,
                assetsImage: iHadeesBG,
                title: 'Hadees/\nDUAS',
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
