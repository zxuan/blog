 #!/bin/bash

# Date 2014.03.17
# Author xuan.zheng
# Version 0.1
# creative a blog fille


time=`date +%Y-%m-%d`
title=""

while [ -z $title ] ;do
	echo -e "输入博客标题:\n"
	read title
done

filename="_posts/${time}-${title}.markdown"

if [ -s "$filename" ] ;then
	echo -e "${filename}文件已存在!\n"
	exit 0
fi	

echo -e "输入博客标签，多个标签用空格分割:\n"
read tags

echo "---" >>$filename
echo "title: '$title'" >>$filename
echo "layout: post" >> $filename
echo "guid: urn:uuid:`uuidgen`" >>$filename
echo "tags: " >>$filename

for tag in $tags 
do
	echo "  - $tag" >>$filename
done

echo "---" >>$filename

