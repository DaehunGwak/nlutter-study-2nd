import 'package:thread_clone/timeline/models/user.dart';

class Feed {
  final User createdUser;
  final List<String> contentImageUrls;
  final String contentDescription;
  final List<User> replyCandidateUsers;
  final int replyCount;
  final int likeCount;
  final DateTime createdDateTime;

  Feed({
    required this.createdUser,
    this.contentImageUrls = const [],
    required this.contentDescription,
    this.replyCandidateUsers = const [],
    this.replyCount = 0,
    this.likeCount = 0,
    required this.createdDateTime,
  });
}
