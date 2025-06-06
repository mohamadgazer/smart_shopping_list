import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shopping_list/constants/app_locale.dart';
import 'package:smart_shopping_list/cubit/app_cbuit.dart';
import 'package:smart_shopping_list/generated/l10n.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<AppCubit>().state;
    final isDark = context.watch<AppCubit>().isDarkMode;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).selectLanguage,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // 🌍 لغة التطبيق
          ...S.delegate.supportedLocales.map((locale) {
            final selected = locale == currentLocale;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {
                  context.read<AppCubit>().changeLocale(locale);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: selected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  elevation: selected ? 6 : 2,
                  shadowColor: selected
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                      : Colors.black12,
                  color: selected
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Theme.of(context).cardColor,
                  child: ListTile(
                    leading: Icon(
                      Icons.language,
                      color: selected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                    ),
                    title: Text(
                      getLocaleLabel(locale.languageCode),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: selected
                        ? Icon(
                            Icons.check_circle,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : null,
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 32),

          // 🌙 وضع الإضاءة
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).isDarkmode,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Switch(
                    value: isDark,
                    onChanged: (value) {
                      context.read<AppCubit>().toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
