class IsletmelerResponse {
  final bool success;
  final List<Isletme> data;

  IsletmelerResponse({required this.success, required this.data});

  factory IsletmelerResponse.fromJson(Map<String, dynamic> json) {
    final dynamic rawList = json['data'];
    final List<dynamic> items = rawList is List ? rawList : <dynamic>[];
    return IsletmelerResponse(
      success: (json['success'] == true),
      data: items
          .whereType<dynamic>()
          .map((e) => Isletme.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class Isletme {
  final int isletmeId;
  final String isletmeAdi;
  final String isletmeAdresi;
  final int isletmeSabitTelefonu;
  final String isletmeLogosu;
  final int isletmeTurId;
  final String ilAdi;
  final String ilceAdi;
  final String isletmeTuru;
  final int subeId;
  final int subeTanimId;
  final int subeIlId;
  final int subeIlceId;
  final String subeAdresi;
  final String?
  subeTelefonu; // null olabilir, sayısal gelebilir -> string'e çevrilir
  final String subeDurumu; // Örnek veride "1" string
  final String subeTipi;
  final String subeIlAdi;
  final String subeIlceAdi;
  final String subeGeocode;

  Isletme({
    required this.isletmeId,
    required this.isletmeAdi,
    required this.isletmeAdresi,
    required this.isletmeSabitTelefonu,
    required this.isletmeLogosu,
    required this.isletmeTurId,
    required this.ilAdi,
    required this.ilceAdi,
    required this.isletmeTuru,
    required this.subeId,
    required this.subeTanimId,
    required this.subeIlId,
    required this.subeIlceId,
    required this.subeAdresi,
    required this.subeTelefonu,
    required this.subeDurumu,
    required this.subeTipi,
    required this.subeIlAdi,
    required this.subeIlceAdi,
    required this.subeGeocode,
  });

  factory Isletme.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value is int) return value;
      final String s = value?.toString() ?? '';
      return int.tryParse(s) ?? 0;
    }

    String parseString(dynamic value) {
      return value?.toString() ?? '';
    }

    String? parseNullableString(dynamic value) {
      final String? s = value?.toString();
      if (s == null) return null;
      if (s.toLowerCase() == 'null') return null;
      if (s.isEmpty) return null;
      return s;
    }

    return Isletme(
      isletmeId: parseInt(json['Isletme_Id']),
      isletmeAdi: parseString(json['Isletme_Adi']),
      isletmeAdresi: parseString(json['Isletme_Adresi']),
      isletmeSabitTelefonu: parseInt(json['Isletme_Sabit_Telefonu']),
      isletmeLogosu: parseString(json['Isletme_Logosu']),
      isletmeTurId: parseInt(json['Isletme_Tur_Id']),
      ilAdi: parseString(json['Il_Adi']),
      ilceAdi: parseString(json['Ilce_Adi']),
      isletmeTuru: parseString(json['Isletme_Turu']),
      subeId: parseInt(json['Sube_Id']),
      subeTanimId: parseInt(json['Sube_Tanim_Id']),
      subeIlId: parseInt(json['Sube_Il_Id']),
      subeIlceId: parseInt(json['Sube_Ilce_Id']),
      subeAdresi: parseString(json['Sube_Adresi']),
      subeTelefonu: parseNullableString(json['Sube_Telefonu']),
      subeDurumu: parseString(json['Sube_Durumu']),
      subeTipi: parseString(json['Sube_Tipi']),
      subeIlAdi: parseString(json['Sube_Il_Adi']),
      subeIlceAdi: parseString(json['Sube_Ilce_Adi']),
      subeGeocode: parseString(json['Sube_Geocode']),
    );
  }

  Map<String, dynamic> toJson() => {
    'Isletme_Id': isletmeId,
    'Isletme_Adi': isletmeAdi,
    'Isletme_Adresi': isletmeAdresi,
    'Isletme_Sabit_Telefonu': isletmeSabitTelefonu,
    'Isletme_Logosu': isletmeLogosu,
    'Isletme_Tur_Id': isletmeTurId,
    'Il_Adi': ilAdi,
    'Ilce_Adi': ilceAdi,
    'Isletme_Turu': isletmeTuru,
    'Sube_Id': subeId,
    'Sube_Tanim_Id': subeTanimId,
    'Sube_Il_Id': subeIlId,
    'Sube_Ilce_Id': subeIlceId,
    'Sube_Adresi': subeAdresi,
    'Sube_Telefonu': subeTelefonu,
    'Sube_Durumu': subeDurumu,
    'Sube_Tipi': subeTipi,
    'Sube_Il_Adi': subeIlAdi,
    'Sube_Ilce_Adi': subeIlceAdi,
    'Sube_Geocode': subeGeocode,
  };
}
