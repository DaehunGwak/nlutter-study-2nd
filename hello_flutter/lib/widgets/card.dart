import 'package:flutter/material.dart';

class MyWalletCard extends StatelessWidget {
  static const double _TERM_OFFSET_Y = -20.0;

  final String currencyTitle;
  final String balanceText;
  final String currencyCodeText;
  final Color backgroundColor;
  final Color fontColor;
  final IconData rightIcon;
  final int order;

  const MyWalletCard({
    super.key,
    required this.currencyTitle,
    required this.balanceText,
    required this.currencyCodeText,
    required this.backgroundColor,
    required this.fontColor,
    required this.rightIcon,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _TERM_OFFSET_Y * order),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyTitle,
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      balanceText,
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      currencyCodeText,
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(0, 15),
                child: Icon(
                  rightIcon,
                  color: fontColor,
                  size: 98,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
