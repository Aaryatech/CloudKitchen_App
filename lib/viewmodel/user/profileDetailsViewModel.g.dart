// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileDetailsViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileDetailsViewModel on _ProfileDetailsViewModel, Store {
  final _$resultAtom = Atom(name: '_ProfileDetailsViewModel.result');

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

  final _$usernameAtom = Atom(name: '_ProfileDetailsViewModel.username');

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

  final _$emailAtom = Atom(name: '_ProfileDetailsViewModel.email');

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

  final _$phoneNumberAtom = Atom(name: '_ProfileDetailsViewModel.phoneNumber');

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

  final _$addressAtom = Atom(name: '_ProfileDetailsViewModel.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$custDobAtom = Atom(name: '_ProfileDetailsViewModel.custDob');

  @override
  DateTime get custDob {
    _$custDobAtom.reportRead();
    return super.custDob;
  }

  @override
  set custDob(DateTime value) {
    _$custDobAtom.reportWrite(value, super.custDob, () {
      super.custDob = value;
    });
  }

  final _$genderAtom = Atom(name: '_ProfileDetailsViewModel.gender');

  @override
  int get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(int value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$customerDetailsAtom =
      Atom(name: '_ProfileDetailsViewModel.customerDetails');

  @override
  SaveUser get customerDetails {
    _$customerDetailsAtom.reportRead();
    return super.customerDetails;
  }

  @override
  set customerDetails(SaveUser value) {
    _$customerDetailsAtom.reportWrite(value, super.customerDetails, () {
      super.customerDetails = value;
    });
  }

  final _$loginStatusAtom = Atom(name: '_ProfileDetailsViewModel.loginStatus');

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

  final _$errorMessageAtom =
      Atom(name: '_ProfileDetailsViewModel.errorMessage');

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
      Atom(name: '_ProfileDetailsViewModel.isLoadingForLogin');

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

  final _$isLoadingAtom = Atom(name: '_ProfileDetailsViewModel.isLoading');

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

  final _$_ProfileDetailsViewModelActionController =
      ActionController(name: '_ProfileDetailsViewModel');

  @override
  String getCusPhone() {
    final _$actionInfo = _$_ProfileDetailsViewModelActionController.startAction(
        name: '_ProfileDetailsViewModel.getCusPhone');
    try {
      return super.getCusPhone();
    } finally {
      _$_ProfileDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getCustID() {
    final _$actionInfo = _$_ProfileDetailsViewModelActionController.startAction(
        name: '_ProfileDetailsViewModel.getCustID');
    try {
      return super.getCustID();
    } finally {
      _$_ProfileDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateUsername(String text) {
    final _$actionInfo = _$_ProfileDetailsViewModelActionController.startAction(
        name: '_ProfileDetailsViewModel.validateUsername');
    try {
      return super.validateUsername(text);
    } finally {
      _$_ProfileDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassword(String text) {
    final _$actionInfo = _$_ProfileDetailsViewModelActionController.startAction(
        name: '_ProfileDetailsViewModel.validatePassword');
    try {
      return super.validatePassword(text);
    } finally {
      _$_ProfileDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePhoneNumber(String text) {
    final _$actionInfo = _$_ProfileDetailsViewModelActionController.startAction(
        name: '_ProfileDetailsViewModel.validatePhoneNumber');
    try {
      return super.validatePhoneNumber(text);
    } finally {
      _$_ProfileDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
username: ${username},
email: ${email},
phoneNumber: ${phoneNumber},
address: ${address},
custDob: ${custDob},
gender: ${gender},
customerDetails: ${customerDetails},
loginStatus: ${loginStatus},
errorMessage: ${errorMessage},
isLoadingForLogin: ${isLoadingForLogin},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$ProfileDetailsErrorState on _ProfileDetailsErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ProfileDetailsErrorState.hasErrors'))
          .value;

  final _$usernameAtom = Atom(name: '_ProfileDetailsErrorState.username');

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

  final _$emailAtom = Atom(name: '_ProfileDetailsErrorState.email');

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

  final _$phoneNumberAtom = Atom(name: '_ProfileDetailsErrorState.phoneNumber');

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

  final _$addressAtom = Atom(name: '_ProfileDetailsErrorState.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$genderAtom = Atom(name: '_ProfileDetailsErrorState.gender');

  @override
  int get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(int value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
phoneNumber: ${phoneNumber},
address: ${address},
gender: ${gender},
hasErrors: ${hasErrors}
    ''';
  }
}
