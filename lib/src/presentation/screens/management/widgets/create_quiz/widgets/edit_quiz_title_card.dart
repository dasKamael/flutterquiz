import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/presentation/design_system/ui_theme.dart';

class EditQuizTitleCard extends ConsumerWidget {
  const EditQuizTitleCard({super.key, required this.title, required this.description, required this.isPrivate});

  final String title;
  final String description;
  final bool isPrivate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 16,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: title,
              decoration: const InputDecoration(
                hintText: 'Quiz Title',
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
          const Divider(indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: description,
              style: theme.textTheme.bodySmall,
              decoration: const InputDecoration(
                hintText: 'Quiz Description',
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
          SwitchListTile(
            value: isPrivate,
            onChanged: (value) {},
            title: Text('Is Public', style: theme.textTheme.bodySmall),
          )
        ],
      ),
    );
  }
}
