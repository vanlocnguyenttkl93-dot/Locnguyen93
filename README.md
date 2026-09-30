# MU Local

Game ARPG chạy offline trên máy local, lấy cảm hứng từ cơ chế công khai của MU Online / MU Mobile. Toàn bộ code và đồ họa viết mới — không dùng asset hay code của Webzen.

- Tài liệu nghiên cứu: [docs/RESEARCH.md](docs/RESEARCH.md)
- Game: [game/](game/) (HTML5 + JS thuần, không cần cài đặt)

## Cài trên PC nhà (cách nhanh nhất)

Copy **một file** `dist/MU-Local.html` sang máy, double-click để mở bằng Chrome/Edge/Firefox. Không cần internet hay cài đặt. Bản đầy đủ source: `dist/MU-Local-source.zip`. Sau khi sửa code, chạy `./build.sh` để đóng gói lại.

> Save nằm trong trình duyệt (localStorage) — đổi trình duyệt hoặc xóa dữ liệu duyệt web sẽ mất tiến trình.

## Chạy từ source

```bash
cd game
python3 -m http.server 8000   # hoặc: npx serve .
# mở http://localhost:8000
```

Hoặc mở thẳng `game/index.html` bằng trình duyệt.

## Điều khiển

| Phím / chuột | Chức năng |
|---|---|
| Click đất / WASD | Di chuyển |
| Click quái | Chọn mục tiêu & tự đánh |
| Click NPC | Mở Shop (Merchant) / Quest (Quest Master) |
| 1 / 2 / 3 | Skill |
| Q / E | Dùng HP / MP potion |
| F | Auto-battle |
| C / I / J | Nhân vật / Túi đồ / Quest |

Tiến trình tự lưu vào `localStorage` của trình duyệt.

## Tính năng

3 class (Dark Knight, Dark Wizard, Fairy Elf) · stat + điểm cộng · 5 vùng quái + boss Golden Budge Dragon · item 4 slot +0..+13 · Excellent · Jewel of Bless/Soul · Wings · quest chain · shop · loot rớt đất · auto-battle.
