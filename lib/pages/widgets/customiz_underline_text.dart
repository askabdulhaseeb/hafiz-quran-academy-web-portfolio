import 'package:flutter/material.dart';

class CustomizeUnderlineText extends StatelessWidget {
  final String title;
  const CustomizeUnderlineText({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: (size.width < 500) ? 20 : size.width * 0.028,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (size.width < 500) SizedBox(height: 6),
        SizedBox(
          width: (size.width < 500) ? 40 : size.width * 0.06,
          child: Divider(
            height: 0,
            color: Theme.of(context).primaryColor,
            thickness: 4,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
