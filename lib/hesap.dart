import 'userdata.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc = 0;
    sonuc = 90 + _userData.haftadayapilanspor - _userData.icilensigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    if (_userData.seciliCinsiyet == 'KADIN') {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
