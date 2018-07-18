import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/default_view/default_view.template.dart' as defview;

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/search/search.template.dart' as searchview;

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/recipe_view/recipe_view.template.dart' as detailview;

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/recipe_view/recipe_view.template.dart' as hoverview;

import 'route_paths.dart' as paths;
//import 'hero_list_component.template.dart' as hlct;


@Injectable()
class Routes {
/*
//  const Redirect(path: '/', redirectTo: const ['Home']),
//  const Route(path: '/home', name: 'Home', component: DefaultViewComponent),
//  const Route(path: '/search', name: 'Search', component: RecipeSearchComponent),
//  const Route(path: '/detail/:id', name: 'Detail', component: RecipeViewComponent),
//  const Route(path: '/hover/:id', name: 'Hover', component: RecipeViewComponent),

 */

//  RoutePath get heroes => paths.heroes;
  RoutePath get home => paths.home;
  RoutePath get search => paths.search;
  RoutePath get detail => paths.detail;
  RoutePath get hover => paths.hover;

  final List<RouteDefinition> all = [
//    RouteDefinition(path: paths.heroes.path, component: hlct.HeroListComponentNgFactory),
    RouteDefinition.redirect(path: '', redirectTo: paths.home.toUrl()),
    RouteDefinition(path: paths.home.path, component: defview.DefaultViewComponentNgFactory),
    RouteDefinition(path: paths.search.path, component: searchview.RecipeSearchComponentNgFactory),
    RouteDefinition(path: paths.detail.path, component: detailview.RecipeViewComponentNgFactory),
    RouteDefinition(path: paths.hover.path, component: hoverview.RecipeViewComponentNgFactory),
  ];
}
