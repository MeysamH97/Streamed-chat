import 'package:chat_by_socket_samle/core/resources/custom_sizes.dart';
import 'package:chat_by_socket_samle/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.child,
    required this.onTap,
    this.horizontalSpace,
    this.verticalSpace,
    this.isActive = true,
    this.isLoading = false,
  });

  final String? text;
  final Widget? child;
  final void Function()? onTap;
  final double? horizontalSpace;
  final double? verticalSpace;
  final bool isActive;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalSpace != null
              ? horizontalSpace!
              : CustomSize(context).horizontalSpaceLevel4(),
          vertical: verticalSpace != null
              ? verticalSpace!
              : CustomSize(context).verticalSpaceLevel7(),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalSpace != null
                ? horizontalSpace!
                : CustomSize(context).horizontalSpaceLevel4(),
            vertical: verticalSpace != null
                ? verticalSpace!
                : CustomSize(context).verticalSpaceLevel5(),
          ),
          decoration: BoxDecoration(
            color: isActive!
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context)
                    .colorScheme
                    .surface, // Change color when disabled
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: isLoading ? LoadingWidget(size: CustomSize(context).shapeLevel6(),): child ?? Text(
              text ?? '',
              style: TextStyle(
                fontSize: CustomSize(context).textLevel6(),
                color: isActive!
                    ? Theme.of(context).colorScheme.inversePrimary
                    : Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
