class Il {
  final int id;
  final String isim;

  Il({required this.id, required this.isim});

  factory Il.fromJson(Map<String, dynamic> json) {
    // ID alanı için farklı muhtemel anahtarlar
    final List<String> idKeys = ['Id', 'id', 'ilId', 'IlId'];
    dynamic rawId;
    for (final key in idKeys) {
      if (json.containsKey(key)) {
        rawId = json[key];
        break;
      }
    }
    final int parsedId = rawId is int
        ? rawId
        : int.tryParse('${rawId ?? ''}') ?? 0;

    // İsim alanı için farklı muhtemel anahtarlar
    final List<String> nameKeys = ['Il_Adi', 'il', 'Il', 'name', 'isim'];
    String parsedName = '';
    for (final key in nameKeys) {
      if (json.containsKey(key) &&
          (json[key]?.toString().isNotEmpty ?? false)) {
        parsedName = json[key].toString();
        break;
      }
    }

    return Il(id: parsedId, isim: parsedName);
  }

  Map<String, dynamic> toJson() => {'Id': id, 'Il_Adi': isim};
}
