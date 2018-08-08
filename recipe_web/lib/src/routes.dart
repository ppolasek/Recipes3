import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/default_view/default_view.template.dart' as defview_template;

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/search/search.template.dart' as searchview_template;

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/recipe_view/recipe_view.template.dart' as detailview_template;

// ignore: uri_has_not_been_generated
import 'package:recipe_web/src/common/components/recipe_view/recipe_view.template.dart' as hoverview_template;

export 'route_paths.dart';

@Injectable()
class Routes {
/*
//  const Redirect(path: '/', redirectTo: const ['Home']),
//  const Route(path: '/home', name: 'Home', component: DefaultViewComponent),
//  const Route(path: '/search', name: 'Search', component: RecipeSearchComponent),
//  const Route(path: '/detail/:id', name: 'Detail', component: RecipeViewComponent),
//  const Route(path: '/hover/:id', name: 'Hover', component: RecipeViewComponent),

 */

//  RoutePath get home =>   RoutePaths.home;
//  RoutePath get search => RoutePaths.search;
//  RoutePath get detail => RoutePaths.detail;
//  RoutePath get hover => RoutePaths.hover;

  final List<RouteDefinition> all = [
//    RouteDefinition(path: paths.heroes.path, component: hlct.HeroListComponentNgFactory),
    RouteDefinition.redirect(path: '', redirectTo: RoutePaths.home.toUrl()),
    RouteDefinition(routePath: RoutePaths.home,   component: defview_template.DefaultViewComponentNgFactory),
    RouteDefinition(routePath: RoutePaths.search, component: searchview_template.RecipeSearchComponentNgFactory),
    RouteDefinition(routePath: RoutePaths.detail, component: detailview_template.RecipeViewComponentNgFactory),
    RouteDefinition(routePath: RoutePaths.hover,  component: hoverview_template.RecipeViewComponentNgFactory),
  ];
}
