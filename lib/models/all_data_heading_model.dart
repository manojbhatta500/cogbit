import 'dart:convert';

class AllDataHeadingModel {
  final String? someField;
  final String? anotherField;
  final List<Group>? groups;

  AllDataHeadingModel({
    this.someField,
    this.anotherField,
    this.groups,
  });

  factory AllDataHeadingModel.fromJson(Map<String, dynamic> json) {
    return AllDataHeadingModel(
      someField: json['someField'] as String?,
      anotherField: json['anotherField'] as String?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'someField': someField,
      'anotherField': anotherField,
      'groups': groups?.map((e) => e.toJson()).toList(),
    };
  }
}

class Group {
  final String? name;
  final List<Section>? sections;

  Group({
    this.name,
    this.sections,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'] as String?,
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sections': sections?.map((e) => e.toJson()).toList(),
    };
  }
}

class Section {
  final String? title;
  final List<Field>? fields;

  Section({
    this.title,
    this.fields,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'] as String?,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'fields': fields?.map((e) => e.toJson()).toList(),
    };
  }
}

class Field {
  final String? type;
  final String? value;
  final Map<String, dynamic>? additionalInfo;

  Field({
    this.type,
    this.value,
    this.additionalInfo,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      type: json['type'] as String?,
      value: json['value'] as String?,
      additionalInfo: json['additionalInfo'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
      'additionalInfo': additionalInfo,
    };
  }
}
