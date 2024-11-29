import 'CuaHangQL.dart';
import 'HoaDon.dart';
import 'SanPham.dart';

void main() {
  // Tao mot cua hang
  CuaHang cuaHang = CuaHang('Cua hang A', '123 Duong ABC');

  // Kiem tra quan ly thong tin dien thoai
  print('\n--- Quan ly dien thoai ---');
  SanPham dt1 = SanPham(
    'DT-001',
    'iPhone 14',
    'Apple',
    20000000,
    25000000,
    10,
    true,
  );

  SanPham dt2 = SanPham(
    'DT-002',
    'Samsung Galaxy S23',
    'Samsung',
    18000000,
    22000000,
    5,
    true,
  );

  cuaHang.themDienThoaiMoi(dt1);
  cuaHang.themDienThoaiMoi(dt2);

  // Cap nhat thong tin dien thoai
  SanPham dtUpdate = SanPham(
    'DT-001',
    'iPhone 14 Pro',
    'Apple',
    23000000,
    28000000,
    8,
    true,
  );
  cuaHang.capNhatThongTinDienThoai('DT-001', dtUpdate);

  // Hien thi danh sach dien thoai
  cuaHang.hienThiDanhSachDienThoai();

  // Kiem tra ngung kinh doanh
  cuaHang.ngungKinhDoanhDienThoai('DT-002');

  // Tim kiem dien thoai
  var timKiemDT = cuaHang.timKiemDienThoai(ma: 'DT-001');
  if (timKiemDT != null) {
    print('Tim thay dien thoai: ${timKiemDT.tenDT}');
  }

  // Kiem tra quan ly hoa don
  print('\n--- Quan ly hoa don ---');
  HoaDon hd1 = HoaDon(
    'HD-001',
    DateTime.now(),
    dt1,
    2,
    28000000,
    'Nguyen Van A',
    '0901234567',
  );

  cuaHang.taoHoaDonMoi(hd1);

  HoaDon hd2 = HoaDon(
    'HD-002',
    DateTime.now(),
    dt1,
    1,
    28000000,
    'Tran Van B',
    '0909876543',
  );

  cuaHang.taoHoaDonMoi(hd2);

  // Hien thi danh sach hoa don
  cuaHang.hienThiDanhSachHoaDon();

  // Tim kiem hoa don
  var timKiemHD = cuaHang.timKiemHoaDon(ma: 'HD-001');
  if (timKiemHD.isNotEmpty) {
    print('Tim thay hoa don: ${timKiemHD[0].maHoaDon}');
  }

  // Kiem tra thong ke
  print('\n--- Thong ke ---');
  DateTime tuNgay = DateTime.now().subtract(Duration(days: 30));
  DateTime denNgay = DateTime.now();

  double doanhThu = cuaHang.tinhTongDoanhThu(tuNgay, denNgay);
  print('Tong doanh thu: $doanhThu');

  double loiNhuan = cuaHang.tinhTongLoiNhuan(tuNgay, denNgay);
  print('Tong loi nhuan: $loiNhuan');

  var topBanChay = cuaHang.thongKeTopBanChay(1);
  print(
      'Top dien thoai ban chay: ${topBanChay.map((dt) => dt.tenDT).join(', ')}');

  var tonKho = cuaHang.thongKeTonKho();
  print('San pham ton kho: ${tonKho.map((dt) => dt.tenDT).join(', ')}');
}
