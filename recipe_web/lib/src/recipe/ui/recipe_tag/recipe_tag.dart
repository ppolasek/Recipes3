// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular/angular.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/logger/logger.dart';

/// Form component to enter a new recipe.
@Component(
  selector: 'recipe-tag',
  styleUrls: const ['recipe_tag.css'],
  templateUrl: 'recipe_tag.html',
  directives: const [coreDirectives],
  providers: const [],
)
class RecipeTagComponent implements OnInit {
  final Recipes3Logger _log;

  @Input()
  RecipeTag tag;

  final StreamController _recipeTagEvent = new StreamController.broadcast();

  @Output()
  Stream get tagEvent => _recipeTagEvent.stream;

  RecipeTagComponent(this._log) {
    _log.loggerName = 'RecipeTagComponent';
  }

  ngOnInit() {
    _log.fine('ngOnInit()');
  }

  /// The user clicked to remove the tag from the recipe
  void onDeleteClick() {
    _log.fine('onDeleteClick() deleting this tag: $tag');
    _recipeTagEvent.add({RecipeTagEvent.TYPE: RecipeTagEvent.DELETE, RecipeTagEvent.TAG: tag.toJson()});
  }
}
