enum SocialType {
  naver(1),
  kakao(2),
  google(3),
  apple(4);

  const SocialType(this.code);

  final int code;

  factory SocialType.fromCode(int code) =>
      SocialType.values.firstWhere((e) => e.code == code);
}
