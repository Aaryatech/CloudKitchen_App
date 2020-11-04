// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AllFrenchisiViewModel on _AllFrenchisiViewModel, Store {
  final _$itemsAtom = Atom(name: '_AllFrenchisiViewModel.items');

  @override
  List<CartItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<CartItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$itemsIdsAtom = Atom(name: '_AllFrenchisiViewModel.itemsIds');

  @override
  List<int> get itemsIds {
    _$itemsIdsAtom.reportRead();
    return super.itemsIds;
  }

  @override
  set itemsIds(List<int> value) {
    _$itemsIdsAtom.reportWrite(value, super.itemsIds, () {
      super.itemsIds = value;
    });
  }

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

  final _$isLoadingForFranchiseDataAtom =
      Atom(name: '_AllFrenchisiViewModel.isLoadingForFranchiseData');

  @override
  bool get isLoadingForFranchiseData {
    _$isLoadingForFranchiseDataAtom.reportRead();
    return super.isLoadingForFranchiseData;
  }

  @override
  set isLoadingForFranchiseData(bool value) {
    _$isLoadingForFranchiseDataAtom
        .reportWrite(value, super.isLoadingForFranchiseData, () {
      super.isLoadingForFranchiseData = value;
    });
  }

  final _$loadingMessageAtom =
      Atom(name: '_AllFrenchisiViewModel.loadingMessage');

  @override
  String get loadingMessage {
    _$loadingMessageAtom.reportRead();
    return super.loadingMessage;
  }

  @override
  set loadingMessage(String value) {
    _$loadingMessageAtom.reportWrite(value, super.loadingMessage, () {
      super.loadingMessage = value;
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

  final _$frainchiseHomeDataAtom =
      Atom(name: '_AllFrenchisiViewModel.frainchiseHomeData');

  @override
  FranchiseId get frainchiseHomeData {
    _$frainchiseHomeDataAtom.reportRead();
    return super.frainchiseHomeData;
  }

  @override
  set frainchiseHomeData(FranchiseId value) {
    _$frainchiseHomeDataAtom.reportWrite(value, super.frainchiseHomeData, () {
      super.frainchiseHomeData = value;
    });
  }

  final _$distanceMatrixAtom =
      Atom(name: '_AllFrenchisiViewModel.distanceMatrix');

  @override
  DistanceMatrix get distanceMatrix {
    _$distanceMatrixAtom.reportRead();
    return super.distanceMatrix;
  }

  @override
  set distanceMatrix(DistanceMatrix value) {
    _$distanceMatrixAtom.reportWrite(value, super.distanceMatrix, () {
      super.distanceMatrix = value;
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

  final _$sortFranchiseByKmAsyncAction =
      AsyncAction('_AllFrenchisiViewModel.sortFranchiseByKm');

  @override
  Future<dynamic> sortFranchiseByKm() {
    return _$sortFranchiseByKmAsyncAction.run(() => super.sortFranchiseByKm());
  }

  final _$_AllFrenchisiViewModelActionController =
      ActionController(name: '_AllFrenchisiViewModel');

  @override
  dynamic addCartItem(CartItem item) {
    final _$actionInfo = _$_AllFrenchisiViewModelActionController.startAction(
        name: '_AllFrenchisiViewModel.addCartItem');
    try {
      return super.addCartItem(item);
    } finally {
      _$_AllFrenchisiViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic lookforNearestFranchise() {
    final _$actionInfo = _$_AllFrenchisiViewModelActionController.startAction(
        name: '_AllFrenchisiViewModel.lookforNearestFranchise');
    try {
      return super.lookforNearestFranchise();
    } finally {
      _$_AllFrenchisiViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getOffersandAdditionalCharge() {
    final _$actionInfo = _$_AllFrenchisiViewModelActionController.startAction(
        name: '_AllFrenchisiViewModel.getOffersandAdditionalCharge');
    try {
      return super.getOffersandAdditionalCharge();
    } finally {
      _$_AllFrenchisiViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
itemsIds: ${itemsIds},
isLoading: ${isLoading},
isLoadingForFranchiseData: ${isLoadingForFranchiseData},
loadingMessage: ${loadingMessage},
frainchise: ${frainchise},
frainchiseHomeData: ${frainchiseHomeData},
distanceMatrix: ${distanceMatrix},
frainchiseMain: ${frainchiseMain},
error: ${error}
    ''';
  }
}
