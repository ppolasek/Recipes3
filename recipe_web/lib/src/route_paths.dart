import 'package:angular_router/angular_router.dart';

//@RouteConfig(const [
//  const Redirect(path: '/', redirectTo: const ['Home']),
//  const Route(path: '/home', name: 'Home', component: DefaultViewComponent),
//  const Route(path: '/search', name: 'Search', component: RecipeSearchComponent),
//  const Route(path: '/detail/:id', name: 'Detail', component: RecipeViewComponent),
//  const Route(path: '/hover/:id', name: 'Hover', component: RecipeViewComponent),
//])
//final heroes = RoutePath(path: 'heroes');

const idParam = 'id';

class RoutePaths {
  static final home = RoutePath(path: 'home');
  static final search = RoutePath(path: 'search');
//  static final detail = RoutePath(path: 'detail');
//  static final hover = RoutePath(path: 'hover');

  static final detail = RoutePath(path: 'detail/:$idParam');
  static final hover = RoutePath(path: 'hover/:$idParam'); 
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
