class VespaClass {
  static final List<String> values = [id, title, imgthumbnail];

  // table name
  static const favorite_team = 'favorite';

  // column
  static final String id = 'id';
  static final String title = 'title';
  static final String imgthumbnail = 'teambadge';
}

// column model
class VespaCart {
  final int? id;
  final String? title;
  final String? imgthumbnail;

  VespaCart(
      {this.id,
        required this.title,
        required this.imgthumbnail});

  factory VespaCart.fromMap(Map<String, dynamic> json) {
    return VespaCart(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imgthumbnail: json['imgthumbnail'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    VespaClass.id: id,
    VespaClass.title: title,
    VespaClass.imgthumbnail: imgthumbnail,
  };
}