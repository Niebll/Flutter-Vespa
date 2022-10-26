class Vespas {
  String? tipe;
  String? name;
  int? cc;
  int? harga;
  String? imgthumbnail;
  String? img;
  String? img2;
  String? img3;
  String? tagline;
  String? judulDescription;
  String? descripstion;
  String? power;
  String? lengthWidth;
  String? engine;
  Fiture? fiture;

  Vespas(
      {this.tipe,
        this.name,
        this.cc,
        this.harga,
        this.imgthumbnail,
        this.img,
        this.img2,
        this.img3,
        this.tagline,
        this.judulDescription,
        this.descripstion,
        this.power,
        this.lengthWidth,
        this.engine,
        this.fiture});

  Vespas.fromJson(Map<String, dynamic> json) {
    tipe = json['tipe'];
    name = json['name'];
    cc = json['cc'];
    harga = json['harga'];
    imgthumbnail = json['imgthumbnail'];
    img = json['img'];
    img2 = json['img2'];
    img3 = json['img3'];
    tagline = json['tagline'];
    judulDescription = json['judul_description'];
    descripstion = json['descripstion'];
    power = json['power'];
    lengthWidth = json['lengthWidth'];
    engine = json['engine'];
    fiture =
    json['fiture'] != null ? new Fiture.fromJson(json['fiture']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipe'] = this.tipe;
    data['name'] = this.name;
    data['cc'] = this.cc;
    data['harga'] = this.harga;
    data['imgthumbnail'] = this.imgthumbnail;
    data['img'] = this.img;
    data['img2'] = this.img2;
    data['img3'] = this.img3;
    data['tagline'] = this.tagline;
    data['judul_description'] = this.judulDescription;
    data['descripstion'] = this.descripstion;
    data['power'] = this.power;
    data['lengthWidth'] = this.lengthWidth;
    data['engine'] = this.engine;
    if (this.fiture != null) {
      data['fiture'] = this.fiture!.toJson();
    }
    return data;
  }
}

class Fiture {
  String? fiturimg;
  String? fitu1;
  String? fiturimg2;
  String? fitur2;
  String? fiturimg3;
  String? fitur3;
  String? fiturimg4;
  String? fitur4;
  String? fiturimg5;
  String? fitur5;

  Fiture(
      {this.fiturimg,
        this.fitu1,
        this.fiturimg2,
        this.fitur2,
        this.fiturimg3,
        this.fitur3,
        this.fiturimg4,
        this.fitur4,
        this.fiturimg5,
        this.fitur5});

  Fiture.fromJson(Map<String, dynamic> json) {
    fiturimg = json['fiturimg'];
    fitu1 = json['fitu1'];
    fiturimg2 = json['fiturimg2'];
    fitur2 = json['fitur2'];
    fiturimg3 = json['fiturimg3'];
    fitur3 = json['fitur3'];
    fiturimg4 = json['fiturimg4'];
    fitur4 = json['fitur4'];
    fiturimg5 = json['fiturimg5'];
    fitur5 = json['fitur5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fiturimg'] = this.fiturimg;
    data['fitu1'] = this.fitu1;
    data['fiturimg2'] = this.fiturimg2;
    data['fitur2'] = this.fitur2;
    data['fiturimg3'] = this.fiturimg3;
    data['fitur3'] = this.fitur3;
    data['fiturimg4'] = this.fiturimg4;
    data['fitur4'] = this.fitur4;
    data['fiturimg5'] = this.fiturimg5;
    data['fitur5'] = this.fitur5;
    return data;
  }
}
