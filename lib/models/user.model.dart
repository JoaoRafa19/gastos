import 'package:uuid/uuid.dart';

class User {
  User({required this.username, this.id}) {
    id ??= const Uuid().v4();
  }

  final String username;
  late final String? id;
}
