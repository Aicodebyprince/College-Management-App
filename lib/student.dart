class Student {
  final String name;
  final int rollNo;
  final String year;
  final String email;
  final String stream;
  final String streamYear;
  bool isPresent;

  Student({
    required this.name,
    required this.rollNo,
    required this.year,
    this.email = '',
    required this.stream,
    this.streamYear = '',
    this.isPresent = false,
  });

  // Add the factory constructor here
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? 'Unknown',
      rollNo: map['rollNo'] ?? 0,
      year: map['year'] ?? 'N/A',
      email: map['email'] ?? '',
      stream: map['stream'] ?? 'N/A',
      streamYear: map['streamyear'] ?? 'N/A',
      isPresent: map['isPresent'] ?? false,
    );
  }

  // Keep your existing toMap method
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rollNo': rollNo,
      'year': year,
      'email': email,
      'stream': stream,
      'isPresent': isPresent,
      'streamYear': streamYear,
    };
  }
}
