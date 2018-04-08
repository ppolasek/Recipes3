// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular/angular.dart';

import 'package:recipe_web/src/common/components/recipe_list/recipe_list.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/common/recipes3_app_events.dart';
import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/recipe/common/recipe_service.dart';

@Component(
  selector: 'added-recently',
  styleUrls: const ['added_recently.css'],
  templateUrl: 'added_recently.html',
  directives: const [
    CORE_DIRECTIVES,
    RecipeListComponent,
  ],
  providers: const [
  ],
)
class AddedRecentlyComponent implements OnInit {
  final Recipes3Logger _log;
  final RecipeService _recipeService;
  final RecipesAppEvents _recipeEvents;

  @Input()
  int listSize;

  List<Recipe> recipes;

  AddedRecentlyComponent(this._log, this._recipeService, this._recipeEvents);

  ngOnInit() {
    _log.loggerName = 'AddedRecentlyComponent';
    _log.finer('ngOnInit() listSize = $listSize');

    fetchRecipes();
    _recipeEvents.recipeStream.listen((event) => _handleRecipeAppEvents(event));
  }

  Future<Null> _handleRecipeAppEvents(var event) async {
    _log.fine('AddedRecentlyComponent._handleRecipeAppEvents() event = $event');

    switch (event[RecipeEvents.key_event_type]) {
      case RecipeEvents.type_recipe_deleted:
        if (recipes != null && recipes.isNotEmpty) {
          var recipe = recipes.firstWhere((temp) => temp.id == event[RecipeEvents.key_recipe_id], orElse: () => null);
          if (recipe != null) {
            // the delete recipe was in the list, so call to reload them
            fetchRecipes();
          }
        }

        break;

      case RecipeEvents.type_recipe_added:
        if (recipes != null && recipes.isNotEmpty) {
          fetchRecipes();
        }

        break;

      case RecipeEvents.type_recipe_updated:
        if (recipes != null && recipes.isNotEmpty) {
          var recipe = recipes.firstWhere((temp) => temp.id == event[RecipeEvents.key_recipe_id], orElse: () => null);
          if (recipe != null) {
            // the updated recipe was in the list, so call to reload them
            fetchRecipes();
          }
        }

        break;
    }
  }

  Future<Null> fetchRecipes() async {
    recipes = await _recipeService.findAddedRecently(listSize);
  }
}
