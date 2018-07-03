// Copyright (c) 2017, ppolasek. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:recipe_web/src/logger/logger.dart';
import 'package:recipe_web/src/recipe/ui/recipe_tag/recipe_tag.dart';

/// Form component to enter a new recipe.
@Component(
  selector: 'my-dialog',
  styleUrls: const ['dialog.css'],
  templateUrl: 'dialog.html',
  directives: const [
    coreDirectives,
    RecipeTagComponent,
  ],
  providers: const [],
)
class DialogComponent implements OnInit {
  final Recipes3Logger _log;

  String _heading = '';
  String get heading => _heading;

  @Input()
  void set heading(String newValue) {
    if (newValue != _heading) {
      _heading = newValue;
      // is this needed?
    }
  }

  @Input()
  String buttonLabel = '';

  bool visible = false;
  
  DialogComponent(this._log) {
    _log.loggerName = 'DialogComponent';
  }

  ngOnInit() {
    _log.fine('ngOnInit()');
    _log.finest('ngOnInit() heading = $heading');
    _log.finest('ngOnInit() buttonLabel = $buttonLabel');
  }

  void close() {
    visible = false;
  }
}
