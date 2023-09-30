/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/core/redux/app_state.dart';

typedef ActionBuilder<T> = T Function(T event);

class AppStateStreamConnector<VM, T> extends StatefulWidget {
  const AppStateStreamConnector({
    Key? key,
    required this.builder,
    required this.converter,
    required this.stream,
    required this.actionBuilder,
    this.onInit,
    this.onDispose,
    this.onDidChange,
  }) : super(key: key);
  final ViewModelBuilder<VM> builder;
  final StoreConverter<AppState, VM> converter;
  final Stream<T> stream;
  final ActionBuilder actionBuilder;
  final OnInitCallback<AppState>? onInit;
  final OnDisposeCallback<AppState>? onDispose;
  final OnDidChangeCallback<VM>? onDidChange;

  @override
  State<AppStateStreamConnector> createState() => _AppStateStreamConnectorState<VM>();
}

class _AppStateStreamConnectorState<T> extends State<AppStateStreamConnector> {
  late StreamSubscription _sub;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, T>(
      builder: widget.builder,
      converter:  widget.converter,
      onDidChange: widget.onDidChange,
      onInit: (store) {
        widget.onInit?.call(store);
        _sub = widget.stream.listen((event) {
          StoreProvider.of<AppState>(context).dispatch(widget.actionBuilder(event));
        });
      },
      onDispose: (store) {
        _sub.cancel();
        widget.onDispose?.call(store);
      },
    );
  }
}
*/
