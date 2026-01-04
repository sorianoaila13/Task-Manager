class Task {
  final String id;
  final String title;
  final String description;
  final String status;
  final DateTime? dueDate;
  final String categoryId;
  final Map<String, dynamic>? category; // For populated category

  Task({
    required this.id,
    required this.title,
    this.description = '',
    required this.status,
    this.dueDate,
    required this.categoryId,
    this.category,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      title: json['title'],
      description: json['description'] ?? '',
      status: json['status'],
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      categoryId: json['categoryId'] is String 
          ? json['categoryId'] 
          : (json['categoryId']['_id'] ?? ''),
      category: json['categoryId'] is Map<String, dynamic> ? json['categoryId'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'dueDate': dueDate?.toIso8601String(),
      'categoryId': categoryId,
    };
  }
}
