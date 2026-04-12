import 'package:common/common.dart';

class TextEditingControllerWithData<D> extends TextEditingController {
  TextEditingControllerWithData({super.text, D? data}) : _data = data;

  D? _data;

  D? get data => _data;

  void setData(D? data) {
    _data = data;
  }
}
