import 'package:dio/dio.dart';
import '../helpers/api_client_2.dart';
import '../model/detbuku.dart';

class DetbukuService1 {
  Future<List<Detbuku>> listData() async {
    final Response response = await ApiClientKedua().get('buku');
    final List data = response.data as List;
    List<Detbuku> result = data.map((json) => Detbuku.fromJson(json)).toList();
    return result;
  }

  Future<Detbuku> simpan(Detbuku buku) async {
    var data = buku.toJson();
    final Response response = await ApiClientKedua().post('buku', data);
    Detbuku result = Detbuku.fromJson(response.data);
    return result;
  }

  Future<Detbuku> ubah(Detbuku buku, String id) async {
    var data = buku.toJson();
    final Response response = await ApiClientKedua().put('buku/$id', data);
    print(response);
    Detbuku result = Detbuku.fromJson(response.data);
    return result;
  }

  Future<Detbuku> getById(String id) async {
    final Response response = await ApiClientKedua().get('buku/$id');
    Detbuku result = Detbuku.fromJson(response.data);
    return result;
  }

  Future<Detbuku> hapus(Detbuku buku) async {
    final Response response =
        await ApiClientKedua().delete('buku/${buku.id}');
    Detbuku result = Detbuku.fromJson(response.data);
    return result;
  }
}
