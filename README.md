# 该仓库利用docker部署cacti
# 使用说明
首先，拉取仓库，执行脚本   
bash yum.sh && bash ntp.sh && bash env.sh  
构建镜像nginx:cacti、php:cacti、mysql:cacti .   
docker build -t nginx:cacti -f Dockerfile_nginx .  
docker build -t php:cacti -f Dockerfile_phpsp .      
docker build -t mysql:cacti -f Dockerfile .      
然后，执行脚本bash container/start     \
最后,登录cacti，在settings里面的PATH栏设置好各个路径，并在General里设置好rrdtool的版本，本仓库选择1.7.x   
到此完成了cacti的部署

![效果图](https://github.com/linuxwt/cacti_docker/blob/master/jiemian.jpg)

# 特别注意
1、构建mysql镜像的时候脚本start.sh里面的初始化过程一定要正常，sleep时间尽量设置长一点   
2、通过同一个docker-compose.yml文件编排的应用里面映射了同一个目录/usr/local/Nginx/html/cacti，该目录最初是放在nginx的镜像中的    
3、mysql的密码已经设置成linuxwt123了   
4、脚本中会依据网卡名字来获取服务器ip，这里的网卡名字为ens33，根据自身服务器网卡名去ntp.sh里修改    
5、被监控机器需要与cacti服务器时间同步   
6、如果想要监控某一个主机，需要配置snmp，可以执行脚本bash client_snmp.sh来推送相关脚本到远程的主机上进行配置   

