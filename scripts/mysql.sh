#!/bin/bash
# -------------------------------------------------------------------------------
# FileName:    check_mysql.sh
# Revision:    1.0
# Date:        2018/01/31
# Author:      chunk
# Email:       
# Website:     
# Description: 
# Notes:       ~
# -------------------------------------------------------------------------------
# Copyright:   
# License:     GPL

#
#用于检查mysql的语句执行效率
#


# 用户名
MYSQL_USER='root'

# 密码
MYSQL_PWD='jmuser'

# 主机地址/IP
MYSQL_HOST='127.0.0.1'

# 端口
MYSQL_PORT='33060'

# 数据连接
MYSQL_CONN="/opt/JMKVCloud/MessageSoft/Mysql/bin/mysqladmin -u${MYSQL_USER} -p${MYSQL_PWD} -h${MYSQL_HOST} -P${MYSQL_PORT}"

# 参数是否正确
if [ $# -ne "1" ];then 
    echo "arg error!" 
fi 


# 获取数据
case $1 in 
    Uptime) 
        result=`${MYSQL_CONN} status 2>/dev/null |cut -f2 -d":"|cut -f1 -d"T"   ` 
        echo $result 
        ;; 
    Com_update) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null |grep -w "Com_update"|cut -d"|" -f3` 
        echo $result 
        ;; 
    Slow_queries) 
        result=`${MYSQL_CONN} status 2>/dev/null |cut -f5 -d":"|cut -f1 -d"O"` 
        echo $result 
        ;; 
    Com_select) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null |grep -w "Com_select"|cut -d"|" -f3` 
        echo $result 
                ;; 
    Com_rollback) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null |grep -w "Com_rollback"|cut -d"|" -f3` 
                echo $result 
                ;; 
    Questions) 
        result=`${MYSQL_CONN} status 2>/dev/null  |cut -f4 -d":"|cut -f1 -d"S"` 
                echo $result 
                ;; 
    Com_insert) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null |grep -w "Com_insert"|cut -d"|" -f3` 
                echo $result 
                ;; 
    Com_delete) 
        result=`${MYSQL_CONN} extended-status  2>/dev/null  |grep -w "Com_delete"|cut -d"|" -f3` 
                echo $result 
                ;; 
    Com_commit) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null  |grep -w "Com_commit"|cut -d"|" -f3` 
                echo $result 
                ;; 
    Bytes_sent) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null  |grep -w "Bytes_sent" |cut -d"|" -f3` 
                echo $result 
                ;; 
    Bytes_received) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null  |grep -w "Bytes_received" |cut -d"|" -f3` 
                echo $result 
                ;; 
    Com_begin) 
        result=`${MYSQL_CONN} extended-status 2>/dev/null  |grep -w "Com_begin"|cut -d"|" -f3` 
                echo $result 
                ;; 
    Max_used_connections)
        result=`${MYSQL_CONN} extended-status 2>/dev/null |grep -iw "Max_used_connections" |cut -d"|" -f3`
        echo $result
		;;
    Threads_connected)	
	result=`${MYSQL_CONN} extended-status 2>/dev/null |grep -i "Threads_connected" |cut -d"|" -f3`
	echo $result
		;;

    *)
        echo "Usage:$0(Uptime|Com_update|Slow_queries|Com_select|Com_rollback|Questions|Com_insert|Com_delete|Com_commit|Bytes_sent|Bytes_received|Com_begin|Max_used_connections|Threads_connected)" 
        ;; 
esac

