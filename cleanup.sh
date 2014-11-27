#!/bin/sh

if [ $# -ne 1 ]; then
  echo '第一引数にお掃除対象となるディレクトリパスを設定してください。

例)
C:\Project\workspaces\colehaan-ec'
  exit 1
fi

# hit count.
total=0
cnt=0

# read file.
while read line
do
  cnt=`find $1 -name "${line}" | wc -l`
  total=`expr $total + $cnt`
done < ex.conf

# match file not exists.
if [ $total -eq 0  ]; then
  echo 'NO MATCHES... \n[FINISHED]'
  exit 0
fi

# read file.
echo "-----------DELETE LIST( ${total} )------------"
while read line
do
  find $1 -name "${line}" -exec echo {} \;
done < ex.conf


echo "\n REMOVE FILES ? [y/n]"
read ANS

# YES
if [ $ANS = 'y' -o $ANS = 'yes' ]; then
  while read line
  do
    find $1 -name "${line}" -exec rm {} \;
  done < ex.conf

  echo 'ALL DELETED.\n[FINISHED]'

# NO
else
  echo '\n NO EXECUTE...\n[FINISHED]'
fi
