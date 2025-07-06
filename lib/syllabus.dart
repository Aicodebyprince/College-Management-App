import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  // Default selections so that data is fetched on startup.
  String? selectedStream = 'BSC IT';
  String? selectedYear = 'FY';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, List<Subject>> syllabus = {};
  final Set<String> _expandedSubjects = {}; // Track expanded subjects

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    if (selectedStream != null && selectedYear != null) {
      String key = '$selectedStream-$selectedYear';
      final doc = await _firestore.collection('Syllabus').doc(key).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          syllabus[key] =
              (data['subjects'] as List)
                  .map((subject) => Subject.fromMap(subject))
                  .toList();
        });
      } else {
        // If no data exists, reset the list.
        setState(() {
          syllabus[key] = [];
        });
      }
    }
  }

  Future<void> _saveAllChanges() async {
    if (selectedStream != null && selectedYear != null) {
      String key = '$selectedStream-$selectedYear';
      if (syllabus.containsKey(key)) {
        await _firestore.collection('Syllabus').doc(key).set({
          'subjects': syllabus[key]!.map((s) => s.toMap()).toList(),
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Syllabus updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  void _showAddSubjectDialog() {
    String subjectName = '';
    String subjectType = 'Theory';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add New Subject',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Subject Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    subjectName = value;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: subjectType,
                  decoration: const InputDecoration(
                    labelText: 'Subject Type',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      ['Theory', 'Practical']
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                  onChanged: (String? newValue) {
                    subjectType = newValue!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () async {
                if (subjectName.isNotEmpty &&
                    selectedStream != null &&
                    selectedYear != null) {
                  String key = '$selectedStream-$selectedYear';
                  final subject = Subject(
                    name: subjectName,
                    type: subjectType,
                    units: List.generate(
                      subjectType == 'Theory' ? 5 : 10,
                      (index) => Unit(content: '', completed: false),
                    ),
                  );

                  setState(() {
                    syllabus[key] ??= [];
                    syllabus[key]!.add(subject);
                  });

                  await _firestore.collection('Syllabus').doc(key).set({
                    'subjects': syllabus[key]!.map((s) => s.toMap()).toList(),
                  }, SetOptions(merge: true));

                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String currentKey = '$selectedStream-$selectedYear';
    List<Subject> currentSubjects = syllabus[currentKey] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teacher\'s Syllabus Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Responsive dropdowns in a row using Expanded widgets.
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: selectedStream,
                          decoration: const InputDecoration(
                            labelText: 'Select Stream',
                            border: OutlineInputBorder(),
                          ),
                          items:
                              ['BSC IT', 'BSC Data Science']
                                  .map(
                                    (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedStream = newValue;
                            });
                            _fetchData();
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: selectedYear,
                          decoration: const InputDecoration(
                            labelText: 'Select Year',
                            border: OutlineInputBorder(),
                          ),
                          items:
                              ['FY', 'SY', 'TY']
                                  .map(
                                    (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        'Year $value',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedYear = newValue;
                            });
                            _fetchData();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Center-aligned button row for Add Subject and Update.
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Add Subject Button
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: _showAddSubjectDialog,
                              icon: const Icon(Icons.add_circle_outline),
                              label: const Text(
                                'Add Subject',
                                overflow: TextOverflow.ellipsis,
                              ),
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          // Update Button
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: _saveAllChanges,
                              icon: const Icon(Icons.save),
                              label: const Text(
                                'Update',
                                overflow: TextOverflow.ellipsis,
                              ),
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Display the subjects and their units.
                  if (selectedStream != null && selectedYear != null)
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Manage Subjects and Units',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...currentSubjects.map(
                              (subject) => _buildSubjectCard(subject),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubjectCard(Subject subject) {
    final completedUnits = subject.units.where((unit) => unit.completed).length;
    final totalUnits = subject.units.length;
    final percentage = totalUnits > 0 ? (completedUnits / totalUnits) * 100 : 0;
    final completedParts = (percentage / 10).floor();

    // Generate gradient parameters
    List<Color> gradientColors = [];
    List<double> gradientStops = [];
    for (int i = 0; i < 10; i++) {
      final isCompleted = i < completedParts;
      final start = i / 10;
      final end = (i + 1) / 10;
      gradientColors.add(isCompleted ? Colors.green : Colors.white);
      gradientStops.add(start);
      gradientColors.add(isCompleted ? Colors.green : Colors.white);
      gradientStops.add(end);
    }

    bool isExpanded = _expandedSubjects.contains(subject.name);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        // Apply gradient only when not expanded
        gradient:
            !isExpanded
                ? LinearGradient(
                  colors: gradientColors,
                  stops: gradientStops,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
                : null,
        // Use white background when expanded
        color: isExpanded ? Colors.white : null,
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          key: ValueKey(subject.name), // Unique key for each subject
          onExpansionChanged: (isExpanded) {
            setState(() {
              if (isExpanded) {
                _expandedSubjects.add(subject.name);
              } else {
                _expandedSubjects.remove(subject.name);
              }
            });
          },
          title: Text(
            '${subject.name} (${subject.type})',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isExpanded ? Colors.black : Colors.black,
            ),
          ),
          subtitle: Text(
            'Completed: ${percentage.toStringAsFixed(0)}%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isExpanded ? Colors.black54 : Colors.black54,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...subject.units.asMap().entries.map((entry) {
                    int index = entry.key;
                    Unit unit = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText:
                                    subject.type == 'Theory'
                                        ? 'Unit ${index + 1}'
                                        : 'Practical ${index + 1}',
                                labelStyle: TextStyle(
                                  color:
                                      isExpanded ? Colors.black : Colors.black,
                                ),
                                filled: true,
                                fillColor:
                                    isExpanded
                                        ? Colors.transparent
                                        : Colors.grey[50],
                                border: const OutlineInputBorder(),
                              ),
                              style: TextStyle(
                                color: isExpanded ? Colors.black : Colors.black,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  unit.content = value;
                                });
                              },
                              controller: TextEditingController(
                                  text: unit.content,
                                )
                                ..selection = TextSelection.fromPosition(
                                  TextPosition(offset: unit.content.length),
                                ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Checkbox(
                            value: unit.completed,
                            onChanged: (bool? value) {
                              setState(() {
                                unit.completed = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data model for Subject.
class Subject {
  String name;
  String type;
  List<Unit> units;

  Subject({required this.name, required this.type, required this.units});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'units': units.map((unit) => unit.toMap()).toList(),
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'],
      type: map['type'],
      units: (map['units'] as List).map((unit) => Unit.fromMap(unit)).toList(),
    );
  }
}

// Data model for Unit.
class Unit {
  String content;
  bool completed;

  Unit({required this.content, required this.completed});

  Map<String, dynamic> toMap() {
    return {'content': content, 'completed': completed};
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(content: map['content'], completed: map['completed']);
  }
}
