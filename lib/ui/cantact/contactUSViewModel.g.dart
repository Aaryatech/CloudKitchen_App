// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactUSViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactUSViewModel on _ContactUSViewModel, Store {
  final _$resultAtom = Atom(name: '_ContactUSViewModel.result');

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

  final _$httpResponseMianAtom =
      Atom(name: '_ContactUSViewModel.httpResponseMian');

  @override
  HttpResponse get httpResponseMian {
    _$httpResponseMianAtom.reportRead();
    return super.httpResponseMian;
  }

  @override
  set httpResponseMian(HttpResponse value) {
    _$httpResponseMianAtom.reportWrite(value, super.httpResponseMian, () {
      super.httpResponseMian = value;
    });
  }

  final _$errorAtom = Atom(name: '_ContactUSViewModel.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$customerDetailsAtom =
      Atom(name: '_ContactUSViewModel.customerDetails');

  @override
  ContactUs get customerDetails {
    _$customerDetailsAtom.reportRead();
    return super.customerDetails;
  }

  @override
  set customerDetails(ContactUs value) {
    _$customerDetailsAtom.reportWrite(value, super.customerDetails, () {
      super.customerDetails = value;
    });
  }

  final _$loginStatusAtom = Atom(name: '_ContactUSViewModel.loginStatus');

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

  final _$errorMessageAtom = Atom(name: '_ContactUSViewModel.errorMessage');

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
      Atom(name: '_ContactUSViewModel.isLoadingForLogin');

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

  final _$isLoadingAtom = Atom(name: '_ContactUSViewModel.isLoading');

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

  final _$getCusPhoneAsyncAction =
      AsyncAction('_ContactUSViewModel.getCusPhone');

  @override
  Future<String> getCusPhone() {
    return _$getCusPhoneAsyncAction.run(() => super.getCusPhone());
  }

  final _$_ContactUSViewModelActionController =
      ActionController(name: '_ContactUSViewModel');

  @override
  dynamic validateUsername(String text) {
    final _$actionInfo = _$_ContactUSViewModelActionController.startAction(
        name: '_ContactUSViewModel.validateUsername');
    try {
      return super.validateUsername(text);
    } finally {
      _$_ContactUSViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateMessage(String text) {
    final _$actionInfo = _$_ContactUSViewModelActionController.startAction(
        name: '_ContactUSViewModel.validateMessage');
    try {
      return super.validateMessage(text);
    } finally {
      _$_ContactUSViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEmail(String text) {
    final _$actionInfo = _$_ContactUSViewModelActionController.startAction(
        name: '_ContactUSViewModel.validateEmail');
    try {
      return super.validateEmail(text);
    } finally {
      _$_ContactUSViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePhone(String text) {
    final _$actionInfo = _$_ContactUSViewModelActionController.startAction(
        name: '_ContactUSViewModel.validatePhone');
    try {
      return super.validatePhone(text);
    } finally {
      _$_ContactUSViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
httpResponseMian: ${httpResponseMian},
error: ${error},
customerDetails: ${customerDetails},
loginStatus: ${loginStatus},
errorMessage: ${errorMessage},
isLoadingForLogin: ${isLoadingForLogin},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$ContactUSErrorState on _ContactUSErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ContactUSErrorState.hasErrors'))
          .value;

  final _$usernameAtom = Atom(name: '_ContactUSErrorState.username');

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

  final _$emailAtom = Atom(name: '_ContactUSErrorState.email');

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

  final _$phoneNumberAtom = Atom(name: '_ContactUSErrorState.phoneNumber');

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

  final _$messageAtom = Atom(name: '_ContactUSErrorState.message');

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

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
phoneNumber: ${phoneNumber},
message: ${message},
hasErrors: ${hasErrors}
    ''';
  }
}
