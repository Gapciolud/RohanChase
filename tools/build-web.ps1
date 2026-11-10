# Builds the Android start page (app/src/main/assets/index.html) from the game source (web/szarza-rohirrimow.html).
# The source is written for claude.ai artifacts, which add the document skeleton themselves; the app needs a full page.
$root = Split-Path -Parent $PSScriptRoot
$src = Join-Path $root 'web/szarza-rohirrimow.html'
$out = Join-Path $root 'app/src/main/assets/index.html'

$game = [System.IO.File]::ReadAllText($src, [System.Text.Encoding]::UTF8)

$head = @'
<!doctype html>
<html lang="pl">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
<style>
:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
body{margin:0;font:14px system-ui,sans-serif;-webkit-tap-highlight-color:transparent}
img{max-width:100%}
[hidden]{display:none!important}
/* the app has no shared claude.ai ranking: only the local one */
.tabs{display:none!important}
/* touch only: hold buttons say "hold" instead of naming keyboard keys */
.hold .key{font-size:0!important}
.hold .key::after{content:"przytrzymaj";font-size:10px;letter-spacing:.04em}
</style>
</head>
<body>
'@

New-Item -ItemType Directory -Force -Path (Split-Path -Parent $out) | Out-Null
[System.IO.File]::WriteAllText($out, $head + $game + "`n</body>`n</html>`n", (New-Object System.Text.UTF8Encoding $false))
Write-Output "Built $out"
