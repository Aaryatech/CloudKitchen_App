// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personaldetailsviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PersonalDetailsViewModel on _PersonalDetailsViewModel, Store {
  final _$resultAtom = Atom(name: '_PersonalDetailsViewModel.result');

  @override
  UserCredential get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(UserCredential value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$loginStatusAtom = Atom(name: '_PersonalDetailsViewModel.loginStatus');

  @override
  bool get loginStatus {
    _$loginStatusAtom.reportRead();
    return super.loginStatus;
  }

  @override
  set loginStatus(bool value) {
    _$loginStatusAtom.reportWrite(value, super.loginStatus, () {
      super.loginStatus = value;
    });
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_PersonalDetailsViewModel.signInWithGoogle');

  @override
  Future<String> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  @override
  String toString() {
    return '''
result: ${result},
loginStatus: ${loginStatus}
    ''';
  }
}
