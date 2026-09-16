import 'package:conduit_core/conduit_core.dart';

class AppChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print('$rec ${rec.error ?? ''}'));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route('/health').linkFunction((request) async {
      return Response.ok({'status': 'healthy'});
    });

    return router;
  }
}
