import 'package:sajilni/data/student_data_model.dart';

class GroupData {
  final String groupName;
  final List<StudentData> student;

  GroupData({required this.groupName, required this.student});
}

final List<GroupData> groupsTest = [
  GroupData(
    groupName: 'Group 1',
    student: [
      StudentData(name: 'مولر أشرف', id: 'ST001' , cityName: 'القاهرة'),
      StudentData(name: 'أحمد محمد', id: 'ST002'  , cityName: 'القاهرة'),
      StudentData(name: 'مريم سامي', id: 'ST003'  , cityName: 'القاهرة'),
    ],
  ),
  GroupData(
    groupName: 'Group 2',
    student: [
      StudentData(name: 'يوسف عادل', id: 'ST004' , cityName: 'مشطا'),
      StudentData(name: 'سارة خالد', id: 'ST005', cityName: 'مشطا'),
    ],
  ),
  GroupData(
    groupName: 'Group 3',
    student: [
      StudentData(name: 'محمد طارق', id: 'ST006' , cityName: 'القاهرة'),
      StudentData(name: 'ريم أحمد', id: 'ST007' , cityName: 'القاهرة'),
      StudentData(name: 'كريم حسن', id: 'ST008' , cityName: 'القاهرة'),
      StudentData(name: 'منة الله', id: 'ST009' , cityName: 'القاهرة'),
    ],
  ),
  GroupData(
    groupName: 'Group 4',
    student: [StudentData(name: 'مينا فادي', id: 'ST010', cityName: 'القاهرة')],
  ),
  GroupData(
    groupName: 'Group 5',
    student: [
      StudentData(name: 'بيتر جرجس', id: 'ST011', cityName: 'القاهرة'),
      StudentData(name: 'نادر سمير', id: 'ST012', cityName: 'القاهرة'),
    ],
  ),
  GroupData(groupName: 'Group 6', student: []),
  GroupData(groupName: 'Group 7', student: []),
  GroupData(groupName: 'Group 8', student: []),
  GroupData(groupName: 'Group 9', student: []),
  GroupData(groupName: 'Group 10', student: []),
];
