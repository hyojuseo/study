class Post {
  final int? id;
  final String? image;
  final int? likes;
  final String? date;
  final String? content;
  final bool? liked;
  final String? user;

  Post({
    this.id,
    this.image,
    this.likes,
    this.date,
    this.content,
    this.liked,
    this.user
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      likes: json['likes'] ?? 0,
      date: json['date'] ?? '',
      content: json['content'] ?? '',
      liked: json['liked'] ?? false,
      user: json['user'],
    );
  }
}
