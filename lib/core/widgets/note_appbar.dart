import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import 'action_button.dart';

class NoteAppbar extends StatelessWidget with PreferredSizeWidget {
  const NoteAppbar({
    Key? key,
    this.title,
    this.actions,
    this.autoImplementLeading = true,
  }) : super(key: key);

  final bool autoImplementLeading;
  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacings.xl),
        padding: const EdgeInsets.symmetric(vertical: AppSpacings.xl),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (autoImplementLeading) ...{
                ActionButton(
                  child: Icon(
                    Get.locale == fa
                        ? Icons.keyboard_arrow_right_rounded
                        : Icons.keyboard_arrow_left_rounded,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: AppSpacings.l),
              },
              title != null
                  ? Expanded(
                      child: Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        // style: Get.theme.textTheme.headlineLarge,
                      ),
                    )
                  : const Spacer(),
              if (actions != null) ...{
                ...actions!
                    .mapIndexed(
                      (action, i) => Padding(
                        padding: (i == actions!.length - 1)
                            ? EdgeInsets.zero
                            : const EdgeInsets.symmetric(
                                horizontal: AppSpacings.l),
                        child: action,
                      ),
                    )
                    .toList(),
              },
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
