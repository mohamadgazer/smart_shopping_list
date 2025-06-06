import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shopping_list/constants/app_button.dart';
import 'package:smart_shopping_list/constants/app_themes.dart';
import 'package:smart_shopping_list/exports.dart';
import 'package:smart_shopping_list/generated/l10n.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MainApp(), // Wrap your app
  ),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: Locale("en"),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routes: routes,
          home: child,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
        );
      },
      child: const ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ناخد عرض الشاشة الحقيقي
    final screenWidth = MediaQuery.of(context).size.width;

    // نحدد الـ layout حسب حجم الشاشة
    if (screenWidth < 600) {
      // موبايل - نستخدم ScreenUtil للأبعاد
      return MobileLayout();
    } else if (screenWidth < 1200) {
      // تابليت أو شاشات متوسطة
      return TabletLayout();
    } else {
      // ديسكتوب أو شاشات كبيرة جداً
      return DesktopLayout();
    }
  }
}

// تصميم موبايل باستخدام ScreenUtil
class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'موبايل',
          style: TextStyle(fontSize: 20.sp), // حجم خط متناسب
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // padding متناسب
        child: Column(
          children: [
            Text('هذه واجهة موبايل', style: TextStyle(fontSize: 16.sp)),
            SizedBox(height: 20.h),
            LocalView(),
            AppButton(
              type: AppButtonType.outlined,
              label: "سجل دخول",
              icon: Icons.login,
              onPressed: () => print("ضغطت"),
            ),
          ],
        ),
      ),
    );
  }
}

class LocalView extends StatelessWidget {
  const LocalView({super.key});
  String getTimeOfDayGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "morning";
    if (hour < 18) return "afternoon";
    return "evening";
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final locale = Localizations.localeOf(context).languageCode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).appTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(S.of(context).greetUser(getTimeOfDayGreeting(), "Ahmed")),
        Text(S.of(context).tasksCount(3)),
        Text(
          S
              .of(context)
              .dayMood(
                now.weekday == 5
                    ? "Friday"
                    : now.weekday == 1
                    ? "Monday"
                    : "Other",
              ),
        ),
      ],
    );
  }
}

// تصميم تابليت (بدون ScreenUtil عادة)
// ممكن تستخدم أبعاد ثابتة أو نسبية
class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تابليت')),
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(24),
          color: Colors.blueGrey[50],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('هذه واجهة تابليت', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('زر'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// تصميم ديسكتوب
class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ديسكتوب')),
      body: Center(
        child: Container(
          width: 900,
          padding: const EdgeInsets.all(32),
          color: Colors.grey[100],
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  'هذه واجهة ديسكتوب',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              SizedBox(width: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text('زر'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
