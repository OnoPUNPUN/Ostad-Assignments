import 'package:flutter/material.dart';

import 'flag_card.dart';
import 'flag_info.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({super.key});

  static const double maxCardWidth = 320;
  static const double cardHeight = 250;
  static const double spacing = 16;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // < 768: 2 per row, 768 <= w < 1024: 3 per row, >= 1024: 4 per row
    int crossAxisCount;
    if (screenWidth >= 1024) {
      crossAxisCount = 4;
    } else if (screenWidth >= 768) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 2;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate dynamic card width for perfect fit
        double totalSpacing = spacing * (crossAxisCount - 1);
        double availableWidth = constraints.maxWidth - totalSpacing;
        double cardWidth = availableWidth / crossAxisCount;
        if (cardWidth > maxCardWidth) cardWidth = maxCardWidth;

        return GridView.builder(
          itemCount: flagCards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: cardWidth / cardHeight,
          ),
          itemBuilder:
              (context, index) => Center(
            child: SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: FlagCard(flag: flagCards[index]),
            ),
          ),
        );
      },
    );
  }
}