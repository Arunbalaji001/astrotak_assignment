class askaquestionmodel {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  List<Data>? data=[];

  askaquestionmodel(
      {this.httpStatus,
        this.httpStatusCode,
        this.success,
        this.message,
        this.apiName,
           required this.data});
  askaquestionmodel.empty(
      {this.data=const <Data>[]});

  askaquestionmodel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    apiName = json['apiName'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data?.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['httpStatus'] = this.httpStatus;
    data['httpStatusCode'] = this.httpStatusCode;
    data['success'] = this.success;
    data['message'] = this.message;
    data['apiName'] = this.apiName;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  int? price;
  List<String>? suggestions;
  bool selected=false;

  Data({this.id, this.name, this.description, this.price, this.suggestions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = double.parse(json['price'].toString()).round()!=null?double.parse(json['price'].toString()).round():0;
    suggestions = json['suggestions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['suggestions'] = this.suggestions;
    return data;
  }
}