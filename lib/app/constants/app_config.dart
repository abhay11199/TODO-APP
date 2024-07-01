import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  double? _height;
  double? _width;
  double? _heightPadding;
  double? _widthPadding;
  Size? _size;
  double? _textScale;

  AppConfig(this.context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    _size = _queryData.size;
    _height = _size!.height / 100.0;
    _width = _size!.width / 100.0;
    _heightPadding = _height! -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width! - (_queryData.padding.left + _queryData.padding.right) / 100.0;
    _textScale = _queryData.textScaleFactor;
  }

  Size deviceSize() {
    return _size!;
  }

  double deviceHeight(double v) {
    return _height! * v;
  }

  double deviceWidth(double v) {
    return _width! * v;
  }

  double rHP(double v) {
    return _heightPadding! * v;
  }

  double rWP(double v) {
    return _widthPadding! * v;
  }

  double textSizeScale(double v) {
    return v * _textScale!;
  }
}
