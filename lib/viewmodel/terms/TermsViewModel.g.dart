// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TermsViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TermsViewModel on _TermsViewModel, Store {
  final _$isLoadingAtom = Atom(name: '_TermsViewModel.isLoading');

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

  final _$termsModelAtom = Atom(name: '_TermsViewModel.termsModel');

  @override
  TermsModel get termsModel {
    _$termsModelAtom.reportRead();
    return super.termsModel;
  }

  @override
  set termsModel(TermsModel value) {
    _$termsModelAtom.reportWrite(value, super.termsModel, () {
      super.termsModel = value;
    });
  }

  final _$getTermsAsyncAction = AsyncAction('_TermsViewModel.getTerms');

  @override
  Future<dynamic> getTerms() {
    return _$getTermsAsyncAction.run(() => super.getTerms());
  }

  final _$getAboutAsyncAction = AsyncAction('_TermsViewModel.getAbout');

  @override
  Future<dynamic> getAbout() {
    return _$getAboutAsyncAction.run(() => super.getAbout());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
termsModel: ${termsModel}
    ''';
  }
}
