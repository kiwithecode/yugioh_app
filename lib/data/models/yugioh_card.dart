class YugiohCard {
  final String name;
  final String imageUrl;
  final String desc;
  final String type;
  final String race;
  final String? archetype;

  YugiohCard({
    required this.name,
    required this.imageUrl,
    required this.desc,
    required this.type,
    required this.race,
    this.archetype,
  });

  factory YugiohCard.fromJson(Map<String, dynamic> json) {
    return YugiohCard(
      name: json['name'],
      imageUrl: json['card_images'][0]['image_url'],
      desc: json['desc'],
      type: json['type'],
      race: json['race'],
      archetype: json['archetype'],
    );
  }
}
