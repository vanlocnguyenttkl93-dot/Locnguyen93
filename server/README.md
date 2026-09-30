# Server MU local (OpenMU)

Bộ chạy server [OpenMU](https://github.com/MUnique/OpenMU) (MIT) trên PC, kết nối bằng **client MU PC bạn đã có**. Làm theo tài liệu chính thức của OpenMU; các script ở đây chỉ gói lại các bước đó.

> ⚠ Chỉ dành cho client **MU Online bản PC** (OpenMU chính là Season 6 Episode 3 ENG; ngoài ra có 0.75 và 0.95d). Client **MU Mobile / APK (MU Origin, Archangel...) không chạy được** với OpenMU vì dùng server và giao thức riêng.

## Chưa kiểm chứng
Các script này được viết dựa trên tài liệu OpenMU nhưng **chưa được chạy thử** (môi trường của tôi không có Docker daemon và PowerShell). Nếu có lỗi, gửi nội dung màn hình lỗi để sửa.

## Bước 0 — Kiểm tra PC và client
1. Chạy `check-pc.bat`, nhập đường dẫn thư mục client (chứa `main.exe`).
2. Gửi nội dung `check-report.txt` (không chứa thông tin cá nhân ngoài đường dẫn) để kiểm tra phiên bản, thiếu file, port bị chiếm.

## Bước 1 — Cài công cụ
- [Docker Desktop](https://docs.docker.com/get-started/get-docker/) (Windows cần WSL2), [git](https://git-scm.com/download/win)
- [.NET 10 runtime](https://dotnet.microsoft.com/download/dotnet/10.0) (cho ClientLauncher)

## Bước 2 — Chạy server
Chạy `start-server.bat` (Linux/macOS: `./start-server.sh`). Lần đầu sẽ tải OpenMU và image Docker. Xong:
- Admin panel: <http://localhost/> — lần đầu chưa cần đăng nhập, **hãy tạo user admin ngay**.
- Server tự khởi tạo cho **Season 6**. Muốn đổi phiên bản (0.75 / 0.95d), số game server hoặc tài khoản test: trang **Setup** trong admin panel (cài lại sẽ xóa dữ liệu).
- Tắt server: `stop-server.bat` (dữ liệu vẫn được giữ trong Docker volume).

## Bước 3 — Vào game
1. Tải [ClientLauncher](https://github.com/MUnique/OpenMU/releases/download/v0.9.0/MUnique.OpenMU.ClientLauncher_0.9.6.zip) của OpenMU.
2. Mở launcher → nhập host **`127.127.127.127`** (⚠ không dùng `127.0.0.1`, client chặn IP này), port **44405**, chọn `main.exe` của bạn.
3. Đăng nhập tài khoản test: `test0`…`test9` (mật khẩu = tên tài khoản, level 1→90), Season 6 còn có `test300`, `test400`, `testgm`…

## Lỗi hay gặp
| Triệu chứng | Cách xử lý |
|---|---|
| Vào game bị ngắt ngay sau khi chọn server | Admin panel → *Configuration → System* → đổi IP resolver thành `Loopback` (chơi trên cùng máy) |
| Port đã bị chiếm (80, 44405…) | Chạy `check-pc.bat` xem chương trình nào đang dùng, hoặc đổi port trong admin panel |
| Docker báo chưa chạy | Mở Docker Desktop, chờ trạng thái "running" |

Nguồn: tài liệu OpenMU — [Requirements](https://github.com/MUnique/OpenMU/blob/master/docs-website/docs/getting-started/requirements.md), [Docker](https://github.com/MUnique/OpenMU/blob/master/docs-website/docs/getting-started/docker.md), [Game client](https://github.com/MUnique/OpenMU/blob/master/docs-website/docs/getting-started/game-client.md), [Test accounts](https://github.com/MUnique/OpenMU/blob/master/docs-website/docs/getting-started/test-accounts.md).
