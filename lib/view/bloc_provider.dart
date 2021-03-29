import 'package:flutter/material.dart';
import 'package:project_th/logic/bloc/base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;
  final BaseBlocParameter? parameter;

  const BlocProvider(
      {Key? key, required this.bloc, required this.child, this.parameter})
      : super(key: key);

  static T? of<T extends BaseBloc>(BuildContext context) {
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType();
    return provider?.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  void initState() {
    widget.bloc.init(widget.parameter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
