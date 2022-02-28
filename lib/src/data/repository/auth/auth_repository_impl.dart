import 'package:flutter_map/src/data/model/result.dart';
import 'package:flutter_map/src/data/model/user.dart';
import 'package:flutter_map/src/data/remote/auth/auth_data_source.dart';
import 'package:flutter_map/src/data/repository/auth/auth_repository.dart';

class AuthRepositoryImplement implements AuthRepository{

  late final AuthDataSource? _auth;

  AuthRepositoryImplement(AuthDataSource? auth){
    this._auth = auth;
  }

  @override
  Future<Result<User>> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }


  // @override
  // Future<Result<User>> signIn() async{
  //   return await Result.guardFuture( _auth!.signIn());
  // }
  //
  // @override
  // Future<Result<void>> signOut() async{
  //   return await Result.guardFuture( _auth!.signOut());
  // }

}