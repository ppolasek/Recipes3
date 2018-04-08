// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular/angular.dart';

import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/logger/logger.dart';

/// Keeps track of which recipe has been hovered over and clicked on, as only one
/// may be selected at a time across multiple lists. This will be treated as a
/// singleton as only the one instance is injected.
@Injectable()
class SelectorDirective implements OnInit {
  final Recipes3Logger _log;

  Timer timer;
  Recipe hoveredRecipe;
  Recipe clickedRecipe;
  Recipe lastFired;

  SelectorDirective(this._log);

  ngOnInit() {
    _log.loggerName = 'RecipeListComponent';
  }

}