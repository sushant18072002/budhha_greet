import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle baseStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final double minFontSize;
  final double maxFontSize;

  const AdaptiveText(
    this.text, {
    super.key,
    required this.baseStyle,
    this.textAlign,
    this.maxLines = 3,
    this.minFontSize = 12.0,
    this.maxFontSize = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the optimal font size based on container width
        final scaleFactor = constraints.maxWidth / 375.0; // Using iPhone 8 as base
        final calculatedFontSize = (baseStyle.fontSize ?? 14.0) * scaleFactor;
        
        // Clamp the font size between min and max values
        final adaptiveFontSize = calculatedFontSize.clamp(minFontSize, maxFontSize);

        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
            ),
            child: Text(
              text,
              style: baseStyle.copyWith(fontSize: adaptiveFontSize),
              textAlign: textAlign ?? TextAlign.center,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}

// Extension for convenient text size calculation
extension TextSizeCalculator on String {
  Size getTextSize(TextStyle style, {double maxWidth = double.infinity}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    
    return textPainter.size;
  }
}