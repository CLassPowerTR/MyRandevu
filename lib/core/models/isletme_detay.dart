class IsletmeDetayResponse {
  final bool success;
  final IsletmeDetayData data;

  IsletmeDetayResponse({required this.success, required this.data});

  factory IsletmeDetayResponse.fromJson(Map<String, dynamic> json) {
    final dynamic rawData = json['data'];
    final Map<String, dynamic> dataMap = rawData is Map<String, dynamic>
        ? rawData
        : <String, dynamic>{};
    return IsletmeDetayResponse(
      success: json['success'] == true,
      data: IsletmeDetayData.fromJson(dataMap),
    );
  }

  Map<String, dynamic> toJson() => {'success': success, 'data': data.toJson()};
}

class IsletmeDetayData {
  final IsletmeDetay isletme;
  final List<IsletmeDetayHizmet> hizmetler;
  final List<IsletmeDetayCalismaSaati> calismaSaatleri;
  final List<dynamic> personel;

  IsletmeDetayData({
    required this.isletme,
    required this.hizmetler,
    required this.calismaSaatleri,
    required this.personel,
  });

  factory IsletmeDetayData.fromJson(Map<String, dynamic> json) {
    List<dynamic> rawHizmetler = json['hizmetler'] is List
        ? json['hizmetler'] as List
        : <dynamic>[];
    List<dynamic> rawCalisma = json['calisma_saatleri'] is List
        ? json['calisma_saatleri'] as List
        : <dynamic>[];
    List<dynamic> rawPersonel = json['personel'] is List
        ? json['personel'] as List
        : <dynamic>[];

    return IsletmeDetayData(
      isletme: IsletmeDetay.fromJson(
        Map<String, dynamic>.from(
          (json['isletme'] ?? <String, dynamic>{}) as Map,
        ),
      ),
      hizmetler: rawHizmetler
          .whereType<dynamic>()
          .map(
            (e) => IsletmeDetayHizmet.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
      calismaSaatleri: rawCalisma
          .whereType<dynamic>()
          .map(
            (e) => IsletmeDetayCalismaSaati.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
      personel: rawPersonel,
    );
  }

  Map<String, dynamic> toJson() => {
    'isletme': isletme.toJson(),
    'hizmetler': hizmetler.map((e) => e.toJson()).toList(),
    'calisma_saatleri': calismaSaatleri.map((e) => e.toJson()).toList(),
    'personel': personel,
  };
}

class IsletmeDetay {
  final int id;
  final String isletmeAdi;
  final String isletmeAdresi;
  final int isletmeSabitTelefonu;
  final String isletmeYetkiliAdi;
  final String isletmeYetkiliSoyadi;
  final String isletmeLogosu;
  final String isletmeLogoSize;
  final int isletmeIlId;
  final int isletmeIlceId;
  final String isletmeHakkindaMetni;
  final String ilAdi;
  final String ilceAdi;
  final int subeId;
  final int subeTanimId;
  final int subeIlId;
  final int subeIlceId;
  final String subeAdresi;
  final String? subeTelefonu;
  final String subeDurumu;
  final String subeTipi;
  final String subeIlAdi;
  final String subeIlceAdi;
  final String subeGeocode;
  final int hizmetVerilenCinsiyet;

  IsletmeDetay({
    required this.id,
    required this.isletmeAdi,
    required this.isletmeAdresi,
    required this.isletmeSabitTelefonu,
    required this.isletmeYetkiliAdi,
    required this.isletmeYetkiliSoyadi,
    required this.isletmeLogosu,
    required this.isletmeLogoSize,
    required this.isletmeIlId,
    required this.isletmeIlceId,
    required this.isletmeHakkindaMetni,
    required this.ilAdi,
    required this.ilceAdi,
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
    required this.hizmetVerilenCinsiyet,
  });

  factory IsletmeDetay.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic v) {
      if (v is int) return v;
      final String s = v?.toString() ?? '';
      return int.tryParse(s) ?? 0;
    }

    String parseString(dynamic v) => v?.toString() ?? '';

    String? parseNullableString(dynamic v) {
      final String? s = v?.toString();
      if (s == null) return null;
      if (s.toLowerCase() == 'null') return null;
      if (s.isEmpty) return null;
      return s;
    }

    return IsletmeDetay(
      id: parseInt(json['Id']),
      isletmeAdi: parseString(json['Isletme_Adi']),
      isletmeAdresi: parseString(json['Isletme_Adresi']),
      isletmeSabitTelefonu: parseInt(json['Isletme_Sabit_Telefonu']),
      isletmeYetkiliAdi: parseString(json['Isletme_Yetkili_Adi']),
      isletmeYetkiliSoyadi: parseString(json['Isletme_Yetkili_Soyadi']),
      isletmeLogosu: parseString(json['Isletme_Logosu']),
      isletmeLogoSize: parseString(json['Isletme_Logo_Size']),
      isletmeIlId: parseInt(json['Isletme_Il_Id']),
      isletmeIlceId: parseInt(json['Isletme_Ilce_Id']),
      isletmeHakkindaMetni: parseString(json['Isletme_Hakkinda_Metni']),
      ilAdi: parseString(json['Il_Adi']),
      ilceAdi: parseString(json['Ilce_Adi']),
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
      hizmetVerilenCinsiyet: parseInt(json['Hizmet_Verilen_Cinsiyet']),
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id,
    'Isletme_Adi': isletmeAdi,
    'Isletme_Adresi': isletmeAdresi,
    'Isletme_Sabit_Telefonu': isletmeSabitTelefonu,
    'Isletme_Yetkili_Adi': isletmeYetkiliAdi,
    'Isletme_Yetkili_Soyadi': isletmeYetkiliSoyadi,
    'Isletme_Logosu': isletmeLogosu,
    'Isletme_Logo_Size': isletmeLogoSize,
    'Isletme_Il_Id': isletmeIlId,
    'Isletme_Ilce_Id': isletmeIlceId,
    'Isletme_Hakkinda_Metni': isletmeHakkindaMetni,
    'Il_Adi': ilAdi,
    'Ilce_Adi': ilceAdi,
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
    'Hizmet_Verilen_Cinsiyet': hizmetVerilenCinsiyet,
  };
}

class IsletmeDetayHizmet {
  final int id;
  final int altHizmetId;
  final int anaHizmetId;
  final String hizmetFiyatAlt;
  final String hizmetFiyatUst;
  final String fiyatYayinDurumu;
  final String anaHizmetAdi;
  final String altHizmetAdi;

  IsletmeDetayHizmet({
    required this.id,
    required this.altHizmetId,
    required this.anaHizmetId,
    required this.hizmetFiyatAlt,
    required this.hizmetFiyatUst,
    required this.fiyatYayinDurumu,
    required this.anaHizmetAdi,
    required this.altHizmetAdi,
  });

  factory IsletmeDetayHizmet.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic v) {
      if (v is int) return v;
      final String s = v?.toString() ?? '';
      return int.tryParse(s) ?? 0;
    }

    String parseString(dynamic v) => v?.toString() ?? '';

    return IsletmeDetayHizmet(
      id: parseInt(json['Id']),
      altHizmetId: parseInt(json['Alt_Hizmet_Id']),
      anaHizmetId: parseInt(json['Ana_Hizmet_Id']),
      hizmetFiyatAlt: parseString(json['Hizmet_Fiyat_Alt']),
      hizmetFiyatUst: parseString(json['Hizmet_Fiyat_Ust']),
      fiyatYayinDurumu: parseString(json['Fiyat_Yayin_Durumu']),
      anaHizmetAdi: parseString(json['ana_hizmet_adi']),
      altHizmetAdi: parseString(json['alt_hizmet_adi']),
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id,
    'Alt_Hizmet_Id': altHizmetId,
    'Ana_Hizmet_Id': anaHizmetId,
    'Hizmet_Fiyat_Alt': hizmetFiyatAlt,
    'Hizmet_Fiyat_Ust': hizmetFiyatUst,
    'Fiyat_Yayin_Durumu': fiyatYayinDurumu,
    'ana_hizmet_adi': anaHizmetAdi,
    'alt_hizmet_adi': altHizmetAdi,
  };
}

class IsletmeDetayCalismaSaati {
  final int haftaGunuId;
  final String acilisSaati;
  final String kapanisSaati;
  final int islemPeriyodu;
  final String tatil;
  final String ogleArasiDurumu;
  final String ogleArasiBas;
  final String ogleArasiBit;
  final String gunAdi;

  IsletmeDetayCalismaSaati({
    required this.haftaGunuId,
    required this.acilisSaati,
    required this.kapanisSaati,
    required this.islemPeriyodu,
    required this.tatil,
    required this.ogleArasiDurumu,
    required this.ogleArasiBas,
    required this.ogleArasiBit,
    required this.gunAdi,
  });

  factory IsletmeDetayCalismaSaati.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic v) {
      if (v is int) return v;
      final String s = v?.toString() ?? '';
      return int.tryParse(s) ?? 0;
    }

    String parseString(dynamic v) => v?.toString() ?? '';

    return IsletmeDetayCalismaSaati(
      haftaGunuId: parseInt(json['Hafta_Gunu_Id']),
      acilisSaati: parseString(json['Acilis_Saati']),
      kapanisSaati: parseString(json['Kapanis_Saati']),
      islemPeriyodu: parseInt(json['Islem_Periyodu']),
      tatil: parseString(json['Tatil']),
      ogleArasiDurumu: parseString(json['Ogle_Arasi_Durumu']),
      ogleArasiBas: parseString(json['Ogle_Arasi_Bas']),
      ogleArasiBit: parseString(json['Ogle_Arasi_Bit']),
      gunAdi: parseString(json['Gun_Adi']),
    );
  }

  Map<String, dynamic> toJson() => {
    'Hafta_Gunu_Id': haftaGunuId,
    'Acilis_Saati': acilisSaati,
    'Kapanis_Saati': kapanisSaati,
    'Islem_Periyodu': islemPeriyodu,
    'Tatil': tatil,
    'Ogle_Arasi_Durumu': ogleArasiDurumu,
    'Ogle_Arasi_Bas': ogleArasiBas,
    'Ogle_Arasi_Bit': ogleArasiBit,
    'Gun_Adi': gunAdi,
  };
}
