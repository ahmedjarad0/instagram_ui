import 'dart:io';

class Post{
  String ? content ;
  String ? imageUrl ;
  int ? noOfLike ;
  File ? imageFile ;

  Post.fromFile({this.content, this.imageFile});
  Post.fromJson(Map<String ,dynamic>data){
    content = data['content'];
    imageUrl = data['image'];
    noOfLike = data['noLikes'];
  }
}