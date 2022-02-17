import 'package:meta/meta.dart';
import 'package:flutter_social_ui/models/models.dart';

class Story {
  final User user;
  final String umageUrl;
  final bool isViewed;

  Story({@required this.user, @required this.umageUrl, this.isViewed = false});
}
