// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyStore on _MyStore, Store {
  late final _$itemListAtom = Atom(name: '_MyStore.itemList', context: context);

  @override
  ObservableList<Estado> get itemList {
    _$itemListAtom.reportRead();
    return super.itemList;
  }

  @override
  set itemList(ObservableList<Estado> value) {
    _$itemListAtom.reportWrite(value, super.itemList, () {
      super.itemList = value;
    });
  }

  late final _$_MyStoreActionController =
      ActionController(name: '_MyStore', context: context);

  @override
  dynamic createItem(Estado item) {
    final _$actionInfo =
        _$_MyStoreActionController.startAction(name: '_MyStore.createItem');
    try {
      return super.createItem(item);
    } finally {
      _$_MyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic readItems() {
    final _$actionInfo =
        _$_MyStoreActionController.startAction(name: '_MyStore.readItems');
    try {
      return super.readItems();
    } finally {
      _$_MyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateItem() {
    final _$actionInfo =
        _$_MyStoreActionController.startAction(name: '_MyStore.updateItem');
    try {
      return super.updateItem();
    } finally {
      _$_MyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItem() {
    final _$actionInfo =
        _$_MyStoreActionController.startAction(name: '_MyStore.deleteItem');
    try {
      return super.deleteItem();
    } finally {
      _$_MyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemList: ${itemList}
    ''';
  }
}
