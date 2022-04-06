import 'dart:convert';

class Konsumen {
  final String nama;
  final String nohp;
  final String merk;
  final String model;
  final String tglLhir;
  final String ktploc;

  final int createdby;
  Konsumen({
    required this.nama,
    required this.nohp,
    required this.merk,
    required this.model,
    required this.tglLhir,
    required this.ktploc,
    required this.createdby,
  });

  Konsumen copyWith({
    String? nama,
    String? nohp,
    String? merk,
    String? model,
    String? tglLhir,
    String? ktploc,
    int? createdby,
  }) {
    return Konsumen(
      nama: nama ?? this.nama,
      nohp: nohp ?? this.nohp,
      merk: merk ?? this.merk,
      model: model ?? this.model,
      tglLhir: tglLhir ?? this.tglLhir,
      ktploc: ktploc ?? this.ktploc,
      createdby: createdby ?? this.createdby,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nohp': nohp,
      'merk': merk,
      'model': model,
      'tglLhir': tglLhir,
      'ktploc': ktploc,
      'createdby': createdby,
    };
  }

  factory Konsumen.fromMap(Map<String, dynamic> map) {
    return Konsumen(
      nama: map['nama'] ?? '',
      nohp: map['nohp'] ?? '',
      merk: map['merk'] ?? '',
      model: map['model'] ?? '',
      tglLhir: map['tglLhir'] ?? '',
      ktploc: map['ktploc'] ?? '',
      createdby: map['createdby']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Konsumen.fromJson(String source) =>
      Konsumen.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Konsumen(nama: $nama, nohp: $nohp, merk: $merk, model: $model, tglLhir: $tglLhir, ktploc: $ktploc, createdby: $createdby)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Konsumen &&
        other.nama == nama &&
        other.nohp == nohp &&
        other.merk == merk &&
        other.model == model &&
        other.tglLhir == tglLhir &&
        other.ktploc == ktploc &&
        other.createdby == createdby;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
        nohp.hashCode ^
        merk.hashCode ^
        model.hashCode ^
        tglLhir.hashCode ^
        ktploc.hashCode ^
        createdby.hashCode;
  }
}
