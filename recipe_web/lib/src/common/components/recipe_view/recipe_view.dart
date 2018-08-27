// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:recipe_web/src/common/components/dialog/dialog.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/common/recipes3_app_events.dart';
import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/recipe/common/recipe_service.dart';
import 'package:recipe_web/src/recipe/ui/recipe_form/recipe_form.dart';
import 'package:recipe_web/src/route_paths.dart' as paths;
import 'package:recipe_web/src/route_paths.dart';

@Component(
  selector: 'recipe-view',
  styleUrls: const ['recipe_view.css'],
  templateUrl: 'recipe_view.html',
  directives: const [
    coreDirectives,
    DialogComponent,
    RecipeFormComponent,
  ],
  providers: const [
  ],
)
class RecipeViewComponent implements OnInit, OnActivate {
  final Recipes3Logger _log;
  final RecipesAppEvents _recipeEvents;
  final RecipeService _recipeService;
  final Router _router;

  @Input()
  Recipe recipe = null;

  @ViewChild('editRecipeDialog')
  DialogComponent editRecipeDialogComp;

  RecipeViewComponent(this._log, this._recipeService, this._recipeEvents, this._router); // , this._routeParams

  ngOnInit() async {
    _log.loggerName = 'RecipeViewComponent';
  }

  @override
  Future<void> onActivate(_, RouterState current) async {
    _log.fine('onActivate()');

    final id = paths.getId(current.parameters);
    if (id != null) recipe = await _recipeService.getRecipe(id);
  }
  
  void onRecipeSaved(var event) {
    _log.fine('onRecipeSaved() event = $event');
    if (event != null && event['recipe'] != null) {
      recipe = event['recipe'];
    }
  }

  void onEditClick() {
    editRecipeDialogComp.visible = true;
  }

  void onDeleteClick() {
    _recipeService.deleteRecipe(recipe.id).then((success) {
      if (success) _recipeEvents.recipeDeleted(recipe.id);
      _router.navigate(RoutePaths.home.toUrl());
    });
  }
}
