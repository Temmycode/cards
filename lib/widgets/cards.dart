import 'package:cards/extensions/get_text_theme.dart';
import 'package:cards/models/card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColoredCards extends StatefulWidget {
  final Color color;
  final IconData icon;
  final CardInfo info;
  final bool isLast;
  final VoidCallback? onTap;

  const ColoredCards({
    super.key,
    required this.color,
    required this.icon,
    required this.info,
    this.isLast = false,
    this.onTap,
  });

  @override
  State<ColoredCards> createState() => _ColoredCardsState();
}

class _ColoredCardsState extends State<ColoredCards> {
  late double height;
  EdgeInsets padding = const EdgeInsets.all(7);
  @override
  void initState() {
    super.initState();
    height = widget.isLast ? 140 : 180;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap != null ? widget.onTap!() : () {};
        // setState(() {
        //   height = MediaQuery.sizeOf(context).height;
        //   padding = const EdgeInsets.symmetric(horizontal: 7, vertical: 72);
        // });
      },
      child: AnimatedContainer(
        padding: padding,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 600),
        width: double.maxFinite,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: widget.color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * the icon at the top
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                widget.icon,
                size: 20,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              widget.info.category,
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.info.title,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.info.price.toString(),
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
