import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyLargeGray90002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90002,
      );
  static get bodyLargeGreen700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.green700,
      );
  static get bodyLargePoppinsGray60002 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray60002,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray600 => theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray600,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray700 => theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray700Regular =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray90001 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray90001Regular =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray90002 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray90002,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray90002Regular =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray90002.withOpacity(0.53),
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray90002Regular_1 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray90002.withOpacity(0.67),
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray90002Regular_2 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray90002,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenBluegray90005 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.blueGray90005,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenGray50001 => theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenGray900 => theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenGray90001 => theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenGray900Regular =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenGray900Regular17 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.gray900,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenGray900Regular18 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.gray900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenOnPrimary => theme.textTheme.bodyLarge!.sen.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenOrange50a7 => theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.orange50A7,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenWhiteA700 => theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenWhiteA700Regular =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenWhiteA700Regular17 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.whiteA700,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenWhiteA700Regular18 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.whiteA700.withOpacity(0.53),
        fontSize: 18.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenWhiteA700Regular_1 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.whiteA700.withOpacity(0.65),
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenWhiteA700Regular_2 =>
      theme.textTheme.bodyLarge!.sen.copyWith(
        color: appTheme.whiteA700.withOpacity(0.67),
        fontWeight: FontWeight.w400,
      );
  static get bodyLargeSenff1e1d1d => theme.textTheme.bodyLarge!.sen.copyWith(
        color: Color(0XFF1E1D1D),
        fontWeight: FontWeight.w400,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumBluegray30003 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray30003,
      );
  static get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 13.fSize,
      );
  static get bodyMediumBluegray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray600,
        fontSize: 13.fSize,
      );
  static get bodyMediumBluegray600_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray600,
      );
  static get bodyMediumBluegray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray700,
      );
  static get bodyMediumBluegray70090 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray70090,
      );
  static get bodyMediumBluegray90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get bodyMediumBluegray9000113 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 13.fSize,
      );
  static get bodyMediumBluegray9000115 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 15.fSize,
      );
  static get bodyMediumBluegray90001_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90001,
      );
  static get bodyMediumBluegray90002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90002,
      );
  static get bodyMediumBluegray9000213 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90002,
        fontSize: 13.fSize,
      );
  static get bodyMediumBluegray90002_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90002.withOpacity(0.53),
      );
  static get bodyMediumBluegray90004 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray90004.withOpacity(0.6),
        fontSize: 15.fSize,
      );
  static get bodyMediumGray60003 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60003,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumGray700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumPrimary13 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumff31343d => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF31343D),
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
      );
  static get bodySmallGray60003 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60003,
      );
  static get bodySmallOnPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodySmallPoppinsGray80099 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray80099,
      );
  static get bodySmallPoppinsff737782 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: Color(0XFF737782),
        fontSize: 8.fSize,
      );
  // Display text style
  static get displaySmallBluegray300 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.blueGray300,
      );
  // Headline text style
  static get headlineLargeGray900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeGray900ExtraBold =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w800,
      );
  static get headlineLargeffffffff => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFFFFFFFF),
      );
  static get headlineSmallOnSecondaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeSenDeeporangeA20002 =>
      theme.textTheme.labelLarge!.sen.copyWith(
        color: appTheme.deepOrangeA20002,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeSenGray900 => theme.textTheme.labelLarge!.sen.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeSenPrimary => theme.textTheme.labelLarge!.sen.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeSenWhiteA700 => theme.textTheme.labelLarge!.sen.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeff737782 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF737782),
      );
  static get labelMediumBluegray300 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray300,
      );
  static get labelMediumBluegray500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray500,
      );
  static get labelMediumPoppinsGray600 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.gray600,
        fontSize: 11.fSize,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeBluegray90001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleLargeGray900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeGray900_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBluegray90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90002,
        fontSize: 18.fSize,
      );
  static get titleMediumBluegray90002_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90002,
      );
  static get titleMediumBluegray90002_2 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90002,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
      );
  static get titleMediumGray900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
      );
  static get titleMediumff1e1d1d => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF1E1D1D),
      );
  static get titleMediumffffffff => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 18.fSize,
      );
  static get titleSmallBluegray30002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray30002,
      );
  static get titleSmallBluegray90002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90002,
        fontSize: 15.fSize,
      );
  static get titleSmallBluegray9000215 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90002,
        fontSize: 15.fSize,
      );
  static get titleSmallDeeporangeA200 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.deepOrangeA200,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
      );
  static get titleSmallLatoBluegray20001 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.blueGray20001,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLatoBluegray300 =>
      theme.textTheme.titleSmall!.lato.copyWith(
        color: appTheme.blueGray300,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallRedA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.redA700,
      );
  static get titleSmallTeal600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal600,
      );
  static get titleSmallff31343d => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF31343D),
      );
}

extension on TextStyle {
  TextStyle get sen {
    return copyWith(
      fontFamily: 'Sen',
    );
  }

  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get nunito {
    return copyWith(
      fontFamily: 'Nunito',
    );
  }
}
