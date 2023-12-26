class Anggota {
  String? id;
  String namaAnggota;
  String nomorRM;
  String tanggalLahir;
  String alamat;
  String nomorTelepon;
  Anggota({
    this.id,
    required this.namaAnggota,
    required this.nomorRM,
    required this.alamat,
    required this.nomorTelepon,
    required this.tanggalLahir,
  });
  factory Anggota.fromJson(Map<String, dynamic> json) => Anggota(
      namaAnggota: json["nama"],
      nomorRM: json["nomor_angg"],
      alamat: json["alamat"],
      nomorTelepon: json["nomor_telepon"],
      tanggalLahir: json["tanggal_lahir"],
      id: json["id"]);
  Map<String, dynamic> toJson() => {
    "nomor_angg": nomorRM,
    "nama": namaAnggota,
    "alamat": alamat,
    "nomor_telepon": nomorTelepon,
    "tanggal_lahir": tanggalLahir
  };
}
