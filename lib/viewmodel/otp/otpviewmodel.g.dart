// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otpviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OtpViewModel on _OtpViewModel, Store {
  final _$isLoadingAtom = Atom(name: '_OtpViewModel.isLoading');

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

  final _$isSuccessAtom = Atom(name: '_OtpViewModel.isSuccess');

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  final _$mobileVerificationAsyncAction =
      AsyncAction('_OtpViewModel.mobileVerification');

  @override
  Future<bool> mobileVerification(String mobile, String otp) {
    return _$mobileVerificationAsyncAction
        .run(() => super.mobileVerification(mobile, otp));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSuccess: ${isSuccess}
    ''';
  }
}
