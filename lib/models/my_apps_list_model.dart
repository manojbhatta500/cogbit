
class MyAppListModule {
  final int totalPages;
  final List<Module> list;

  MyAppListModule({
    required this.totalPages,
    required this.list,
  });

  factory MyAppListModule.fromJson(Map<String, dynamic> json) {
    return MyAppListModule(
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
  final String name;
  final String moduleName;
  final String description;
  final bool active;

  Module({
    required this.id,
    required this.name,
    required this.moduleName,
    required this.description,
    required this.active,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      name: json['name'],
      moduleName: json['moduleName'],
      description: json['description'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'moduleName': moduleName,
      'description': description,
      'active': active,
    };
  }
}

