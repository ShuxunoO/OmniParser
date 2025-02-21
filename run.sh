#!/bin/bash

# 创建 weights 文件夹
mkdir -p weights

# 安装 huggingface-cli
pip install huggingface_hub

# 下载模型文件
for f in icon_detect/{train_args.yaml,model.pt,model.yaml} icon_caption/{config.json,generation_config.json,model.safetensors}; do
    huggingface-cli download microsoft/OmniParser-v2.0 "$f" --local-dir weights
done

# 重命名文件夹
mv weights/icon_caption weights/icon_caption_florence