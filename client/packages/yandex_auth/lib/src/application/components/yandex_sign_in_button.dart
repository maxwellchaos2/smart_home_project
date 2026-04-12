import 'package:common/common.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_auth/src/application/application.dart';

class YandexSignInButton extends StatelessWidget {
  const YandexSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFormButton.primary(
      onPressed: () {
        YandexSignInModalSheet(
          clientId: '6135036a25204ffe9ac3d7c997304b34',
        ).show(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      child: Row(
        children: [
          SvgPicture.string(
              '''<svg width="44" height="44" viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="44" height="44" rx="22" fill="#FC3F1D"></rect>
<path d="M22.5968 24.2728C23.8823 27.0888 24.3109 28.0682 24.3109 31.4505V35.9347H19.7196V28.3743L11.0573 9.53467H15.8476L22.5968 24.2728ZM28.2594 9.53467L22.6427 22.2985H27.3105L32.9425 9.53467H28.2594Z" fill="white"></path>
</svg>'''),
          const SizedBox(width: 10),
          Text('Войти через Яндекс'),
        ],
      ),
    );
  }
}
