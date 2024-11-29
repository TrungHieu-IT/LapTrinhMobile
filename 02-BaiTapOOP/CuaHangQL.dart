import 'HoaDon.dart';
import 'SanPham.dart';

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<SanPham> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter và Setter
  String get tenCuaHang => _tenCuaHang;
  set tenCuaHang(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tên cửa hàng không được rỗng.');
    }
    _tenCuaHang = value;
  }

  String get diaChi => _diaChi;
  set diaChi(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Địa chỉ không được rỗng.');
    }
    _diaChi = value;
  }

  // Phương thức quản lý điện thoại
  void themDienThoaiMoi(SanPham dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print('Đã thêm điện thoại mới: ${dienThoai.tenDT}');
  }

  void capNhatThongTinDienThoai(String maDT, SanPham thongTinMoi) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDT == maDT) {
        dt.tenDT = thongTinMoi.tenDT;
        dt.hangSX = thongTinMoi.hangSX;
        dt.giaNhap = thongTinMoi.giaNhap;
        dt.giaBan = thongTinMoi.giaBan;
        dt.SLTonKho = thongTinMoi.SLTonKho;
        dt.trangThai = thongTinMoi.trangThai;
        print('Đã cập nhật thông tin điện thoại: $maDT');
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã: $maDT');
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDT == maDienThoai) {
        dt.trangThai = false;
        print('Đã ngừng kinh doanh điện thoại: $maDienThoai');
        return;
      }
    }
    print('Không tìm thấy điện thoại với mã: $maDienThoai');
  }

  SanPham? timKiemDienThoai({String? ma, String? ten, String? hang}) {
    var ketQua = _danhSachDienThoai.where(
      (dt) =>
          (ma != null && dt.maDT == ma) ||
          (ten != null && dt.tenDT == ten) ||
          (hang != null && dt.hangSX == hang),
    );
    return ketQua.isNotEmpty ? ketQua.first : null;
  }

  void hienThiDanhSachDienThoai() {
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDonMoi(HoaDon hoaDon) {
    var dienThoai = hoaDon.dienThoaiDuocBan;
    if (hoaDon.soLuongMua <= dienThoai.SLTonKho) {
      dienThoai.SLTonKho -= hoaDon.soLuongMua;
      _danhSachHoaDon.add(hoaDon);
      print('Đã tạo hóa đơn mới: ${hoaDon.maHoaDon}');
    } else {
      print('Không đủ số lượng tồn kho để tạo hóa đơn.');
    }
  }

  List<HoaDon> timKiemHoaDon({String? ma, DateTime? ngay, String? tenKhach}) {
    return _danhSachHoaDon.where((hd) {
      return (ma != null && hd.maHoaDon == ma) ||
          (ngay != null && hd.ngayBan == ngay) ||
          (tenKhach != null && hd.tenKhachHang == tenKhach);
    }).toList();
  }

  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTinHoaDon();
    }
  }

  // Phương thức thống kê
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0.0, (tong, hd) => tong + hd.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0.0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }

  List<SanPham> thongKeTopBanChay(int soLuong) {
    var danhSachBanChay = List<SanPham>.from(_danhSachDienThoai);
    danhSachBanChay.sort((a, b) => b.SLTonKho.compareTo(a.SLTonKho));
    return danhSachBanChay.take(soLuong).toList();
  }

  List<SanPham> thongKeTonKho() {
    return _danhSachDienThoai.where((dt) => dt.SLTonKho > 0).toList();
  }
}
