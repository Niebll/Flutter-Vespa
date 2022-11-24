class VespaClass {
  static final List<String> values = [
    id,
    title,
    imgthumbnail,
    harga,
    primaryColor
  ];

  // table name
  static const favorite_team = 'favorite';

  // column
  static final String id = 'id';
  static final String title = 'title';
  static final String imgthumbnail = 'imgthumbnail';
  static final String harga = 'harga';
  static final String primaryColor = 'primaryColor';
}

// column model
class VespaCart {
  final int? id;
  final String? title;
  final String? imgthumbnail;
  final String? harga;
  final String? primaryColor;

  VespaCart(
      {this.id,
        required this.title,
        required this.imgthumbnail,
        required this.harga,
        required this.primaryColor
      });

  factory VespaCart.fromMap(Map<String, dynamic> json) {
    return VespaCart(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imgthumbnail: json['imgthumbnail'] as String?,
      harga: json['harga'] as String?,
      primaryColor: json['primaryColor'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    VespaClass.id: id,
    VespaClass.title: title,
    VespaClass.imgthumbnail: imgthumbnail,
    VespaClass.harga: harga,
    VespaClass.primaryColor: primaryColor,
  };
}