import 'dart:convert';

class Shopping {
  final String title;
  final String subTitle;
  final String image;
  final String url;

  Shopping({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.url,
  });

  Shopping copyWith({
    String? title,
    String? subTitle,
    String? image,
    String? url,
  }) {
    return Shopping(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      image: image ?? this.image,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
      'image': image,
      'url': url,
    };
  }

  factory Shopping.fromMap(Map<String, dynamic> map) {
    return Shopping(
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      image: map['image'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Shopping.fromJson(String source) =>
      Shopping.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Shopping(title: $title, subTitle: $subTitle, image: $image, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Shopping &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.image == image &&
        other.url == url;
  }

  @override
  int get hashCode {
    return title.hashCode ^ subTitle.hashCode ^ image.hashCode ^ url.hashCode;
  }
}
