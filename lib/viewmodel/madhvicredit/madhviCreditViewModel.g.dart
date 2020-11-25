// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'madhviCreditViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MadhviCreditViewModel on _MadhviCreditViewModel, Store {
  final _$resultAtom = Atom(name: '_MadhviCreditViewModel.result');

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

  final _$usernameAtom = Atom(name: '_MadhviCreditViewModel.username');

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

  final _$totalAtom = Atom(name: '_MadhviCreditViewModel.total');

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$emailAtom = Atom(name: '_MadhviCreditViewModel.email');

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

  final _$phoneNumberAtom = Atom(name: '_MadhviCreditViewModel.phoneNumber');

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

  final _$messageAtom = Atom(name: '_MadhviCreditViewModel.message');

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

  final _$madhviCreditListAtom =
      Atom(name: '_MadhviCreditViewModel.madhviCreditList');

  @override
  MadhviCreditList get madhviCreditList {
    _$madhviCreditListAtom.reportRead();
    return super.madhviCreditList;
  }

  @override
  set madhviCreditList(MadhviCreditList value) {
    _$madhviCreditListAtom.reportWrite(value, super.madhviCreditList, () {
      super.madhviCreditList = value;
    });
  }

  final _$loginStatusAtom = Atom(name: '_MadhviCreditViewModel.loginStatus');

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

  final _$errorMessageAtom = Atom(name: '_MadhviCreditViewModel.errorMessage');

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
      Atom(name: '_MadhviCreditViewModel.isLoadingForLogin');

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

  final _$isLoadingAtom = Atom(name: '_MadhviCreditViewModel.isLoading');

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

  final _$_MadhviCreditViewModelActionController =
      ActionController(name: '_MadhviCreditViewModel');

  @override
  int getCusId() {
    final _$actionInfo = _$_MadhviCreditViewModelActionController.startAction(
        name: '_MadhviCreditViewModel.getCusId');
    try {
      return super.getCusId();
    } finally {
      _$_MadhviCreditViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
username: ${username},
total: ${total},
email: ${email},
phoneNumber: ${phoneNumber},
message: ${message},
madhviCreditList: ${madhviCreditList},
loginStatus: ${loginStatus},
errorMessage: ${errorMessage},
isLoadingForLogin: ${isLoadingForLogin},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$MadhviCreditErrorState on _MadhviCreditErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_MadhviCreditErrorState.hasErrors'))
          .value;

  final _$usernameAtom = Atom(name: '_MadhviCreditErrorState.username');

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

  final _$emailAtom = Atom(name: '_MadhviCreditErrorState.email');

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

  final _$phoneNumberAtom = Atom(name: '_MadhviCreditErrorState.phoneNumber');

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

  final _$messageAtom = Atom(name: '_MadhviCreditErrorState.message');

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

  final _$madhviCreditListAtom =
      Atom(name: '_MadhviCreditErrorState.madhviCreditList');

  @override
  MadhviCreditList get madhviCreditList {
    _$madhviCreditListAtom.reportRead();
    return super.madhviCreditList;
  }

  @override
  set madhviCreditList(MadhviCreditList value) {
    _$madhviCreditListAtom.reportWrite(value, super.madhviCreditList, () {
      super.madhviCreditList = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
phoneNumber: ${phoneNumber},
message: ${message},
madhviCreditList: ${madhviCreditList},
hasErrors: ${hasErrors}
    ''';
  }
}
