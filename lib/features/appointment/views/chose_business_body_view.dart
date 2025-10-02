part of '../appointment_chose_business_screen.dart';

class _ChoseBusinessBodyView extends StatefulWidget {
  const _ChoseBusinessBodyView({super.key});

  @override
  State<_ChoseBusinessBodyView> createState() => __ChoseBusinessBodyViewState();
}

class __ChoseBusinessBodyViewState extends State<_ChoseBusinessBodyView> {
  Map<String, dynamic> selectedBusiness = {
    "success": true,
    "data": [
      {
        "Isletme_Id": 1,
        "Isletme_Adi": "Şule Güneş Beauty",
        "Isletme_Adresi":
            "Barbaros, Tunalı Hilmi Cd. Gümüşsoy Pasajı D:79/18, 06680",
        "Isletme_Sabit_Telefonu": 505765785,
        "Isletme_Logosu": "sulegunes_logo.png",
        "Isletme_Tur_Id": 2,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Çankaya",
        "Isletme_Turu": "Güzellik Merkezi",
        "Sube_Id": 3,
        "Sube_Tanim_Id": 1,
        "Sube_Il_Id": 6,
        "Sube_Ilce_Id": 66,
        "Sube_Adresi":
            "Barbaros, Tunalı Hilmi Cd. Gümüşsoy Pasajı D:79/18, 06680",
        "Sube_Telefonu": 5057657853,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Merkez",
        "Sube_Il_Adi": "Ankara",
        "Sube_Ilce_Adi": "Çankaya",
        "Sube_Geocode":
            "\u003Ciframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3060.5374037773413!2d32.861380000000004!3d39.906988299999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14d34fa174f2fe99%3A0x2ec9b711d48fb170!2zxZ51bGUgR8O8bmXFnyBCZWF1dHk!5e0!3m2!1str!2str!4v1754496430001!5m2!1str!2str\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"\u003E\u003C/iframe\u003E",
      },
      {
        "Isletme_Id": 1,
        "Isletme_Adi": "Şule Güneş Beauty",
        "Isletme_Adresi":
            "Barbaros, Tunalı Hilmi Cd. Gümüşsoy Pasajı D:79/18, 06680",
        "Isletme_Sabit_Telefonu": 505765785,
        "Isletme_Logosu": "sulegunes_logo.png",
        "Isletme_Tur_Id": 2,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Çankaya",
        "Isletme_Turu": "Güzellik Merkezi",
        "Sube_Id": 14,
        "Sube_Tanim_Id": 2,
        "Sube_Il_Id": 6,
        "Sube_Ilce_Id": 84,
        "Sube_Adresi": "tetsd",
        "Sube_Telefonu": 3123333333,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Şube",
        "Sube_Il_Adi": "Ankara",
        "Sube_Ilce_Adi": "Yenimahalle",
        "Sube_Geocode": "",
      },
      {
        "Isletme_Id": 4,
        "Isletme_Adi": "TEST",
        "Isletme_Adresi": "FASDFG",
        "Isletme_Sabit_Telefonu": 2147483647,
        "Isletme_Logosu": "",
        "Isletme_Tur_Id": 3,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Etimesgut",
        "Isletme_Turu": "Berber",
        "Sube_Id": 4,
        "Sube_Tanim_Id": 1,
        "Sube_Il_Id": 1,
        "Sube_Ilce_Id": 1,
        "Sube_Adresi": "FASDFG",
        "Sube_Telefonu": null,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Merkez",
        "Sube_Il_Adi": "Adana",
        "Sube_Ilce_Adi": "Adana Merkez",
        "Sube_Geocode": "",
      },
      {
        "Isletme_Id": 4,
        "Isletme_Adi": "TEST",
        "Isletme_Adresi": "FASDFG",
        "Isletme_Sabit_Telefonu": 2147483647,
        "Isletme_Logosu": "",
        "Isletme_Tur_Id": 3,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Etimesgut",
        "Isletme_Turu": "Berber",
        "Sube_Id": 7,
        "Sube_Tanim_Id": 2,
        "Sube_Il_Id": 1,
        "Sube_Ilce_Id": 1,
        "Sube_Adresi": "sdgs",
        "Sube_Telefonu": null,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Şube",
        "Sube_Il_Adi": "Adana",
        "Sube_Ilce_Adi": "Adana Merkez",
        "Sube_Geocode": "",
      },
      {
        "Isletme_Id": 4,
        "Isletme_Adi": "TEST",
        "Isletme_Adresi": "FASDFG",
        "Isletme_Sabit_Telefonu": 2147483647,
        "Isletme_Logosu": "",
        "Isletme_Tur_Id": 3,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Etimesgut",
        "Isletme_Turu": "Berber",
        "Sube_Id": 9,
        "Sube_Tanim_Id": 2,
        "Sube_Il_Id": 1,
        "Sube_Ilce_Id": 1,
        "Sube_Adresi": "fffydf",
        "Sube_Telefonu": null,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Şube",
        "Sube_Il_Adi": "Adana",
        "Sube_Ilce_Adi": "Adana Merkez",
        "Sube_Geocode": "",
      },
      {
        "Isletme_Id": 5,
        "Isletme_Adi": "test2",
        "Isletme_Adresi": "test",
        "Isletme_Sabit_Telefonu": 0,
        "Isletme_Logosu": "",
        "Isletme_Tur_Id": 2,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Etimesgut",
        "Isletme_Turu": "Güzellik Merkezi",
        "Sube_Id": 11,
        "Sube_Tanim_Id": 1,
        "Sube_Il_Id": 6,
        "Sube_Ilce_Id": 69,
        "Sube_Adresi": "test",
        "Sube_Telefonu": null,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Merkez",
        "Sube_Il_Adi": "Ankara",
        "Sube_Ilce_Adi": "Etimesgut",
        "Sube_Geocode": "",
      },
      {
        "Isletme_Id": 6,
        "Isletme_Adi": "test3",
        "Isletme_Adresi": "",
        "Isletme_Sabit_Telefonu": 0,
        "Isletme_Logosu": "",
        "Isletme_Tur_Id": 2,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Yenimahalle",
        "Isletme_Turu": "Güzellik Merkezi",
        "Sube_Id": 12,
        "Sube_Tanim_Id": 1,
        "Sube_Il_Id": 6,
        "Sube_Ilce_Id": 84,
        "Sube_Adresi": "",
        "Sube_Telefonu": null,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Merkez",
        "Sube_Il_Adi": "Ankara",
        "Sube_Ilce_Adi": "Yenimahalle",
        "Sube_Geocode": "",
      },
      {
        "Isletme_Id": 7,
        "Isletme_Adi": "test4",
        "Isletme_Adresi": "",
        "Isletme_Sabit_Telefonu": 0,
        "Isletme_Logosu": "",
        "Isletme_Tur_Id": 1,
        "Il_Adi": "Ankara",
        "Ilce_Adi": "Keçiören",
        "Isletme_Turu": "Kuaför",
        "Sube_Id": 13,
        "Sube_Tanim_Id": 1,
        "Sube_Il_Id": 6,
        "Sube_Ilce_Id": 76,
        "Sube_Adresi": "",
        "Sube_Telefonu": null,
        "Sube_Durumu": "1",
        "Sube_Tipi": "Merkez",
        "Sube_Il_Adi": "Ankara",
        "Sube_Ilce_Adi": "Keçiören",
        "Sube_Geocode": "",
      },
    ],
  };

  

  @override
  Widget build(BuildContext context) {
    final List<dynamic> items =
        (selectedBusiness['data'] as List<dynamic>?) ?? [];

    if (items.isEmpty) {
      return Center(
        child: Text(
          AppStrings.noDataFound,
          style: AppTextStyle.bodyMediumMuted(context),
        ),
      );
    }

    return Padding(
      padding: AppPaddings.h16,
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, _) => const SizedBox(height: 12),
        itemBuilder: (ctx, index) {
          final Map<String, dynamic> item = Map<String, dynamic>.from(
            items[index] as Map,
          );
          final card = _choseBusinessCard(context,item);

          return card;
        },
      ),
    );
  }
}
