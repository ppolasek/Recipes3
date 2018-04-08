// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

class RecipeUtil {
  RecipeUtil._();

  /// convert underscores '_' to spaces, then convert each word in the string to
  /// title case
  static String toTitleCaseAll(String text) {
    if (text == null || text.isEmpty) return text;

    text.replaceAll('_', ' ');

    var whole = '';
    text.split(' ').forEach((part) {
      print('RecipeUtil.toTitleCaseAll() part = $part');
      whole += toTitleCase(part) + ' ';
    });

    return whole;
  }

  static String toTitleCase(String text) {
    if (text == null || text.isEmpty) return text;
    if (text.length == 1) return text.toUpperCase();
    return text.substring(0, 1).toUpperCase() + text.substring(1).toLowerCase();
  }

  static addBoolIfNotNull(Map jsonMap, String key, bool value) {
    if (value != null) {
      jsonMap.putIfAbsent(key, () => '$value');
    }
  }

  static addIfNotNull(Map jsonMap, String key, dynamic value) {
    if (value != null && value.isNotEmpty) {
      jsonMap.putIfAbsent(key, () => value);
    }
  }

  static addIntIfNotNull(Map jsonMap, String key, int value) {
    if (value != null) {
      jsonMap.putIfAbsent(key, () => value);
    }
  }

  static addEnumIfNotNull(Map jsonMap, String key, Object value) {
    if (value != null) {
      jsonMap.putIfAbsent(key, () => value.toString());
    }
  }

  static addDateTimeIfNotNull(Map jsonMap, String key, DateTime value) {
    if (value != null) {
      jsonMap.putIfAbsent(key, () {
        var temp = JSON.encode(value, toEncodable: _dateTimeEncoder);
        if (temp.substring(0, 1) == '"') {
          temp = temp.substring(1, temp.length - 1);
        }
        return temp;
      });
    }
  }

  static dynamic _dateTimeEncoder(DateTime item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return '';
  }
}
