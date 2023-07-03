

import 'package:instagram_ui/models/post.dart';
import 'package:instagram_ui/models/user.dart';

class PostResponse {
  User? user;

  Post? post;

  PostResponse(this.user, this.post);

  PostResponse.fromJson(Map<String, dynamic> data) {
    user = User.fromJson(data['user']);
    post = Post.fromJson(data['post']);
  }
}
