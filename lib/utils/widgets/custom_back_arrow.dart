import 'package:flutter/material.dart';

class BackArrowIcon extends StatelessWidget {
  const BackArrowIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        iconSize: 26,
        padding: const EdgeInsets.all(16),
        // alignment: Alignment.center,
        // highlightColor: Colors.redAccent, // لون الضغط العادي
        // splashColor: Colors.blue, // لما تضغط بسرعة
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
