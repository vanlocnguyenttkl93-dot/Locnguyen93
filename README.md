# MU Local

Game ARPG chạy offline trên máy local, lấy cảm hứng từ cơ chế công khai của MU Online / MU Mobile. Code viết mới, đồ họa dùng asset CC0 của Kenney — không dùng asset hay code của Webzen.

- Tài liệu nghiên cứu: [docs/RESEARCH.md](docs/RESEARCH.md)
- Game: [game/](game/) (HTML5 + JS thuần, không cần cài đặt)
- Server MU thật cho client PC bạn đã có (OpenMU): [server/](server/README.md)

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

## Maps

| Map | Yêu cầu | Quái (level) | Boss |
|---|---|---|---|
| Lorencia | Lv 1 | Spider, Budge Dragon, Bull Fighter, Hound, Lich (2-30) | Golden Budge Dragon |
| Noria | Lv 10 | Goblin, Poison Slime, Wolf, Elite Goblin (10-23) | Golden Goblin |
| Devias | Lv 25 | Ice Monster, Hommerd, Snow Bat, Ice Queen (27-40) | Golden Ice Queen |
| Dungeon | Lv 35 | Skeleton, Larva, Death Crab, Shadow Knight (38-50) | Golden Death Knight |
| Atlans | Lv 50 | Sea Crab, Vepar, Bahamut, Sea Giant (52-66) | Golden Kraken |

Mỗi map có thị trấn an toàn với Merchant, Quest Master và **Gatekeeper** (NPC tím) để dịch chuyển giữa các map (tab Warp, tốn zen).

## Tính năng

3 class (Dark Knight, Dark Wizard, Fairy Elf) · stat + điểm cộng · 5 vùng quái + boss Golden Budge Dragon · item 4 slot +0..+13 · Excellent · Jewel of Bless/Soul · Wings · quest chain · shop · loot rớt đất · auto-battle.

## Hình ảnh

Sprite từ [Kenney](https://kenney.nl) *Tiny Dungeon* và *Tiny Town* (giấy phép CC0), nhúng sẵn trong `game/assets/atlas.js`; icon wings/ring/jewel vẽ bằng code. Xem `game/assets/CREDITS.txt`. Tạo lại atlas: `python3 tools/make_atlas.py <tiny-dungeon-dir> <tiny-town-dir>` (cần Pillow). Không dùng asset của Webzen.
