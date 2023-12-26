import 'package:dio/dio.dart';

final Dio dio_kedua = Dio(BaseOptions(
    baseUrl: 'https://658104ee3dfdd1b11c424d2b.mockapi.io/', //anggota & detail buku
    connectTimeout: 5000,
    receiveTimeout: 3000));

class ApiClientKedua {
  Future<Response> get(String path) async {
    try {
      final response = await dio_kedua.get(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio_kedua.post(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio_kedua.put(Uri.encodeFull(path), data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio_kedua.delete(Uri.encodeFull(path));
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
