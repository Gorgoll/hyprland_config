#!/bin/bash

read GPU MEM_USED MEM_TOTAL <<< $(nvidia-smi \
    --query-gpu=utilization.gpu,memory.used,memory.total \
    --format=csv,noheader,nounits | tr -d ',')

MEM_PCT=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED/$MEM_TOTAL)*100}")

# this emoji sucks
echo "▦ GPU ${GPU}% | VRAM ${MEM_PCT}%"
