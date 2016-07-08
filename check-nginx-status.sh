#!/bin/bash
# 创建：高峰
# 时间：2016-07-08

HOST="127.0.0.1"
PORT="11010"


function ping {
	# 检测Nginx Worker Process进程数量
    ps -ef|grep "nginx: worker process"|grep -v grep|wc -l
}


# 检测nginx性能
function active {
    /usr/bin/curl "http://$HOST:$PORT/nginx_status" 2>/dev/null | grep 'Active' | awk '{print $NF}'
}
function reading {
    /usr/bin/curl "http://$HOST:$PORT/nginx_status" 2>/dev/null | grep 'Reading' | awk '{print $2}'
}
function writing {
    /usr/bin/curl "http://$HOST:$PORT/nginx_status" 2>/dev/null | grep 'Writing' | awk '{print $4}'
}
function waiting {
    /usr/bin/curl "http://$HOST:$PORT/nginx_status" 2>/dev/null | grep 'Waiting' | awk '{print $6}'
}
function accepts {
    /usr/bin/curl "http://$HOST:$PORT/nginx_status" 2>/dev/null | awk NR==3 | awk '{print $1}'
}
function handled {
    /usr/bin/curl "http://$HOST:$PORT/nginx_status" 2>/dev/null | awk NR==3 | awk '{print $2}'
}
function requests {
    /usr/bin/curl "http://$HOST:$PORT/nginx_status" 2>/dev/null | awk NR==3 | awk '{print $3}'
}


if [[ -z $1 ]]; then
	# 如果第一个参数没有，就把所有都打印出来。
	 /usr/bin/curl "http://$HOST:$PORT/nginx_status"
else
	$1
fi