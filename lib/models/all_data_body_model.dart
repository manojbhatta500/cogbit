
class AllDataBodyModel {
  final int totalPages;
  final List<AllDataItemModel> list;

  AllDataBodyModel({required this.totalPages, required this.list});

  factory AllDataBodyModel.fromJson(Map<String, dynamic> json) {
    var listFromJson = json['list'] as List;
    List<AllDataItemModel> itemList = listFromJson.map((item) => AllDataItemModel.fromJson(item)).toList();

    return AllDataBodyModel(
      totalPages: json['totalPages'],
      list: itemList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPages': totalPages,
      'list': list.map((item) => item.toJson()).toList(),
    };
  }
}

class AllDataItemModel {
  final String id;
  final int version;
  final String status;
  final String idNumber;
  final String? title;
  final String? orgunitid;
  final String? catidJson;
  final String? attr;
  final String? t;
  final String? e;

  AllDataItemModel({
    required this.id,
    required this.version,
    required this.status,
    required this.idNumber,
    this.title,
    this.orgunitid,
    this.catidJson,
    this.attr,
    this.t,
    this.e,
  });

  factory AllDataItemModel.fromJson(Map<String, dynamic> json) {
    return AllDataItemModel(
      id: json['id'],
      version: json['version'],
      status: json['status'],
      idNumber: json['idNumber'],
      title: json['title'],
      orgunitid: json['orgunitid'],
      catidJson: json['catidJson'],
      attr: json['attr'],
      t: json['t'],
      e: json['e'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'version': version,
      'status': status,
      'idNumber': idNumber,
      'title': title,
      'orgunitid': orgunitid,
      'catidJson': catidJson,
      'attr': attr,
      't': t,
      'e': e,
    };
  }
}
