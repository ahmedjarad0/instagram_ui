import 'package:flutter/material.dart';

import '../models/user.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 70,
      height: 60,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.orange,
            Colors.purple,
          ],),
          border: Border.all(color: Colors.green, width: 1.5),
          shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundImage: NetworkImage(user.image!),
        radius: 40,
      ),
    );
  }
}
