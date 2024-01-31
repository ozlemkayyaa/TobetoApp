class GoTrainingModel {
  final String title;
  final String time;
  final String image;
  final String content;
  final String interest;
  final int? like;
  final int? visible;

  GoTrainingModel(
      {required this.title,
      required this.time,
      required this.image,
      required this.content,
      required this.interest,
      this.like,
      this.visible});
}
