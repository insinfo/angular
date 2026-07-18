import 'dart:html' show DocumentFragment, NodeTreeSanitizer;

import 'package:ngx_core/src/core/application_tokens.dart' as tokens show appId;
import 'package:ngx_core/src/runtime/dom_events.dart' show EventManager;

/// Application wide view utilities.
late AppViewUtils appViewUtils;

/// Utilities to create unique RenderComponentType instances for AppViews and
/// provide access to root dom renderer.
class AppViewUtils {
  final String appId;
  final EventManager eventManager;

  AppViewUtils(
    @tokens.appId this.appId,
    this.eventManager,
  );
}

/// Creates a document fragment from [trustedHtml].
DocumentFragment createTrustedHtml(String trustedHtml) {
  return DocumentFragment.html(
    trustedHtml,
    treeSanitizer: NodeTreeSanitizer.trusted,
  );
}
