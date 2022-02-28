import 'package:flutter_map/src/data/model/result.dart';
import 'package:flutter_map/src/data/model/user.dart';

abstract class AuthRepository{
  Future<Result<User>> signIn();

  Future<Result<void>> signOut();
}