import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/core/redux/app_state.dart';

typedef ActionBuilder<T> = T Function(T event);

class StreamableStoreBuilder<T> extends StatefulWidget {
  const StreamableStoreBuilder({
    Key? key,
    required this.stream,
    required this.actionBuilder,
    this.initAction,
    required this.child,
  }) : super(key: key);

  final Stream<T> stream;
  final ActionBuilder actionBuilder;
  final dynamic initAction;
  final Widget child;

  @override
  State<StreamableStoreBuilder> createState() => _StreamableStoreBuilderState<T>();
}

class _StreamableStoreBuilderState<T> extends State<StreamableStoreBuilder> {
  late StreamSubscription _sub;

  @override
  void initState() {
    _sub = widget.stream.listen((event) {
      StoreProvider.of<AppState>(context).dispatch(widget.actionBuilder(event));
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.initAction != null) {
      StoreProvider.of<AppState>(context).dispatch(widget.initAction);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
