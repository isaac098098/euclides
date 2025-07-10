# `ffmpeg` presets

Para videos que son originalmente bajos en calidad (`TikTok`, `Facebook`, etc.)

```
ffmpeg -i input.mp4 -c:v hevc_nvenc -cq 35 -preset p4 -c:a libopus output.mkv
```

Otros

```
ffmpeg -i input.mp4 -c:v hevc_nvenc -cq 30 -preset p4 -c:a libopus output.mkv
```

Con reescalado

```
ffmpeg -i input.mp4 -vf scale=1920:-1 -c:v hevc_nvenc -cq 30 -preset p4 -c:a libopus output.mkv
```

Ultra rápido (baja calidad)

```
ffmpeg -i input.mp4 -c:v hevc_nvenc -cq 50 -preset p1 -c:a libopus output.mkv
```
