import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocState {
  bool get isLoading;
}

final StreamController<BaseCommunicationAction> _communicationController = StreamController.broadcast();

abstract class BaseBloc<EVENT, STATE extends BlocState>
    extends Bloc<EVENT, STATE> {
  BaseBloc(super.initial);

  @protected
  Stream<BaseCommunicationAction> getCommunicationStream() => _communicationController.stream;

  @protected
  void sendCommunicationAction(BaseCommunicationAction action) {
    _communicationController.sink.add(action);
  }
}

sealed class BaseCommunicationAction {}

class ReopenStudent extends BaseCommunicationAction {
  final String studentId;

  ReopenStudent(this.studentId);
}