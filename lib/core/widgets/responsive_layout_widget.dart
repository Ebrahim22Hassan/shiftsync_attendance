import 'package:flutter/material.dart';

const kTabletBreakPoint = 768.0;
const kDesktopBreakPoint = 1440.0;
const kSideMenuWidth = 300.0;
const kNavigationRailWidth = 72.0;
const kMaxWidth = 1180.0;


class ResponsiveLayoutWidget extends StatelessWidget {
  const ResponsiveLayoutWidget({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  });

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < kTabletBreakPoint) {
          return mobileBody;
        } else if (constraints.maxWidth >= kTabletBreakPoint &&
            constraints.maxWidth < kDesktopBreakPoint) {
          return tabletBody ?? mobileBody;
        } else {
          return desktopBody ?? mobileBody;
        }
      },
    );
  }
}
