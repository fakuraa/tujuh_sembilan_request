// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class ScrollViewWithExpanded extends StatelessWidget {
  ScrollViewWithExpanded({
    super.key,
    required this.children,
    this.physics,
    this.scrollController,
  });
  List<Widget> children;
  ScrollPhysics? physics;
  ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          physics: physics,
          controller: scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(mainAxisSize: MainAxisSize.min, children: children),
            ),
          ),
        );
      },
    );
  }
}
