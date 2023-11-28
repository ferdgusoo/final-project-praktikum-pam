import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  Name name;
  List<String>? capital;
  String region;
  String? subregion;
  Map<dynamic, dynamic>? languages;
  int population;
  Flags flags;

  CountryModel({
    required this.name,
    this.capital,
    required this.region,
    this.subregion,
    this.languages,
    required this.population,
    required this.flags,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: Name.fromJson(json["name"]),
    capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
    region: json["region"]??"-",
    subregion: json["subregion"],
    languages: json["languages"],
    population: json["population"],
    flags: Flags.fromJson(json["flags"])
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "capital": capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
    "region": region,
    "subregion": subregion,
    "languages": Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "population": population,
    "flags": flags.toJson(),
  };
}

class Flags {
  String png;
  String svg;
  String? alt;

  Flags({
    required this.png,
    required this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    png: json["png"],
    svg: json["svg"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
    "alt": alt,
  };
}

class Name {
  String common;
  String official;

  Name({
    required this.common,
    required this.official,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
  };
}