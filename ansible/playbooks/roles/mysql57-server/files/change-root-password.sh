#!/bin/bash

# 保存したテンポラリパスワードでrootのパスワードを変更する
new_pass='mysql'
mysql --defaults-file=/root/.tmp.my.cnf -e "ALTER USER 'root'@'localhost' IDENTIFIED BY  '$new_pass' "

if [ $? -gt 0 ]; then
    echo "$@" 1>&2
    exit 1
fi

# 変更したパスワードを一応保管する
umask 0077
cat > /root/.my.cnf <<EOF
[client]
user=root
password=$new_pass
EOF