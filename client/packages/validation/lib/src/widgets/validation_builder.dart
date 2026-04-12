import 'package:flutter/material.dart';
import 'package:validation/validation.dart';

class ValidationBuilder extends StatelessWidget {
  const ValidationBuilder({
    super.key,
    required ValidationController controller,
    required Widget Function(BuildContext context) builder,
  })  : _controller = controller,
        _builder = builder;

  final ValidationController _controller;
  final Widget Function(BuildContext context) _builder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => _builder(context),
    );
  }
}
