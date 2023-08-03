
import 'dart:io';

class Endpoints {
  Endpoints._();

  static final String baseUrl = Platform.isIOS ? "http://127.0.0.1:8080/api/v1" : "http://10.0.2.2:8080/api/v1" ;

  static final String baseImageUrl = Platform.isIOS ? "http://127.0.0.1:8080/image/" : "http://10.0.2.2:8080/image/";

  static const int receiveTimeout = 15000;

  static const int connectionTimeout = 30000;
}