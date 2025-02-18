class PostModel {
  final String id;
  final DateTime dateTime;
  final String postUrl;
  final String profileUrl;
  bool isLiked, isSaved;
  PostModel({
    required this.id,
    required this.dateTime,
    required this.postUrl,
    required this.profileUrl,
    this.isSaved = false,
    this.isLiked = false,
  });
}
