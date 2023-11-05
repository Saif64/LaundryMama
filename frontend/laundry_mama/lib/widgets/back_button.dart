import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new,
      ),
      color: Theme.of(context).shadowColor,
      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
    );
  }
}
