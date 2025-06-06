// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(day) => "${Intl.select(day, {
            'Friday': 'إنه يوم الجمعة! وقت الراحة 🍹',
            'Monday': 'عدنا للعمل 💼',
            'other': 'يوم عادي آخر',
          })}";

  static String m1(timeOfDay, name) => "صباح ${timeOfDay}، يا ${name}!";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'ما عندك ولا مهمة 🎉', one: 'مهمة واحدة متبقية', other: '${count} مهام بانتظارك')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("المساعد الذكي"),
        "dayMood": m0,
        "greetUser": m1,
        "isDarkmode": MessageLookupByLibrary.simpleMessage("الوضع المظلم"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
        "settings": MessageLookupByLibrary.simpleMessage("الاعدادات"),
        "tasksCount": m2
      };
}
