import 'package:common/common.dart';
import 'package:hikvision_isapi/hikvision_isapi.dart';
import 'package:hikvision_isapi/src/application/application.dart';

class IsapiEventRow extends StatelessWidget {
  const IsapiEventRow({super.key, required this.event});

  final IsapiEventEntity event;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  IsapiEventTypeMapper.toName(from: event.type),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                event.dateTime.toFullFormat(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ],
          ),
          if (event.name != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    event.name!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFAFAFAF),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
