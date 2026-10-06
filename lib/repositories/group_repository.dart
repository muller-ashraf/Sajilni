import 'package:sajilni/model/groups_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupRepository {
  final SupabaseClient supabaseClient;

  GroupRepository(this.supabaseClient);
  Future<List<GroupsModel>> getGroups() async {
    final response = await supabaseClient.from('groups').select();
    
      return (response as List)
        .map((json) => GroupsModel.fromJson(json))
        .toList();
  }
}
