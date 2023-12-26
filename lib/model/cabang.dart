class Cabang {
  String? id;
  String namaCabang;

  Cabang({this.id, required this.namaCabang});
  factory Cabang.fromJson(Map<String, dynamic> json) =>
      Cabang(id: json["id"], namaCabang: json["nama_cabang"]);
  Map<String, dynamic> toJson() => {"nama_cabang": namaCabang};
}
