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

  final _$usernameAtom = Atom(name: '_PersonalDetailsViewModel.username');

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

  final _$emailAtom = Atom(name: '_PersonalDetailsViewModel.email');

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

  final _$customerDetailsAtom =
      Atom(name: '_PersonalDetailsViewModel.customerDetails');

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

  final _$errorMessageAtom =
      Atom(name: '_PersonalDetailsViewModel.errorMessage');

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
      Atom(name: '_PersonalDetailsViewModel.isLoadingForLogin');

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

  final _$isLoadingAtom = Atom(name: '_PersonalDetailsViewModel.isLoading');

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

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_PersonalDetailsViewModel.signInWithGoogle');

  @override
  Future<dynamic> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$_PersonalDetailsViewModelActionController =
      ActionController(name: '_PersonalDetailsViewModel');

  @override
  dynamic setUserName(String usename) {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.setUserName');
    try {
      return super.setUserName(usename);
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setemial(String emial) {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.setemial');
    try {
      return super.setemial(emial);
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateUsername(String text) {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.validateUsername');
    try {
      return super.validateUsername(text);
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassword(String text) {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.validatePassword');
    try {
      return super.validatePassword(text);
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
username: ${username},
email: ${email},
customerDetails: ${customerDetails},
loginStatus: ${loginStatus},
errorMessage: ${errorMessage},
isLoadingForLogin: ${isLoadingForLogin},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$PersonalDetailsErrorState on _PersonalDetailsErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_PersonalDetailsErrorState.hasErrors'))
          .value;

  final _$usernameAtom = Atom(name: '_PersonalDetailsErrorState.username');

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

  final _$emailAtom = Atom(name: '_PersonalDetailsErrorState.email');

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

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
hasErrors: ${hasErrors}
    ''';
  }
}
