import 'package:dio/dio.dart';
import '../helpers/api_client_2.dart';
import '../model/anggota.dart';

class AnggotaService {
  Future<List<Anggota>> listData() async {
    final Response response = await ApiClientKedua().get('anggota');
    final List data = response.data as List;
    List<Anggota> result = data.map((json) => Anggota.fromJson(json)).toList();
    return result;
  }

  Future<Anggota> simpan(Anggota anggota) async {
    var data = anggota.toJson();
    final Response response = await ApiClientKedua().post('anggota', data);
    Anggota result = Anggota.fromJson(response.data);
    return result;
  }

  Future<Anggota> ubah(Anggota anggota, String id) async {
    var data = anggota.toJson();
    final Response response = await ApiClientKedua().put('anggota/$id', data);
    print(response);
    Anggota result = Anggota.fromJson(response.data);
    return result;
  }

  Future<Anggota> getById(String id) async {
    final Response response = await ApiClientKedua().get('anggota/$id');
    Anggota result = Anggota.fromJson(response.data);
    return result;
  }

  Future<Anggota> hapus(Anggota anggota) async {
    final Response response =
    await ApiClientKedua().delete('anggota/${anggota.id}');
    Anggota result = Anggota.fromJson(response.data);
    return result;
  }
}
