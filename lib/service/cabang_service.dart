import 'package:dio/dio.dart';
import '../helpers/api_client_1.dart';
import '../model/cabang.dart';

class CabangService {
  Future<List<Cabang>> listData() async {
    final Response response = await ApiClientPertama().get('cabang');
    final List data = response.data as List;
    List<Cabang> result = data.map((json) => Cabang.fromJson(json)).toList();
    return result;
  }

  Future<Cabang> simpan(Cabang cabang) async {
    var data = cabang.toJson();
    final Response response = await ApiClientPertama().post('cabang', data);
    Cabang result = Cabang.fromJson(response.data);
    return result;
  }

  Future<Cabang> ubah(Cabang cabang, String id) async {
    var data = cabang.toJson();
    final Response response = await ApiClientPertama().put('cabang/$id', data);
    print(response);
    Cabang result = Cabang.fromJson(response.data);
    return result;
  }

  Future<Cabang> getById(String id) async {
    final Response response = await ApiClientPertama().get('cabang/$id');
    Cabang result = Cabang.fromJson(response.data);
    return result;
  }

  Future<bool> hapus(Cabang cabang) async {
    final Response response =
    await ApiClientPertama().delete('cabang/${cabang.id}');
    Cabang result = Cabang.fromJson(response.data);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
