import 'package:go_router/go_router.dart';

GoRoute createFeatureRoute({
  required String path,
  required GoRouterWidgetBuilder builder,
  List<RouteBase> subRoutes = const [],
}) {
  return GoRoute(
    path: path,
    builder: builder,
    routes: subRoutes,
  );
}
