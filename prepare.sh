#!/bin/sh

hive -f postdata.ddl

wget http://www.post.japanpost.jp/zipcode/dl/roman/ken_all_rome.zip

unzip ken_all_rome.zip

hive -f load.hql

