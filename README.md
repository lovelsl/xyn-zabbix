
<h1>zabbix</h1>




这里保留几个用于监控mysql,nginx,redis的shell监控脚本

对应的conf文件也做一下保留
conf文件定义了server和agent之间的操作方式


active agent  表明是agent主动向server发送数据


关于配置模板不做保留，可以如下指令自己做配置 
	zabbix_get -s 监控的主机   -k  mysql.status["Uptime"]

没有使用indetpent item  解析比较麻烦




