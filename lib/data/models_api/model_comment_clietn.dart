class ModelCommentClient {
  final String? phone;
  final String? name;
  final String? surName;
  final String? address;
  final String? comment;
  final String clientUUid;
  final bool saveComment;


  ModelCommentClient( {
    required this.phone,
    required this.name,
    required this.comment,
    required this.address,
    required this.surName,
    required this.saveComment,
    required this.clientUUid,
  });
}
