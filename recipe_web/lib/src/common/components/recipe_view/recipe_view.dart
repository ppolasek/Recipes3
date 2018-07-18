// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:recipe_web/src/common/components/dialog/dialog.dart';
import 'package:recipe_web/src/common/model.dart';
import 'package:recipe_web/src/common/recipes3_app_events.dart';
import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/recipe/common/recipe_service.dart';
import 'package:recipe_web/src/recipe/ui/recipe_form/recipe_form.dart';

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
class RecipeViewComponent implements OnInit {
  final Recipes3Logger _log;
  final RecipesAppEvents _recipeEvents;
//  final RouteParams _routeParams;
  final RecipeService _recipeService;

  @Input()
  Recipe recipe = null;

  @ViewChild('editRecipeDialog')
  DialogComponent editRecipeDialogComp;

  RecipeViewComponent(this._log, this._recipeService, this._recipeEvents); // , this._routeParams

  ngOnInit() async {
    _log.loggerName = 'RecipeViewComponent';
    // TODO need to get the id from RouteParams - see example code online
//    var _id = _routeParams?.get('id');
//    _log.fine('ngOnInit() _id = $_id');
//
//    if (_id != null) {
//        int id;
//        try {
//          id = int.parse(_id);
//        } catch (e) {
//          id = -1;
//        }
//        _log.fine('ngOnInit() id = $id');
//        if (id >= 0) {
//          recipe = await _recipeService.getRecipe(id);
//        }
//    }
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
    });
  }
}
