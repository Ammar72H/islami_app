class RadioResponse {
  List<Radios>? radios;

  RadioResponse({this.radios});

  RadioResponse.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = <Radios>[];
      json['radios'].forEach((v) {
        radios!.add(new Radios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.radios != null) {
      data['radios'] = this.radios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Radios {
  String? name;
  String? radioUrl;

  Radios({this.name, this.radioUrl});

  Radios.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    radioUrl = json['radio_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['radio_url'] = this.radioUrl;
    return data;
  }
}
