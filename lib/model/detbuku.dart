class Detbuku {
  String? id;
  String namaDetbuku;
  String nomorRM;
  String tanggalLahir;
  String alamat;
  String nomorTelepon;
  Detbuku({
    this.id,
    required this.namaDetbuku,
    required this.nomorRM,
    required this.alamat,
    required this.nomorTelepon,
    required this.tanggalLahir,
  });
  factory Detbuku.fromJson(Map<String, dynamic> json) => Detbuku(
      namaDetbuku: json["nama"],
      nomorRM: json["nomor_rm"],
      alamat: json["alamat"],
      nomorTelepon: json["nomor_telepon"],
      tanggalLahir: json["tanggal_lahir"],
      id: json["id"]);
  Map<String, dynamic> toJson() => {
    "nomor_rm": nomorRM,
    "nama": namaDetbuku,
    "alamat": alamat,
    "nomor_telepon": nomorTelepon,
    "tanggal_lahir": tanggalLahir
  };
}
