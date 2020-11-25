// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greivanceViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GreivanceViewModel on _GreivanceViewModel, Store {
  final _$resultAtom = Atom(name: '_GreivanceViewModel.result');

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

  final _$usernameAtom = Atom(name: '_GreivanceViewModel.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$emailAtom = Atom(name: '_GreivanceViewModel.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_GreivanceViewModel.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$messageAtom = Atom(name: '_GreivanceViewModel.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$grievanceListMainAtom =
      Atom(name: '_GreivanceViewModel.grievanceListMain');

  @override
  GrievanceListMain get grievanceListMain {
    _$grievanceListMainAtom.reportRead();
    return super.grievanceListMain;
  }

  @override
  set grievanceListMain(GrievanceListMain value) {
    _$grievanceListMainAtom.reportWrite(value, super.grievanceListMain, () {
      super.grievanceListMain = value;
    });
  }

  final _$loginStatusAtom = Atom(name: '_GreivanceViewModel.loginStatus');

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

  final _$errorMessageAtom = Atom(name: '_GreivanceViewModel.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$isLoadingForLoginAtom =
      Atom(name: '_GreivanceViewModel.isLoadingForLogin');

  @override
  bool get isLoadingForLogin {
    _$isLoadingForLoginAtom.reportRead();
    return super.isLoadingForLogin;
  }

  @override
  set isLoadingForLogin(bool value) {
    _$isLoadingForLoginAtom.reportWrite(value, super.isLoadingForLogin, () {
      super.isLoadingForLogin = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_GreivanceViewModel.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_GreivanceViewModelActionController =
      ActionController(name: '_GreivanceViewModel');

  @override
  int getCusId() {
    final _$actionInfo = _$_GreivanceViewModelActionController.startAction(
        name: '_GreivanceViewModel.getCusId');
    try {
      return super.getCusId();
    } finally {
      _$_GreivanceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
username: ${username},
email: ${email},
phoneNumber: ${phoneNumber},
message: ${message},
grievanceListMain: ${grievanceListMain},
loginStatus: ${loginStatus},
errorMessage: ${errorMessage},
isLoadingForLogin: ${isLoadingForLogin},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$GreivanceErrorState on _GreivanceErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_GreivanceErrorState.hasErrors'))
          .value;

  final _$usernameAtom = Atom(name: '_GreivanceErrorState.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$emailAtom = Atom(name: '_GreivanceErrorState.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_GreivanceErrorState.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$messageAtom = Atom(name: '_GreivanceErrorState.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$grievanceListAtom = Atom(name: '_GreivanceErrorState.grievanceList');

  @override
  GrievanceList get grievanceList {
    _$grievanceListAtom.reportRead();
    return super.grievanceList;
  }

  @override
  set grievanceList(GrievanceList value) {
    _$grievanceListAtom.reportWrite(value, super.grievanceList, () {
      super.grievanceList = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
phoneNumber: ${phoneNumber},
message: ${message},
grievanceList: ${grievanceList},
hasErrors: ${hasErrors}
    ''';
  }
}
