import 'package:dio/dio.dart';

class ApiService{
  static const String _baseUrl=
      'https://martizoom.com';
  late Dio dio;
   ApiService({required this.dio});
  Future<dynamic>get(String endpoint)async
  {
    Response response=await dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}