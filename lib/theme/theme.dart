import '../fc_exporter.dart';

final ThemeData fcTheme = _buildfcTheme();

//* Function to generate the theme
ThemeData _buildfcTheme() {
  final ThemeData fcBaseTheme = ThemeData.light();
  return fcBaseTheme.copyWith(
    backgroundColor: fcBackground,
    scaffoldBackgroundColor: fcBackground,
    primaryColor: fcColor,
    colorScheme: fcBaseTheme.colorScheme.copyWith(
      //* -- Primary
      // primary: fcMaroon,
      // primary: fcBlack,
      primary: fcColor,
      onPrimary: fcWhite,
      //* -- Secondary
      secondary: fcYellow,
      onSecondary: fcWhite,
      //* -- Background
      background: fcBackground,
      onBackground: fcColor,
      //* -- Surface
      surface: fcColor,
      onSurface: fcBackground,
      //* -- Error
      error: fcError,
      onError: fcWhite,
      //* -- Shadow
      shadow: fcBlack,
    ),
    //* -- text themes
    textTheme: _buildfcTextTheme(base: fcBaseTheme.textTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: fcColor.withOpacity(.25),
      cursorColor: fcColor,
    ),

    //* -- Visual Density
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //* -- Appbar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.spartan(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: fcWhite,
      ),
    ),
    //* -- tooltip
    tooltipTheme: TooltipThemeData(
      textStyle: const TextStyle(color: fcWhite),
      decoration: BoxDecoration(
        color: fcPink,
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    //* -- text button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(10),
        ),
      ),
    ),
  );
}

//* fc Text theme
TextTheme _buildfcTextTheme({required TextTheme base}) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.assistant().fontFamily,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.assistant().fontFamily,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          fontFamily: GoogleFonts.assistant().fontFamily,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          fontFamily: GoogleFonts.assistant().fontFamily,
        ),
        bodyText2: base.bodyText2!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          height: 1.5,
          letterSpacing: .2,
          fontFamily: GoogleFonts.assistant().fontFamily,
        ),
      )
      .apply(
        fontFamily: GoogleFonts.spartan().fontFamily,
        displayColor: fcColor,
        bodyColor: fcColor,
      );
}
