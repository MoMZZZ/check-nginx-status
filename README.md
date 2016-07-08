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

##参数说明
- ping			Nginx Worker Process进程数量
- active		Nginx当前总的连接数量
- reading		Nginx当前读取客户端的连接数
- writing		Nginx当前相应数据到客户端的连接数
- waiting		Nginx已经处理完正在等候下一次请求指令的驻留连接
- accepets		总共处理的连接数
- handled		成功创建的握手数
- requests		总共处理的请求