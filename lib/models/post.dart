class Post{
  String ? content ;
  String ? imageUrl ;
  int ? noOfLike ;

  Post(this.content, this.imageUrl, this.noOfLike);
  Post.fromJson(Map<String ,dynamic>data){
    content = data['content'];
    imageUrl = data['image'];
    noOfLike = data['noLikes'];
  }
}