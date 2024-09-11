// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserMobx on _UserMobx, Store {
  late final _$userAtom = Atom(name: '_UserMobx.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$visitorsAtom =
      Atom(name: '_UserMobx.visitors', context: context);

  @override
  ObservableList<Visitor> get visitors {
    _$visitorsAtom.reportRead();
    return super.visitors;
  }

  @override
  set visitors(ObservableList<Visitor> value) {
    _$visitorsAtom.reportWrite(value, super.visitors, () {
      super.visitors = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_UserMobx.isLoading', context: context);

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

  late final _$userNameAtom =
      Atom(name: '_UserMobx.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$paymentAmountAtom =
      Atom(name: '_UserMobx.paymentAmount', context: context);

  @override
  String get paymentAmount {
    _$paymentAmountAtom.reportRead();
    return super.paymentAmount;
  }

  @override
  set paymentAmount(String value) {
    _$paymentAmountAtom.reportWrite(value, super.paymentAmount, () {
      super.paymentAmount = value;
    });
  }

  late final _$paymentMethodAtom =
      Atom(name: '_UserMobx.paymentMethod', context: context);

  @override
  String get paymentMethod {
    _$paymentMethodAtom.reportRead();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(String value) {
    _$paymentMethodAtom.reportWrite(value, super.paymentMethod, () {
      super.paymentMethod = value;
    });
  }

  late final _$isDataEditedAtom =
      Atom(name: '_UserMobx.isDataEdited', context: context);

  @override
  bool get isDataEdited {
    _$isDataEditedAtom.reportRead();
    return super.isDataEdited;
  }

  @override
  set isDataEdited(bool value) {
    _$isDataEditedAtom.reportWrite(value, super.isDataEdited, () {
      super.isDataEdited = value;
    });
  }

  late final _$userProfilePictureUrlAtom =
      Atom(name: '_UserMobx.userProfilePictureUrl', context: context);

  @override
  String get userProfilePictureUrl {
    _$userProfilePictureUrlAtom.reportRead();
    return super.userProfilePictureUrl;
  }

  @override
  set userProfilePictureUrl(String value) {
    _$userProfilePictureUrlAtom.reportWrite(value, super.userProfilePictureUrl,
        () {
      super.userProfilePictureUrl = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UserMobx.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchUserAsyncAction =
      AsyncAction('_UserMobx.fetchUser', context: context);

  @override
  Future<void> fetchUser() {
    return _$fetchUserAsyncAction.run(() => super.fetchUser());
  }

  late final _$_UserMobxActionController =
      ActionController(name: '_UserMobx', context: context);

  @override
  void addVisitor({required Visitor visitor}) {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx.addVisitor');
    try {
      return super.addVisitor(visitor: visitor);
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePaymentAmount(String amount) {
    final _$actionInfo = _$_UserMobxActionController.startAction(
        name: '_UserMobx.updatePaymentAmount');
    try {
      return super.updatePaymentAmount(amount);
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearData() {
    final _$actionInfo =
        _$_UserMobxActionController.startAction(name: '_UserMobx.clearData');
    try {
      return super.clearData();
    } finally {
      _$_UserMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
visitors: ${visitors},
isLoading: ${isLoading},
userName: ${userName},
paymentAmount: ${paymentAmount},
paymentMethod: ${paymentMethod},
isDataEdited: ${isDataEdited},
userProfilePictureUrl: ${userProfilePictureUrl},
errorMessage: ${errorMessage}
    ''';
  }
}
