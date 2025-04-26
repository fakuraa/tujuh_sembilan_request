import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DividerListTile extends StatelessWidget {
  const DividerListTile({
    super.key,
    this.isShowForwordArrow = true,
    required this.title,
    required this.press,
    this.leading,
    this.minLeadingWidth,
    this.isShowDivider = true,
  });
  final bool isShowForwordArrow, isShowDivider;
  final Widget title;
  final Widget? leading;
  final double? minLeadingWidth;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: minLeadingWidth,
          leading: leading,
          onTap: press,
          title: title,
          trailing:
              isShowForwordArrow
                  ? SvgPicture.asset(
                    "assets/icons/miniRight.svg",
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color!.withValues(alpha: 0.4),
                      BlendMode.srcIn,
                    ),
                  )
                  : null,
        ),
        if (isShowDivider)
          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
      ],
    );
  }
}
