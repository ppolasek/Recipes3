// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.


import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:pageloader/objects.dart';
import 'package:test/test.dart';

import 'package:recipe_web/src/common/components/recipe_view/recipe_view.dart';


class RecipeViewComponentPO {
  @ByTagName('h1')
  PageLoaderElement _title;

  Future<String> get title => _title.visibleText;
}
