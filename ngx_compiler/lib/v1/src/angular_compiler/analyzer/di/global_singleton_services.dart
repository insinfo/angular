import '../link.dart';

const _globalSingletonServices = [
  TypeLink(
    'ApplicationRef',
    'asset:ngx_core/lib/src/core/application_ref.dart',
  ),
  TypeLink(
    'AppViewUtils',
    'asset:ngx_core/lib/src/core/linker/app_view_utils.dart',
  ),
  TypeLink(
    'NgZone',
    'asset:ngx_core/lib/src/core/zone/ng_zone.dart',
  ),
  TypeLink(
    'Testability',
    'asset:ngx_core/lib/src/testability/implementation.dart',
  ),
];

bool isGlobalSingletonService(TypeLink service) =>
    _globalSingletonServices.contains(service);
