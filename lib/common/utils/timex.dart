timeStampToString(int timeStamp) {
  var _nowDate = DateTime.now(); //当前日期
  var _conDate =
      DateTime.fromMillisecondsSinceEpoch(timeStamp); //传入的日期 millTime为毫秒级时间戳

  String _returnTime = ''; //转换后的时间
  var flagMonth = 0;

  if (_nowDate.year != _conDate.year) {
    _returnTime = '${_conDate.year}年';
  }

  if (_nowDate.month != _conDate.month) {
    _returnTime = _returnTime + '${_conDate.month}月';
    flagMonth = 1;
  }

  if (_nowDate.day != _conDate.day) {
    if (flagMonth == 0) {
      _returnTime = _returnTime + '${_conDate.month}月';
    }
    _returnTime = _returnTime + '${_conDate.day}日 ';
    return _returnTime;
  }

  // 凌晨：0时至5时；早晨：5时至8时；上午：8时至11时；中午：11时至13时；下午：13时至16时；傍晚：16时至19时；晚上：19时至24时。
  int _conHour = _conDate.hour;

  // if (_conHour >= 0 && _conHour < 5) {
  //   _returnTime = '凌晨';
  // } else if (_conHour >= 5 && _conHour < 8) {
  //   _returnTime = '早晨';
  // } else if (_conHour >= 8 && _conHour < 11) {
  //   _returnTime = '上午';
  // } else if (_conHour >= 11 && _conHour < 13) {
  //   _returnTime = '中午';
  // } else if (_conHour >= 13 && _conHour < 16) {
  //   _returnTime = '下午';
  // } else if (_conHour >= 16 && _conHour < 19) {
  //   _returnTime = '傍晚';
  // } else if (_conHour >= 19 && _conHour <= 23) {
  //   _returnTime = '晚上';
  // }

  return _returnTime +
      _conHour.toString().padLeft(2, '0') +
      ':' +
      _conDate.minute.toString().padLeft(2, '0');
}
