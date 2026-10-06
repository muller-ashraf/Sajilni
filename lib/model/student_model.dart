class StudentModel {
  final int id;
  final String name;
  final String? mobile;
  final String? location;
  final int groupId;
  final DateTime? createdAt;
  StudentModel({
    required this.id,
    required this.name,
    this.mobile,
    this.location,
    required this.groupId,
    this.createdAt,
  });
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      mobile: json['phone'],
      location: json['location'],
      groupId: json['group_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'location': location,
      'group_id': groupId,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
