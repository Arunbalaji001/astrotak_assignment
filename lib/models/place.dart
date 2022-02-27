class Placez {
  String placeName='';
  String placeId='';


  Placez(
      {required this.placeName,
        required this.placeId,
      });

  Placez.fromJson(Map<String, dynamic> json) {
    placeName = json['placeName']??'';
    placeId = json['placeId']??'';

    }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeName'] = this.placeName;
    data['placeId'] = this.placeId;
    return data;
  }
  }