import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import 'styles.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Color backgroundColor;
  final Color buttonColor;
  final String day;
  final String month;
  final double height;
  final void Function()? onTap;

  const HistoryAppBar({
    super.key,
    this.backgroundColor = Colors.black,
    this.buttonColor = Colors.black,
    this.day = AppConstants.defaultDay,
    this.month = AppConstants.defaultMonth,
    this.height = Styles.appBarHeight,
    this.onTap,
  }) : preferredSize = const Size.fromHeight(Styles.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Styles.animationDuration,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: Styles.appBarMargin),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Styles.appRadius),
          bottomRight: Radius.circular(Styles.appRadius),
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text("$day $month"),
            ),
            InkWell(
              onTap: onTap,
              child: AnimatedContainer(
                duration: Styles.animationDuration,
                height: Styles.appBarHeight,
                width: Styles.appBarWidth,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(Styles.appRadius),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: backgroundColor.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: const Offset(0, 3), // changes position of shadow
                    )
                  ],
                ),
                child: const Icon(Icons.calendar_month_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
