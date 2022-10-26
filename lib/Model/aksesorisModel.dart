class Aksesoris {
  String? name;
  String? img;
  String? img2;
  String? ukuranS;
  String? ukuranM;
  String? ukuranL;
  String? ukuranXL;
  String? ukuranXXL;
  String? ukuranXXXL;
  int? harga;
  String? description;

  Aksesoris(
      {this.name,
        this.img,
        this.img2,
        this.ukuranS,
        this.ukuranM,
        this.ukuranL,
        this.ukuranXL,
        this.ukuranXXL,
        this.ukuranXXXL,
        this.harga,
        this.description});

  Aksesoris.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    img2 = json['img2'];
    ukuranS = json['ukuranS'];
    ukuranM = json['ukuranM'];
    ukuranL = json['ukuranL'];
    ukuranXL = json['ukuranXL'];
    ukuranXXL = json['ukuranXXL'];
    ukuranXXXL = json['ukuranXXXL'];
    harga = json['harga'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['img'] = this.img;
    data['img2'] = this.img2;
    data['ukuranS'] = this.ukuranS;
    data['ukuranM'] = this.ukuranM;
    data['ukuranL'] = this.ukuranL;
    data['ukuranXL'] = this.ukuranXL;
    data['ukuranXXL'] = this.ukuranXXL;
    data['ukuranXXXL'] = this.ukuranXXXL;
    data['harga'] = this.harga;
    data['description'] = this.description;
    return data;
  }
}
