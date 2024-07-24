class AllDataHeadingModel {
  final List<Item> items;

  AllDataHeadingModel({required this.items});

  factory AllDataHeadingModel.fromJson(Map<String, dynamic> json) {
    print('Received JSON: $json');
    
    // Check if the 'ka' key exists and is not null
    final List<dynamic>? itemJson = json['ka'];
    if (itemJson == null) {
      throw Exception('The key "ka" does not exist or is null in the JSON');
    }

    // Map the items to the Item model
    final List<Item> items = itemJson.map((item) {
      return Item.fromJson(item as Map<String, dynamic>);
    }).toList();

    return AllDataHeadingModel(items: items);
  }

  Map<String, dynamic> toJson() {
    // Map items back to JSON
    final List<Map<String, dynamic>> itemJson = items.map((item) => item.toJson()).toList();

    return {
      'ka': itemJson,
    };
  }
}

class Item {
  final String k;
  final String d;

  Item({required this.k, required this.d});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      k: json['k'] ?? '',
      d: json['d'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'k': k,
      'd': d,
    };
  }
}
