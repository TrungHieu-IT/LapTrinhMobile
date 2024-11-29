import 'SanPham.dart'; // Gia su ban da trien khai lop SanPham

class HoaDon {
  // Thuoc tinh
  String _maHoaDon;
  DateTime _ngayBan;
  SanPham _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoaiDuocBan,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  ) {
    // Validation
    maHoaDon = _maHoaDon;
    ngayBan = _ngayBan;
    soLuongMua = _soLuongMua;
    giaBanThucTe = _giaBanThucTe;
    tenKhachHang = _tenKhachHang;
    soDienThoaiKhach = _soDienThoaiKhach;
  }

  // Getter va Setter voi validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      throw ArgumentError(
          'Ma hoa don khong hop le! Dinh dang phai la "HD-XXX".');
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw ArgumentError('Ngay ban khong duoc sau ngay hien tai.');
    }
    _ngayBan = value;
  }

  SanPham get dienThoaiDuocBan => _dienThoaiDuocBan;

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0 || value > _dienThoaiDuocBan.SLTonKho) {
      throw ArgumentError(
          'So luong mua phai lon hon 0 va khong duoc vuot qua so luong ton kho.');
    }
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) {
      throw ArgumentError('Gia ban thuc te phai lon hon 0.');
    }
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Ten khach hang khong duoc rong.');
    }
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      throw ArgumentError(
          'So dien thoai khach khong hop le! Phai la 10 chu so.');
    }
    _soDienThoaiKhach = value;
  }

  // Phuong thuc tinh tong tien
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  // Phuong thuc tinh loi nhuan thuc te
  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoaiDuocBan.giaNhap) * _soLuongMua;
  }

  // Phuong thuc hien thi thong tin hoa don
  void hienThiThongTinHoaDon() {
    print('Ma hoa don: $_maHoaDon');
    print('Ngay ban: ${_ngayBan.toIso8601String()}');
    print('Ten dien thoai: ${_dienThoaiDuocBan.tenDT}');
    print('So luong mua: $_soLuongMua');
    print('Gia ban thuc te: $_giaBanThucTe');
    print('Ten khach hang: $_tenKhachHang');
    print('So dien thoai khach: $_soDienThoaiKhach');
    print('Tong tien: ${tinhTongTien()}');
    print('Loi nhuan thuc te: ${tinhLoiNhuanThucTe()}');
  }
}
