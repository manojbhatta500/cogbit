
class AllModuleListModel {
  final int totalPages;
  final List<Module> list;

  AllModuleListModel({
    required this.totalPages,
    required this.list,
  });

  factory AllModuleListModel.fromJson(Map<String, dynamic> json) {
    return AllModuleListModel(
      totalPages: json['totalPages'],
      list: List<Module>.from(json['list'].map((x) => Module.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalPages': totalPages,
      'list': List<dynamic>.from(list.map((x) => x.toJson())),
    };
  }
}

class Module {
  final String id;
  final int version;
  final String orgId;
  final String name;

  Module({
    required this.id,
    required this.version,
    required this.orgId,
    required this.name,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      version: json['version'],
      orgId: json['orgId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'version': version,
      'orgId': orgId,
      'name': name,
    };
  }
}
