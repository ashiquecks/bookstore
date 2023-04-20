class NetworkResponse<Data> {
  bool? isSuccessful;
  Data? data;
  String? message;
  int? responseCode;

  NetworkResponse(
    this.isSuccessful,
    this.data, {
    this.message,
    this.responseCode,
  });
}
