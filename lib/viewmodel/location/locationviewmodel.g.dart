// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddLocationViewModel on _AddLocationViewModel, Store {
  final _$isLoadingAtom = Atom(name: '_AddLocationViewModel.isLoading');

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

  final _$msgAtom = Atom(name: '_AddLocationViewModel.msg');

  @override
  String get msg {
    _$msgAtom.reportRead();
    return super.msg;
  }

  @override
  set msg(String value) {
    _$msgAtom.reportWrite(value, super.msg, () {
      super.msg = value;
    });
  }

  final _$_AddLocationViewModelActionController =
      ActionController(name: '_AddLocationViewModel');

  @override
  int getCustId() {
    final _$actionInfo = _$_AddLocationViewModelActionController.startAction(
        name: '_AddLocationViewModel.getCustId');
    try {
      return super.getCustId();
    } finally {
      _$_AddLocationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
msg: ${msg}
    ''';
  }
}
