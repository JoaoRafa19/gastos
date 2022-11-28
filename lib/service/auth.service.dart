import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository._();

  static final AuthRepository instance = AuthRepository._();
  static Future<Session?> loginWithUserPassword(
      String login, String password) async {
    final response = await Supabase.instance.client.auth
        .signInWithPassword(password: password, email: login);
    if(response.session != null){
      
    }
    return response.session;
  }

  static Future<Session?> signUp(
      String login, String password, Map<String, dynamic>? data) async {
    final response = await Supabase.instance.client.auth
        .signUp(password: password, email: login, data: data);
    return response.session;
  }
}
