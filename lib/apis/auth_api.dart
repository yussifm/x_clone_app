import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:x_clone_app/core/provider.dart';

import '../core/core.dart';

final authAPIProvider = Provider((ref) {
  var account = ref.watch(appwriteAccountProvider);
  return AuthAPI(
    account: account,
  );
});

abstract class IAuthAPI {
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  });
  FutureEither<model.Session> signIn({
    required String email,
    required String password,
  });

  Future<model.User?> currentUserAccount();
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return Left(
          Failure(e.message ?? "Unexpected Error Occurred", stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<model.Session> signIn(
      {required String email, required String password}) async {
    try {
      final account = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return Left(
          Failure(e.message ?? "Unexpected Error Occurred", stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<model.User?> currentUserAccount() async {
    try {
      final account = await _account.get();
      return account;
    } on AppwriteException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
