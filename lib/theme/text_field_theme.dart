import 'package:flutter/material.dart';

class TextFieldTheme extends ThemeExtension<TextFieldTheme> {
  final TextStyle? textStyle;

  const TextFieldTheme({
    this.textStyle,
  });

  @override
  ThemeExtension<TextFieldTheme> copyWith({
    TextStyle? textStyle,
  }) {
    return TextFieldTheme(
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  ThemeExtension<TextFieldTheme> lerp(
    ThemeExtension<TextFieldTheme>? other,
    double t,
  ) {
    if (other is! TextFieldTheme) {
      return this;
    }
    return TextFieldTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
    );
  }
} 