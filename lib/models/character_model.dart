class CharacterModel {
  final String fullName;
  final String nickname;
  final String hogwartsHouse;
  final String interpretedBy;
  final String image;
  final String birthdate;

  CharacterModel({
    required this.fullName,
    required this.nickname,
    required this.hogwartsHouse,
    required this.interpretedBy,
    required this.image,
    required this.birthdate,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      fullName: json['fullName'] ?? '',
      nickname: json['nickname'] ?? '',
      hogwartsHouse: json['hogwartsHouse'] ?? '',
      interpretedBy: json['interpretedBy'] ?? '',
      image: json['image'] ?? '',
      birthdate: json['birthdate'] ?? '',
    );
  }
}