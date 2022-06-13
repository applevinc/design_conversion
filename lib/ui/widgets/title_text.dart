import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
