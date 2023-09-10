import 'package:flutter/material.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_loading.dart';

class UiElevatedButton extends StatelessWidget {
  const UiElevatedButton({
    Key? key,
    required this.child,
    this.loadingWidget,
    this.isPrimary = true,
    this.loading = false,
    this.fullWidth = false,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final bool loading;
  final bool isPrimary;
  final bool fullWidth;
  final Widget? loadingWidget;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final defaultLoadingWidget =
        UiLoading(padding: const EdgeInsets.all(3), color: isPrimary ? kSecondaryColor : kPrimaryColor);

    late final Widget button;
    if (loading) {
      button = ElevatedButton(onPressed: onPressed, child: loadingWidget ?? defaultLoadingWidget);
    } else {
      button = ElevatedButton(onPressed: onPressed, child: child);
    }

    if (fullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}
