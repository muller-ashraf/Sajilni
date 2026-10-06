import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sajilni/model/student_model.dart';

class StudentRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  StudentRepository();

  // Get all students in a specific group
  Future<List<StudentModel>> getStudentsByGroup(int groupId) async {
    final response = await supabase
        .from('students')
        .select()
        .eq('group_id', groupId);

    return (response as List)
        .map((json) => StudentModel.fromJson(json))
        .toList();
  }

  // Add a new student to a group
  Future<void> addStudent({
    required String name,
    String? mobile,
    String? location,
    required int groupId,
  }) async {
    await supabase.from('students').insert({
      'name': name,
      'phone': mobile,
      'location': location,
      'group_id': groupId,
    });
  }

  // Delete a student
  Future<void> deleteStudent(int studentId) async {
    await supabase
        .from('students')
        .delete()
        .eq('id', studentId);
  }
}

