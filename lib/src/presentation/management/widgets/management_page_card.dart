import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/theme/ui_theme.dart';

class ManagementPageCard extends ConsumerWidget {
  const ManagementPageCard({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 600,
      width: 1000,
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 32,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, left: 4, right: 4, bottom: 4),
            child: child,
          )
        ],
      ),
    );
  }
}
