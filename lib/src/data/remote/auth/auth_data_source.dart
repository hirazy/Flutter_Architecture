import 'package:flutter_map/src/data/model/user.dart';

abstract class AuthDataSource{

  Future<User?> signIn();

  Future<void> signOut();
}