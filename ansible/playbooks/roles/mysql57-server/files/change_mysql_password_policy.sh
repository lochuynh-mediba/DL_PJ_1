#!/bin/bash

# 保存したテンポラリパスワードでパスワードポリシーを変更する
mysql --defaults-file=/root/.tmp.my.cnf -e "SET GLOBAL validate_password_length=4" #4文字以上は許容する

if [ $? -gt 0 ]; then
    echo "$@" 1>&2
    exit 1
fi

mysql --defaults-file=/root/.tmp.my.cnf -e "SET GLOBAL validate_password_policy=LOW" #小文字のみでもOKにする

if [ $? -gt 0 ]; then
    echo "$@" 1>&2
    exit 1
fi
