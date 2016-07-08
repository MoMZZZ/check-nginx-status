# check-nginx-status
监控nginx状态

	需要预先配置Nginx的监控页面
```
location /nginx_status {
        stub_status     on;
        access_log      off;
        allow           127.0.0.1;
        deny all;
}
```

##使用方法
第一个参数输入需要检测的状态

	脚本名	参数
	check-nginx-status.sh ping
	check-nginx-status.sh active