// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AllFrenchisiViewModel on _AllFrenchisiViewModel, Store {
  final _$isLoadingAtom = Atom(name: '_AllFrenchisiViewModel.isLoading');

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

  final _$frainchiseAtom = Atom(name: '_AllFrenchisiViewModel.frainchise');

  @override
  List<Frainchise> get frainchise {
    _$frainchiseAtom.reportRead();
    return super.frainchise;
  }

  @override
  set frainchise(List<Frainchise> value) {
    _$frainchiseAtom.reportWrite(value, super.frainchise, () {
      super.frainchise = value;
    });
  }

  final _$frainchiseMainAtom =
      Atom(name: '_AllFrenchisiViewModel.frainchiseMain');

  @override
  FranchiseMain get frainchiseMain {
    _$frainchiseMainAtom.reportRead();
    return super.frainchiseMain;
  }

  @override
  set frainchiseMain(FranchiseMain value) {
    _$frainchiseMainAtom.reportWrite(value, super.frainchiseMain, () {
      super.frainchiseMain = value;
    });
  }

  final _$errorAtom = Atom(name: '_AllFrenchisiViewModel.error');

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

  final _$getAllFranchiseAsyncAction =
      AsyncAction('_AllFrenchisiViewModel.getAllFranchise');

  @override
  Future<dynamic> getAllFranchise() {
    return _$getAllFranchiseAsyncAction.run(() => super.getAllFranchise());
  }

  final _$_AllFrenchisiViewModelActionController =
      ActionController(name: '_AllFrenchisiViewModel');

  @override
  Future<dynamic> sortFranchiseByKm() {
    final _$actionInfo = _$_AllFrenchisiViewModelActionController.startAction(
        name: '_AllFrenchisiViewModel.sortFranchiseByKm');
    try {
      return super.sortFranchiseByKm();
    } finally {
      _$_AllFrenchisiViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
frainchise: ${frainchise},
frainchiseMain: ${frainchiseMain},
error: ${error}
    ''';
  }
}
