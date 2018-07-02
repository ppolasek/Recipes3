import 'package:angular_router/angular_router.dart';

//@RouteConfig(const [
//  const Redirect(path: '/', redirectTo: const ['Home']),
//  const Route(path: '/home', name: 'Home', component: DefaultViewComponent),
//  const Route(path: '/search', name: 'Search', component: RecipeSearchComponent),
//  const Route(path: '/detail/:id', name: 'Detail', component: RecipeViewComponent),
//  const Route(path: '/hover/:id', name: 'Hover', component: RecipeViewComponent),
//])
//final heroes = RoutePath(path: 'heroes');

final home = RoutePath(path: 'home');
final search = RoutePath(path: 'search');
final detail = RoutePath(path: 'detail');
final hover = RoutePath(path: 'hover');
