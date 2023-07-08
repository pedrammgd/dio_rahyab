

class ErrorModel {
  String? message;
  String? documentationUrl;

  ErrorModel({
    this.message,
    this.documentationUrl,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    message: json["message"],
    documentationUrl: json["documentation_url"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "documentation_url": documentationUrl,
  };
}
