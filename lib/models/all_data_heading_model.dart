class AllDataHeadingModel {
  final List<Group> groups;

  AllDataHeadingModel({required this.groups});

  factory AllDataHeadingModel.fromJson(Map<String, dynamic> json) {
    return AllDataHeadingModel(
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groups': groups.map((e) => e.toJson()).toList(),
    };
  }
}

class Group {
  final List<Detail> r;
  final String g; // This corresponds to code
  final String n; // This corresponds to name

  Group({required this.r, required this.g, required this.n});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      r: (json['r'] as List<dynamic>?)
              ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
              .toList() ?? [],
      g: json['g'] as String,
      n: json['n'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'r': r.map((e) => e.toJson()).toList(),
      'g': g,
      'n': n,
    };
  }

  // Add these getters to provide 'name' and 'code' properties
  String get name => n;
  String get code => g;
}

class Detail {
  final String t;
  final List<Field> isFields;

  Detail({
    required this.t,
    required this.isFields,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      t: json['t'] as String,
      isFields: (json['is'] as List<dynamic>?)
                  ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
                  .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      't': t,
      'is': isFields.map((e) => e.toJson()).toList(),
    };
  }
}

class Field {
  final String t;
  final String v;
  final ValueAttributes va;
  final String l;
  final String n;
  final int? w;
  final int? h;

  Field({
    required this.t,
    required this.v,
    required this.va,
    required this.l,
    required this.n,
    this.w,
    this.h,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      t: json['t'] as String,
      v: json['v'].toString(),
      va: ValueAttributes.fromJson(json['va'] as Map<String, dynamic>),
      l: json['l'] as String,
      n: json['n'] as String,
      w: json['w'] as int?,
      h: json['h'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      't': t,
      'v': v,
      'va': va.toJson(),
      'l': l,
      'n': n,
      'w': w,
      'h': h,
    };
  }
}

class ValueAttributes {
  final bool r;
  final int? mx;
  final int? m;
  final int? mxl;
  final int? mn;

  ValueAttributes({
    required this.r,
    this.mx,
    this.m,
    this.mxl,
    this.mn,
  });

  factory ValueAttributes.fromJson(Map<String, dynamic> json) {
    return ValueAttributes(
      r: json['r'] as bool,
      mx: json['mx'] as int?,
      m: json['m'] as int?,
      mxl: json['mxl'] as int?,
      mn: json['mn'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'r': r,
      'mx': mx,
      'm': m,
      'mxl': mxl,
      'mn': mn,
    };
  }
}

class Option {
  final String v;
  final String k;

  Option({required this.v, required this.k});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      v: json['v'] as String,
      k: json['k'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'v': v,
      'k': k,
    };
  }
}
