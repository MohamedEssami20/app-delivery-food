import 'package:flutter/material.dart';

class LazyIndexedStack extends StatefulWidget {
  const LazyIndexedStack({
    super.key,
    required this.index,
    required this.children,
  });

  final int index;
  final List<Widget> children;

  @override
  State<LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack> {
  late List<bool> _loaded;

  @override
  void initState() {
    super.initState();
    _loaded = List.generate(widget.children.length, (i) => i == widget.index);
  }

  @override
  void didUpdateWidget(covariant LazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loaded[widget.index] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(widget.children.length, (i) {
        if (!_loaded[i]) return const SizedBox();

        return Offstage(offstage: widget.index != i, child: widget.children[i]);
      }),
    );
  }
}
