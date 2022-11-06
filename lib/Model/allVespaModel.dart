// To parse this JSON data, do
//
//     final vespas = vespasFromJson(jsonString);

import 'dart:convert';

Vespas vespasFromJson(String str) => Vespas.fromJson(json.decode(str));

String vespasToJson(Vespas data) => json.encode(data.toJson());

class Vespas {
    Vespas({
        required this.all,
        required this.limited,
        required this.gts,
        required this.sprint,
        required this.primavera,
    });

    List<All> all;
    List<All> limited;
    List<All> gts;
    List<All> sprint;
    List<All> primavera;

    factory Vespas.fromJson(Map<String, dynamic> json) => Vespas(
        all: List<All>.from(json["all"].map((x) => All.fromJson(x))),
        limited: List<All>.from(json["limited"].map((x) => All.fromJson(x))),
        gts: List<All>.from(json["gts"].map((x) => All.fromJson(x))),
        sprint: List<All>.from(json["sprint"].map((x) => All.fromJson(x))),
        primavera: List<All>.from(json["primavera"].map((x) => All.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "all": List<dynamic>.from(all.map((x) => x.toJson())),
        "limited": List<dynamic>.from(limited.map((x) => x.toJson())),
        "gts": List<dynamic>.from(gts.map((x) => x.toJson())),
        "sprint": List<dynamic>.from(sprint.map((x) => x.toJson())),
        "primavera": List<dynamic>.from(primavera.map((x) => x.toJson())),
    };
}

class All {
    All({
        required this.tipe,
        required this.name,
        required this.cc,
        required this.harga,
        required this.imgthumbnail,
        required this.img,
        required this.img2,
        required this.img3,
        required this.tagline,
        required this.judulDescription,
        required this.descripstion,
        required this.power,
        required this.lengthWidth,
        required this.engine,
        required this.primarycolor,
        required this.fiture,
    });

    String tipe;
    String name;
    int cc;
    int harga;
    String imgthumbnail;
    String img;
    String img2;
    String img3;
    String tagline;
    String judulDescription;
    String descripstion;
    String power;
    String lengthWidth;
    String engine;
    String primarycolor;
    List<Fiture> fiture;

    factory All.fromJson(Map<String, dynamic> json) => All(
        tipe: json["tipe"],
        name: json["name"],
        cc: json["cc"],
        harga: json["harga"],
        imgthumbnail: json["imgthumbnail"],
        img: json["img"],
        img2: json["img2"],
        img3: json["img3"],
        tagline: json["tagline"],
        judulDescription: json["judul_description"],
        descripstion: json["descripstion"],
        power: json["power"],
        lengthWidth: json["lengthWidth"],
        engine: json["engine"],
        primarycolor: json["primarycolor"],
        fiture: List<Fiture>.from(json["fiture"].map((x) => Fiture.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tipe": tipe,
        "name": name,
        "cc": cc,
        "harga": harga,
        "imgthumbnail": imgthumbnail,
        "img": img,
        "img2": img2,
        "img3": img3,
        "tagline": tagline,
        "judul_description": judulDescription,
        "descripstion": descripstion,
        "power": power,
        "lengthWidth": lengthWidth,
        "engine": engine,
        "primarycolor": primarycolor,
        "fiture": List<dynamic>.from(fiture.map((x) => x.toJson())),
    };
}

class Fiture {
    Fiture({
        required this.fiturimg,
        required this.fitur,
    });

    String fiturimg;
    String fitur;

    factory Fiture.fromJson(Map<String, dynamic> json) => Fiture(
        fiturimg: json["fiturimg"],
        fitur: json["fitur"],
    );

    Map<String, dynamic> toJson() => {
        "fiturimg": fiturimg,
        "fitur": fitur,
    };
}




