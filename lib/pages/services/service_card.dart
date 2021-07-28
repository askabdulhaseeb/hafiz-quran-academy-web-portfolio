import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String assetsImage;
  final Color color;
  const ServiceCard({
    Key? key,
    required this.title,
    required this.assetsImage,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 250,
              child: Image(
                image: AssetImage(assetsImage),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 150,
              width: 250,
              color: color.withOpacity(0.8),
            ),
            Container(
              height: 150,
              width: 250,
              padding: const EdgeInsets.all(14),
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
