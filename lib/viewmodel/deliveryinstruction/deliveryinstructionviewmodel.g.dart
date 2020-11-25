// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveryinstructionviewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DIViewModel on _DIViewModel, Store {
  final _$deliveryInstructionMainAtom =
      Atom(name: '_DIViewModel.deliveryInstructionMain');

  @override
  DeliveryInstructionMain get deliveryInstructionMain {
    _$deliveryInstructionMainAtom.reportRead();
    return super.deliveryInstructionMain;
  }

  @override
  set deliveryInstructionMain(DeliveryInstructionMain value) {
    _$deliveryInstructionMainAtom
        .reportWrite(value, super.deliveryInstructionMain, () {
      super.deliveryInstructionMain = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_DIViewModel.isLoading');

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

  final _$selectedAtom = Atom(name: '_DIViewModel.selected');

  @override
  int get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(int value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$selectedResonAtom = Atom(name: '_DIViewModel.selectedReson');

  @override
  String get selectedReson {
    _$selectedResonAtom.reportRead();
    return super.selectedReson;
  }

  @override
  set selectedReson(String value) {
    _$selectedResonAtom.reportWrite(value, super.selectedReson, () {
      super.selectedReson = value;
    });
  }

  final _$_DIViewModelActionController = ActionController(name: '_DIViewModel');

  @override
  int getCusId() {
    final _$actionInfo = _$_DIViewModelActionController.startAction(
        name: '_DIViewModel.getCusId');
    try {
      return super.getCusId();
    } finally {
      _$_DIViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedvalue(int selectedvalue) {
    final _$actionInfo = _$_DIViewModelActionController.startAction(
        name: '_DIViewModel.setSelectedvalue');
    try {
      return super.setSelectedvalue(selectedvalue);
    } finally {
      _$_DIViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryInstructionMain: ${deliveryInstructionMain},
isLoading: ${isLoading},
selected: ${selected},
selectedReson: ${selectedReson}
    ''';
  }
}
