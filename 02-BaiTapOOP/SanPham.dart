class SanPham {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _SLTonKho;
  bool _trangThai;

  SanPham(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan,
      this._SLTonKho, this._trangThai);

  // getter
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get SLTonKho => _SLTonKho;
  bool get trangThai => _trangThai;

  // setter
  set maDT(String maDT) {
    if (maDT.isEmpty || !RegExp(r'^DT-\d{3}$').hasMatch(maDT)) {
      throw ArgumentError(
          'Ma dien thoai khong hop le! Dinh dang phai la "DT-XXX".');
    }
    _maDT = maDT;
  }

  set tenDT(String tenDT) {
    if (tenDT.isNotEmpty) {
      _tenDT = tenDT;
    }
  }

  set hangSX(String hangSX) {
    if (hangSX.isNotEmpty) {
      _hangSX = hangSX;
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > giaNhap) {
      _giaBan = giaBan;
    }
  }

  set SLTonKho(int SL) {
    _SLTonKho = SL;
  }

  set trangThai(bool TT) {
    _trangThai = TT;
  }

  // methods
  double loiNhuanDuKien(double giaBan, double giaNhap) {
    return giaBan - giaNhap;
  }

  void hienThiThongTin() {
    print('Ma dien thoai: $_maDT');
    print('Ten dien thoai: $_tenDT');
    print('Hang san xuat: $_hangSX');
    print('Gia nhap: $_giaNhap');
    print('Gia ban: $_giaBan');
    print('So luong ton kho: $_SLTonKho');
    print('Trang thai: ${_trangThai ? 'Con kinh doanh' : 'Ngung kinh doanh'}');
  }

  bool kiemTraCoTheBan() {
    return _SLTonKho > 0 && _trangThai;
  }
}
