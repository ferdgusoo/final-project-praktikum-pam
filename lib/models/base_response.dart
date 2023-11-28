
class BaseResponse {
  int statusCode;
  String message;
  List<dynamic> data;

  BaseResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  @override
  String toString() {
    return "statusCode : $statusCode, message : $message, data : $data";
  }
}
