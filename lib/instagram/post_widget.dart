import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/user.dart';

class PostWidget extends StatelessWidget {
  final User user;

  final Post post;

  const PostWidget({required this.user, required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  user.image!,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.name!,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Spacer(),
              Icon(Icons.more_horiz_outlined),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        post.imageFile == null
            ? Image.network(post.imageUrl!,fit: BoxFit.cover,)
            : Image.file(post.imageFile!,fit: BoxFit.cover,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                'asset/images/like.png',
                height: 25,
                width: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'asset/images/comment.png',
                height: 25,
                width: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'asset/images/share.png',
                height: 25,
                width: 25,
              ),
              Spacer(),
              Image.asset(
                'asset/images/save.png',
                height: 25,
                width: 25,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const [
              Text('Liked by '),
              Text(
                'ahmedjarad01 ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('and '),
              Text(
                'other ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
