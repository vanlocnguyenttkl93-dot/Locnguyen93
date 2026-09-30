# Nghiên cứu MU Online / MU Mobile

Tổng hợp từ nguồn công khai (wiki, bài hướng dẫn, GitHub). Dùng làm tài liệu thiết kế cho bản game local trong `game/`.

## 1. Bối cảnh

| Game | Ghi chú |
|------|---------|
| **MU Online** (Webzen, 2001) | MMORPG gốc, hiện có ~14 class, nhiều map, item +0..+13 |
| **MU Origin / MU Origin 2** | Bản mobile spin-off, 3 class khởi đầu, auto-play, wings, PvP arena, guild |
| **MU Archangel / MU Immortal** | Các bản mobile khác cùng thương hiệu, cùng 3 class Dark Knight / Dark Wizard / Elf |
| **OpenMU** ([MUnique/OpenMU](https://github.com/MUnique/OpenMU)) | Server emulator MIT license, C#/.NET, viết từ đầu (không dựa trên decompile), nhắm Season 6 Ep 3 |

## 2. Class

- **Dark Knight** – cận chiến, trâu bò, dùng kiếm. Stat gốc ≈ STR 28 / AGI 20 / VIT 25 / ENE 10.
- **Dark Wizard** – phép tầm xa, tốn mana, máu giấy. Stat gốc ≈ STR 18 / AGI 18 / VIT 15 / ENE 30.
- **Fairy Elf** – 2 hướng: Energy Elf (buff/hồi máu) và Agility Elf (cung thủ, né cao). Stat gốc ≈ STR 22 / AGI 25 / VIT 20 / ENE 15.
- Các class mở khóa sau: Magic Gladiator, Dark Lord, Summoner, Rage Fighter, Grow Lancer, Rune Mage, Slayer, Gun Crusher, White Wizard...

## 3. Hệ thống game

- **Stat**: STR / AGI / VIT / ENE, mỗi level lên nhận điểm để tự cộng.
- **Item**: cấp +0 → +13; full set có hiệu ứng thêm; item **Excellent** có option đặc biệt.
- **Jewel**: *Jewel of Bless* (chắc chắn thành công ở cấp thấp), *Jewel of Soul* (có xác suất, thất bại có thể tụt cấp ở cấp cao).
- **Wings**: tăng chỉ số lớn, thay đổi/nâng cấp theo thời gian.
- **Quest**: Main (1 lần), Daily, Target.
- **Auto-play**: auto quest + auto battle (điểm nhấn của bản mobile).
- **Map**: Lorencia (khởi đầu), Noria (Elf), Elbeland (Summoner), Dungeon, Devias, Atlans, Kanturu, Ignis Volcano...
- **Quái**: Spider, Budge Dragon, Bull Fighter, Hound, Lich, Giant...; **Golden Monster** (boss xuất hiện định kỳ, rớt đồ tốt).
- **PvP Arena, Guild, Auction House, World Boss** (bản mobile).

## 4. Phạm vi bản local (`game/`)

Đã làm (v0.1, chạy offline trong trình duyệt):
- 3 class: Dark Knight, Dark Wizard, Fairy Elf, mỗi class 3 skill + đòn đánh thường.
- Thế giới top-down có thị trấn an toàn (kiểu Lorencia) + 5 vùng quái theo độ khó.
- Stat + điểm cộng, level/EXP, HP/MP, potion.
- Item 4 slot (Weapon / Armor / Wings / Ring), +0..+13, Excellent, Jewel of Bless/Soul.
- Quest chain, NPC shop, loot rớt dưới đất, Golden Budge Dragon boss định kỳ.
- Auto-battle (phím F), lưu tự động vào `localStorage`.

Chưa làm (hướng mở rộng): multiplayer/server (có thể tham khảo kiến trúc OpenMU), PvP, guild, map thứ hai, class mở khóa, pet, set bonus.

## 5. Về bản quyền

Toàn bộ code/đồ họa trong `game/` được viết mới; **không** dùng client, model, texture, âm thanh hay code của Webzen. Chỉ dùng ý tưởng cơ chế công khai. Nếu muốn có server MU thật để chạy local, dùng OpenMU (MIT) cùng client bạn sở hữu hợp pháp.

## Nguồn

- [MU Online – Wikipedia](https://en.wikipedia.org/wiki/Mu_Online)
- [MU Online Fandom Wiki](https://muonline.fandom.com/wiki/MU_Online)
- [MU Online Fanz – Characters](https://muonlinefanz.com/guide/characters/)
- [MU Origin – MMORPG.com](https://www.mmorpg.com/mu-origin)
- [A beginner's guide to MU Origin – PocketGamer](https://pocketgamer.com/articles/070972/a-beginners-guide-to-mu-origin)
- [MU Archangel classes – PocketGamer](https://pocketgamer.com/articles/086539/mu-archangel-classes-what-you-need-to-know-about-dark-knight-dark-wizard-and-elf)
- [OpenMU – GitHub](https://github.com/MUnique/OpenMU)
