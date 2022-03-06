files=$(ls)
t=$(date)
main=index.html
cat /dev/null > $main
echo '<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8"><title>openwrt-基于原版</title></head><body><h1>openwrt-基于原版</h1><ul>' > $main
for i in $files; do
  if [ $i != 'index.html' ] && [ $i != 'getindex.sh' ] && [ $i != 'main.html' ]; then
    echo '<li><a href="'$i'">'$i'</a></li>' >> $main
  fi
done
echo '<li>'$t'</li>' >> $main
echo '</ul></body></html>' >> $main
echo '首页文件生成完毕'
