# Rohan Chase · Szarża Rohirrimów

A top-down arcade game for Android: lead an éored of Rohan riders across the Pelennor Fields and trample the orc hordes.

## Install on a phone

1. Open **Releases** on this repository on your Android phone and download the newest `RohanChase.apk`.
2. Open the file. If Android asks, allow installing apps from this source (browser or file manager).
3. Start **Rohan Chase** from the app list.

Each push to `main` builds a new APK in GitHub Actions and publishes it as a release. This is a debug-signed build, meant for your own phone, not for Google Play.

## How to play

| Control | Touch | Keyboard |
|---|---|---|
| Steer | drag a finger; higher = faster, lower = slower | ← → / A D |
| Spur / rein | | ↑ W / ↓ S |
| Line abreast | hold **Linia** | R |
| Column (walls, bridges) | hold **Szyk** | Q / C |
| Shields (stop arrows) | hold **Tarcze** | Shift / E |
| Horn of Rohan | tap **Róg Rohanu** when charged | Space |
| Pause | Android Back button | P |

- **Kłus · Galop · Cwał** at the top shows your gait. At a trot orcs drag riders down; at full gallop even Uruk-hai fall in one hit.
- Red circles are arrow volleys (raise shields), orange ones are catapult fire (get out).
- Squeeze into a column before walls and rivers, or the riders who don't fit are lost.
- Never trample the hobbits: the Nazgûl will take the Ring.

The ranking is kept on the phone (top 10, with a player name).

## Project layout

- `web/szarza-rohirrimow.html`: the game itself (HTML5 canvas, no libraries).
- `tools/build-web.ps1`: wraps the game into `app/src/main/assets/index.html` for the app.
- `app/`: a small Android app (Java, WebView) that runs the game full screen and offline.
- `.github/workflows/android.yml`: builds the APK and publishes the release.

To change the game, edit `web/szarza-rohirrimow.html`, run `pwsh tools/build-web.ps1`, and push. To build locally, open the folder in Android Studio.
