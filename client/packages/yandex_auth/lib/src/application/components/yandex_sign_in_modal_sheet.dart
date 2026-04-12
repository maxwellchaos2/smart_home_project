import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:projects/projects.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yandex_auth/src/application/application.dart';

class YandexSignInModalSheet extends StatefulWidget {
  const YandexSignInModalSheet({
    super.key,
    required this.clientId,
  });

  final String clientId;

  Future<void> show(BuildContext context) {
    return showCupertinoSheet(
      context: context,
      builder: (context) => YandexSignInScope(
        child: this,
      ),
    );
  }

  @override
  State<YandexSignInModalSheet> createState() => _YandexSignInModalSheetState();
}

class _YandexSignInModalSheetState
    extends StateWithListeners<YandexSignInModalSheet> {
  WebViewController? controller;
  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    // Очищаем cookies и кэш перед инициализацией
    await WebViewCookieManager().clearCookies();

    if (!mounted) return;

    controller = WebViewController();
    controller!.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller!.addJavaScriptChannel('Alert', onMessageReceived: (message) {
      context.app.showErrorDialog(message: message.message);
    });
    controller!.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (request) async {
          if (request.url.startsWith('https://success')) {
            final uri = Uri.parse(request.url);
            final code = uri.queryParameters['code'];
            YandexSignInScope.of(context).signIn(code: code!);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageFinished: (url) {
          controller!.runJavaScript('''
      window.alert = function (e){
        Alert.postMessage(e);
      }
      ''');
        },
      ),
    );
    controller!.loadRequest(Uri.parse(
        'https://oauth.yandex.ru/authorize?response_type=code&client_id=${widget.clientId}'));

    if (mounted) {
      setState(() {});
    }
  }

  @override
  List<SingleChildWidget> get listeners => [
        YandexSignInBlocListener(
          listener: (context, state) => state.mapOrNull(
            failure: (state) =>
                context.app.showErrorDialog(message: state.failure.message),
            success: (state) {
              ProjectScope.of(context).fetch();
              Navigator.of(context).pop();
              return null;
            },
          ),
        )
      ];

  @override
  Widget buildChild(BuildContext context) {
    // final state = YandexSignInScope.of(context, listen: true).state;
    return Scaffold(
      body: Column(
        children: [
          Text('Войти через Яндекс'),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (controller == null)
                  Container(
                    color: Colors.black.withValues(alpha: .5),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                else
                  WebViewWidget(controller: controller!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
