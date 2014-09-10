��    �      �      �      �  -   �  Y   +	  �  �	  3     �  J  Q        n  �  �  0   "  �  S  �   �  Z   x  "   �  �   �  5   �  '   �     �  A     1   V  s  �  �   �  :  �     �       o   &  b   �  =   �     7     <  n   @  B   �  �   �  3  �     �  '   �  ?     s   T  $   �  �   �  ?  �     �   U   �      O!     m!     u!  #   �!  �   �!     �"     �"     �"     �"     �"  K   �"  �   :#  3  �#  
   %     %  m   (%  L   �%  e   �%  O   I&  .   �&    �&     �'     �'     �'  I   �'  r   ;(     �(  6   �(  j   )  %   o)  -   �)  
   �)  $   �)  �   �)     �*     �*     �*     �*     +     !+     6+     D+  *   a+  i   �+  D   �+  =   ;,  �   y,  /   >-  
   n-  
   y-  �   �-     1.     K.  +  f.  �   �/     e0  \   |0  �  �0  C   c2  &   �2    �2  %   �3  �   �3  -   �4  r   �4  &   ?5  �   f5  7   56  l   m6  i  �6  h   D8  �  �8  S   P:  �   �:  J   N;     �;    �;     �=  8   �=     &>  -   />     ]>     d>     �>     �>  �  �>     A  �   'A  �  �A  /   fC  $   �C  1   �C  	   �C     �C  $   D  `   7D  ^   �D  q   �D     iE  �  zE  &   OG  P   vG  �  �G  ,   KJ  �  xJ  H   L     KL  w  aL  1   �M  �  N  �   �O  E   mP     �P  �   �P  !   XQ     zQ     �Q  5   �Q     �Q  ,  �Q  �   &S  �   �S     �T     �T  T   �T  M   5U  0   �U     �U     �U  d   �U  3   "V  �   VV  
  �V     �W      	X  /   *X  l   ZX     �X  �   �X  �  qY  	   6[  9   @[     z[     �[     �[  "   �[  �   �[     l\     |\     �\     �\     �\  H   �\  �   �\  �   �]  
   v^     �^  i   �^  9   �^  ^   4_  C   �_  *   �_    `     a     a     a  N   a  f   na     �a  1   �a  _    b  $   �b  *   �b  	   �b  *   �b  �   c     �c     �c     �c     �c     d     d  	   d     %d  !   ;d  \   ]d  :   �d  0   �d  �   &e  $   �e  
   f  
   f  �   !f     �f     �f    �f  �   �g     �h  F   �h  T  i  >   Vj     �j  �   �j     tk  j   �k     �k  \   l     pl  �   �l  -   ;m  S   im  �   �m  Y   �n  E  �n  >   :p  �   yp  8   q     Lq  �  bq     �r  -   s     3s  $   @s     es     ls     �s     �s    �s     �u  �   �u  `  lv  1   �w     �w     x  	   2x     <x     [x  `   zx  ^   �x  s   :y     �y   32-bit for enhanced performance on Xen/VMWare A CloudStack administrator has 2 ways to secure the console proxy communication with SSL: Additionally, using multiple versions of VRs in a single instance is supported. In the Details tab of a VR, you can view the version and whether it requires upgrade. During the Management Server upgrade, CloudStack checks whether VR is at the latest version before performing any operation on the VR. To support this, a new global parameter, *``router.version.check``*, has been added. This parameter is set to true by default, which implies minimum required version is checked before performing any operation. No operation is performed if the VR is not at the required version. Services of the older version VR continue to be available, but no further operations can be performed on the VR until it is upgraded to the latest version. This will be a transient state until the VR is upgraded. This will ensure that the availability of VR services and VR state is not impacted due to the Management Server upgrade. All the VRs are listed in the Virtual Routers page. An alternative to using dynamic DNS or creating a range of DNS entries as described in the last section would be to create a SSL certificate for a specific domain name, configure CloudStack to use that particular FQDN, and then configure a load balancer to load balance the console proxy's IP address behind the FQDN. As the functionality for this is still new, please see https://cwiki.apache.org/confluence/display/CLOUDSTACK/Realhost+IP+changes for more details. Any new virtual router created in this Zone automatically picks up this template. Apache Web Server Apply the network offering to the network where you want the virtual routers to use the new system service offering. If this is a new network, follow the steps in Adding an Additional Guest Network on page 66. To change the service offering for existing virtual routers, follow the steps in `“Changing the Network Offering on a Guest Network” <networking2.html#changing-the-network-offering-on-a-guest-network>`_. As an administrator, log in to the CloudStack UI Assignment of guest VM to console proxy is determined by first determining if the guest VM has a previous session associated with a console proxy. If it does, the Management Server will assign the guest VM to the target Console Proxy VM regardless of the load on the proxy VM. Failing that, the first available running Console Proxy VM that has the capacity to handle new sessions is used. Associate the system service offering with a network offering. See `“Creating a New Network Offering” <networking.html#creating-a-new-network-offering>`_. Based on the hypervisor you use, download the 64-bit template from the following location: Best Practices for Virtual Routers By default, the console viewing functionality uses plaintext HTTP. In any production environment, the console proxy connection should be encrypted via SSL at the mininum. Changing the Console Proxy SSL Certificate and Domain Changing the Default System VM Template Click OK to confirm. Click the Upgrade button to upgrade all the VRs. |vr-upgrade.png| Click the group which has the VRs to be upgraded. Clicking a console icon brings up a new window. The AJAX code downloaded into that window refers to the public IP address of a console proxy VM. There is exactly one public IP address allocated per console proxy VM. The AJAX application connects to this IP. The console proxy then proxies the connection to the VNC port for the requested VM on the Host hosting the guest. CloudStack allows you to change the default 32-bit System VM template to 64-bit one. Using the 64-bit template, upgrade the virtual router to manage larger number of connection in your network. CloudStack uses several types of system virtual machines to perform tasks in the cloud. In general CloudStack manages these system VMs and creates, starts, and stops them as needed based on scale and immediate needs. However, the administrator should be aware of them and their roles to assist in debugging issues. Configuring the Virtual Router Console Proxy Console proxies can be restarted by administrators but this will interrupt existing console sessions for users. Convert your PKCS#8 encrypted private key into the PKCS#8 format that is compliant with CloudStack Convert your private key format into PKCS#8 encrypted format. DHCP DNS Debian 6.0 ("Squeeze"), 2.6.32 kernel with the latest security patches from the Debian security APT repository Default domain name for the network serviced by the virtual router Define your custom system service offering. See `“Creating a New System Service Offering” <#creating-a-new-system-service-offering>`_. In System VM Type, choose Domain Router. Do not use the destroyRouter API when only one router is available in the network, because restartNetwork API with the cleanup=false parameter can't recreate it later. If you want to destroy and recreate the single router available in the network, use the restartNetwork API with the cleanup=true parameter. Download Location Download the latest System VM template. Download the latest System VM to all the primary storage pools. During the entire duration of the upgrade, users cannot launch new services or make changes to an existing service. Enhanced Upgrade for Virtual Routers Even when the VRs are still on older versions, existing services will continue to be available to the VMs. The Management Server cannot perform any operations on the VRs until they are upgraded. Every CloudStack zone has single System VM for template processing tasks such as downloading templates, uploading templates, and uploading ISOs. In a zone where VMware is being used, additional System VMs can be launched to process VMware-specific tasks such as taking snapshots and creating private templates. The CloudStack management server launches additional System VMs for VMware-specific tasks as the load increases. The management server monitors and weights all commands sent to these System VMs and performs dynamic load balancing and scaling-up of more System VMs. Firewall For example, if you have selected Group by zone, select the name of the desired zone. For example: KVM64bitTemplate Gateway Gateway IP address Generate a new 2048-bit private key Generate the private key and certificate signing request (CSR). When you are using openssl to generate private/public key pairs and CSRs, for the private key that you are going to paste into the CloudStack UI, be sure to convert it into PKCS#8 format. Group by account Group by cluster Group by pod Group by zone HA Proxy Has a minimal set of packages installed thereby reducing the attack surface Head to the website of your favorite trusted Certificate Authority, purchase an SSL certificate, and submit the CSR. You should receive a valid certificate in return How often CloudStack fetches network usage statistics from CloudStack virtual routers. If you want to collect traffic metering data from the virtual router, set the global configuration parameter router.stats.interval. If you are not using the virtual router to gather network usage statistics, set it to 0. Hypervisor IP range If you are using a XenServer 64-bit template, set the name in the *``router.template.xen``* global parameter. In Select View drop-down, select desired grouping based on your requirement. In addition to the hosts, CloudStack’s Secondary Storage VM mounts and writes to secondary storage. In the Update SSL Certificate screen of the CloudStack UI, paste the following: In the left navigation, choose Infrastructure. In these steps you will notice *consoleproxy.company.com* -For security best practices, we recommend creating a wildcard SSL certificate on a separate subdomain so in the event that the certificate is compromised, a malicious user cannot impersonate a company.com domain. Isolated Networks KVM LB Latest version of JRE from Sun/Oracle ensures improved security and speed Latest versions of HAProxy, iptables, IPsec, and Apache from debian repository ensures improved security and speed Load-balancing Console Proxies Log in to the CloudStack UI as the root administrator. Monitoring tool can help to start a VR service, which is crashed due to an unexpected reason. For example: Multiple System VM Support for VMware Navigate to Infrastructure > Zone > Settings. NetworkACL On Virtual Routers, click View More. Only those services with daemons are monitored. The services that are failed due to errors in the service/daemon configuration file cannot be restarted by the Monitoring tool. VPC networks are not supported. Port Forwarding Redundant VR Register the 64 bit template. Restart the Management Server. SSH Secondary Storage VM SecurityGroup Selectively upgrade the VRs: Service Monitoring Tool for Virtual Router Set the name of the 64-bit template, KVM64bitTemplate, in the *``router.template.kvm``* global parameter. Set up SSL certificate for specific FQDN and configure load-balancer Set up a SSL wild-card certificate and domain name resolution Set up dynamic name resolution or populate all possible DNS names in your public IP range into your existing DNS server with the format aaa-bbb-ccc-ddd.consoleproxy.company.com -> aaa.bbb.ccc.ddd. Shared Networks in both Advanced and Basic zone Source NAT Static NAT Submissions to secondary storage go through the Secondary Storage VM. The Secondary Storage VM can retrieve templates and ISO images from URLs using a variety of protocols. Supported Virtual Routers Supported network services The Console Proxy is a type of System Virtual Machine that has a role in presenting a console view via the web UI. It connects the user’s browser to the VNC port made available via the hypervisor for the console of the guest. Both the administrator and end user web UIs offer a console connection. The Management Server generates URLs of the form "aaa-bbb-ccc-ddd.consoleproxy.company.com" after this change is made. The new console requests will be served with the new DNS domain name, certificate, and key. The System VM Template The System VMs come from a single template. The System VM has the following characteristics: The administrator can configure SSL encryption  by selecting a domain and uploading a new SSL certificate and private key. The domain must run a DNS service that is capable of resolving queries for addresses of the form aaa-bbb-ccc-ddd.your.domain to an IPv4 IP address in the form aaa.bbb.ccc.ddd, for example, 202.8.44.1. To change the console proxy domain, SSL certificate, and private key: The administrator can log in to the secondary storage VM if needed. The certificate you've just generated. The console proxy VM will periodically report its active session count to the Management Server. The default reporting interval is five seconds. This can be changed through standard Management Server configuration with the parameter consoleproxy.loadscan.interval. The following networks are supported: The following service will be available even if the VR is not upgraded. However, no changes for any of the services can be sent to the VR, until it is upgraded: The following services are monitored in a VR: The hypervisors will have many ports assigned to VNC usage so that multiple VNC sessions can occur simultaneously. The private key you've just generated. The secondary storage VM provides a background task that takes care of a variety of secondary storage activities: downloading a new template to a Zone, copying templates between Zones, and snapshot backups. The services crashed due to defects in the source code. The services that are terminated by the OS when memory or CPU is not sufficiently available for the service. The virtual router is a type of System Virtual Machine. The virtual router is one of the most frequently used service providers in CloudStack. The end user has no direct access to the virtual router. Users can ping the virtual router and take actions that affect it (such as setting up port forwarding), but users do not have SSH access into the virtual router. There is never any traffic to the guest virtual IP, and there is no need to enable VNC within the guest. There is no mechanism for the administrator to log in to the virtual router. Virtual routers can be restarted by administrators, but this will interrupt public network access and other services for end users. A basic test in debugging networking issues is to attempt to ping the virtual router from a guest VM. Some of the characteristics of the virtual router are determined by its associated system service offering. This feature is supported on the following hypervisors: XenServer, VMware, and KVM. This stops all currently running console proxy VMs, then restarts them with the new certificate and key. Users might notice a brief interruption in console availability. Upgrade CPVM and SSVM either from the UI or by using the following script: Upgrade the Management Server. Upgrading VR is made flexible. The CloudStack administrators will be able to control the sequence of the VR upgrades. The sequencing is based on Infrastructure hierarchy, such as by Cluster, Pod, or Zone, and Administrative (Account) hierarchy, such as by Tenant or Domain. As an administrator, you can also determine when a particular customer service, such as VR, is upgraded within a specified upgrade interval. Upgrade operation is enhanced to increase the upgrade speed by allowing as many upgrade operations in parallel as possible. Upgrading Virtual Routers Upgrading a Virtual Router with System Service Offerings UserData Using a SSL Certificate for the Console Proxy VPC VR VPC networks are not supported VPN VR Various services running on the CloudStack virtual routers can be monitored by using a Service Monitoring tool. The tool ensures that services are successfully running until CloudStack deliberately disables them. If a service goes down, the tool automatically restarts the service, and if that does not help bringing up the service, an alert as well as an event is generated indicating the failure. A new global parameter, ``network.router.enableservicemonitoring``, has been introduced to control this feature. The default value is false, implies, monitoring is disabled. When you enable, ensure that the Management Server and the router are restarted. Virtual Router WARNING: Restarting a virtual router from a hypervisor console deletes all the iptables rules. To work around this issue, stop the virtual router and start it from the CloudStack UI. When CloudStack creates a virtual router, it uses default settings which are defined in a default system service offering. See `“System Service Offerings” <#system-service-offerings>`_. All the virtual routers in a single guest network use the same system service offering. You can upgrade the capabilities of the virtual router by creating and applying a custom system service offering. While registering the template, select Routing. Working with System Virtual Machines Xen tools inclusion allows performance monitoring XenServer You can set the following: You can use either of the following: http://download.cloud.com/templates/4.2/64bit/systemvmtemplate64-2013-07-15-master-kvm.qcow2.bz2 http://download.cloud.com/templates/4.2/64bit/systemvmtemplate64-2013-07-15-master-xen.vhd.bz2 pvops kernel with Xen PV drivers, KVM virtio drivers, and VMware tools for optimum performance on all hypervisors |update-ssl.png| Project-Id-Version: Apache CloudStack Administration RTD
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-06-30 12:52+0200
PO-Revision-Date: 2014-06-30 12:04+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: Chinese (China) (http://www.transifex.com/projects/p/apache-cloudstack-administration-rtd/language/zh_CN/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: zh_CN
Plural-Forms: nplurals=1; plural=0;
 基于 Xen/VMWare 的32位增强性能 CloudStack管理员有2种方式来保证SSL加密控制代理连接的安全： 另外，使用多版本的VR在一个单例上也是支持的。对于具体地VR，你可以预览版本和是否升级。在管理服务器升级时，CLoudStack检查VR是否是VR上操作的最新版本。为支持此特点，一个新的全局参数，*``router.version.check``*, 已经被加入.这个参数默认设置为true,它意味着当操作前，最少要求版本检查。如果不是VR要求的版本就没有任何操作。在旧的版本上的VR仍然是有效地，但必须升级后才能进行更多的操作。在升级之前，它将是临时状态。这将保证VR服务和状态不受管理服务器升级的影响。 所有的VR都在虚拟路由页中列出。 一个在最近的段落中使用动态DNS或者创建一定范围DNS记录作为可替换的描述将被用来创建一个特定域名的SSL证书，配置CloudStack使用特定的FQDN,然后配置一个负载均衡以均衡终端代理IP地址后的FQDN。作为这项新功能的更多详情，参见              http://cwiki.apache.org/confluence/display/CLOUDSTACK/Realhost+IP+changes。 任何在此地域中创建的新虚拟路由器均使用这个模板。 Apache网络服务器 将网络服务方案应用到使用新系统计算服务方案的虚拟路由器的网络上。如果这是一个新的网络，请根据66页的添加额外客户网络的步骤操作。想要改变已生成的虚拟路由器的计算服务方案，请根据 `“在客户端网络改变网络方案” <networking2.html#changing-the-network-offering-on-a-guest-network>`_. 使用管理员登录到CloudStack管理界面。 如果来宾虚拟机之前有已经分配的关联控制台代理的会话，控制台代理的分配会由第一次分配的控制台代理决定。如果该来宾虚拟机之前存在已分配的控制台代理，则不论该控制台代理目前负载如何管理服务器都会将该来宾虚拟机分配到目标控制台代理虚拟机。如果失败则会将来宾虚拟机分配到第一个拥有足够资源处理新会话的控制台代理上。 使用网络服务方案配合系统计算服务方案，参见  `“创建一个新网络方案” <networking.html#creating-a-new-network-offering>`_. 基于你所使用的hypervisor，从以下地址下载64位模板： 虚拟路由器的最佳实践 默认情况下，代理视图功能使用HTTP协议，在任何生产环境下，代理服务连接至少要通过SSL进行加密。 更改控制代理SSL证书及域 改变默认系统VM模板 点击确定。 单击升级按钮升级所有的VRs.|vr-upgrade.png| 单击已经被升级的VR组 点击控制台图标会弹出一个新窗口。根据控制台代理的公共IP ，AJAX代码会下载到这个新窗口。每个控制台代理都会分配一个公共IP。AJAX程序会连接到这个IP。控制台代理会将连接代理到正在运行所请求虚拟机的宿主机的vnc端口。 CloudStack允许你将默认的32位系统模板变为64位，使用64位模板，可以升级虚拟路由器，使得网络支撑更大的连接数。 CloudStack使用几类系统虚拟机来完成云中的任务。总的来说，CloudStack管理这些系统虚拟机，并根据某些范围内或快速需要创建、启动和停止它们。然而，管理员需要意识到他们在调试中的作用。 配置虚拟路由 控制台代理 管理员能重启控制台代理，但此操作会中断用户与控制台会话。 转化你的PKC#8加密的私钥到PKC#8格式是CloudStack遵循的方式。 转化你的私钥格式成PKCS#8加密格式。 DHCP DNS Debian 6.0(“Squeeze”)，2.6.32内核具有最新的来自Debian安全APT存储库的安全补丁 由虚拟路由为网络服务提供的默认域名 定义定制的系统计算服务方案，参见<xref linkend="creating-system-service-offerings" />。在系统虚拟机类型中，选择域路由器。 在网络中只有一个路由器可用时，不要使用destroyRouter API，因为restartNetwork API 带cleanup=false参数不能随后重新创建它。如果你想销毁并重新创建网络中的单一路由器，使用restartNetwork API 带cleanup=true参数。 下载地址 下载最新的系统VM模板。 下载最新的系统VM到所有主存储池。 在一个完整的持续的升级过程中，用户不能启动新服务或者改变已经存在的服务。 增强的网络路由升级 即使VR仍然是老版本，已经存在的服务会继续对VM有效。管理服务器除非升级，否则不会再VR上有任何动作。 每个CloudStack 区域都有一个单独的系统VM用于模板处理任务，如下载模板，上传模板，上传ISO。在使用VMware的区域中，有另外的系统VM用来处理VMware专有的任务，如制作快照，创建私有模板。 当VMware专有任务的负载增加时，CloudStack管理端将推出额外的系统VM。管理端监控并平衡发送到这些系统VM的命令，实行动态负载均衡并增加更多的系统VM。 防火墙 例如，你可以按域分组，选择希望的域名。 例如：KVM64bit 模板 网关 网关IP地址 产生一个新的2048位的私钥 通常有私钥和证书签名请求(CSR)。当你使用openssl产生私钥/公钥对和CSR,你将私钥复制到CloudStack中，保证转换为PKCS#8格式。 按账户分组 按群集分组 按提供点分组 按域分组 HA代理 具有一系列最小化安装的包，可以降低安全攻击风险。 前往你喜爱的站点相信授权证书，购买一个SSL证书并获得CSR确认。你将会收到一个返回的有效地证书 CloudStack多久从虚拟路由器获取一次网络使用数据。如果你想搜集虚拟路由器的流量计量数据，设置全局变量router.stats.interval。如果你不使用虚拟路由器收集网络使用数据，设置该值为0 Hypervisor IP地址范围 如果你正在使用XenServer64位模板，将名字设置在*``router.template.xen``*全局参数中。 在选择视图的下拉列表中，选择所需的群组 除了主机，CloudStack的二级存储虚拟机会挂载和往二级存储中写入内容。 在CloudStack用户界面的修改SSL证书，复制以下内容： 在左边的导航，选择基础架构。 在上述步骤中你会注意到*consoleproxy.company.com* -为安全最好的实践，我们推荐在独立的子域中创建一个新的有通配符的SSL证书，所以证书在事件中可能妥协，一个恶意的用户不能模仿一个company.com域。 独立的网络 KVM LB 从 Sun/Oracle 安装最新版本的JRE可以保证安全性与速度的提高 最新版本的HAProxy,iptables，IPsec和来自debian库的Apache保证了提高安全性和速度。 负载均衡终端代理 用系统管理员登陆到CloudStack UI界面。 监视工具可以帮助启动一个由不期望的原因导致的冲突的VR服务。例如： 支持VMware的多种系统虚拟机 导航至 基础结构  > 地域  > 设置 网络ACL 在虚拟路由上，单击更多视图。 只有这些服务的守护进程仍被监视。这些服务因在服务器/守护进程配置文件中的错误而失败将导致不能被监视工具重启。VPC网络不予支持。 端口转发 多余的VR 注册64位的模板。 重启管理服务器。 SSH 辅助存储VM 安全组 选择性的升级VR: 虚拟路由的服务监视工具 在全局参数 *``router.template.kvm``*中设置64位模板的名称，KVM64bitTemplate。 为指定的FQDN建立一个SSL证书并配置负载均衡 建立一个SSL通配证书以及域名解析。 建立一个动态的方案或者适用于所有可能DNS名称在你的公共IP范围以format aaa-bbb-ccc-ddd.consoleproxy.company.com-> aaa.bbb.ccc.ddd.到你已经存在的DNS服务器上 在高级和基础域中分享网络 Source NAT 静态 NAT 通过二级存储虚拟机来提交信息到二级存储。二级存储虚拟机会使用多种协议通过URL来获取模版和ISO镜像文件。 支持虚拟路由 支持的网络服务 控制台代理是一种系统VM，可以通过网页用户接口为用户呈现一个控制台视图。它通过hypervisor为来宾提供控制台将用户的浏览器与vnc端口相连。管理员和终端用户动能通过网页用户接口获得一个控制台连接。 管理服务器在这个改变后生成格式如 "aaa-bbb-ccc-ddd.consoleproxy.company.com" 的URLs。这个新的终端请求将会依照新的DNS域名，证书和密钥提供服务。 系统VM模板 系统VM来自于一个单独的模板，系统VM具有以下特性： 管理员可以通过选择一个域并上传一个新的SSL证书和密钥配置SSL加密。这个域必须运行一个能DNS服务器，该服务器能解决地址格式是aaa-bbb-ccc-ddd.your.domain到IPv4 IP地址的结构aaa.bbb.ccc.ddd，例如 for example, 202.8.44.1。就是为了改变终端代理与，SSL证书和私有密钥。 如果有需要，管理员可以登录到辅助存储VM上。 刚刚生成的证书。 控制台虚拟机会定时的向管理服务器汇报当前活动的会话数。默认报告间隔是五秒钟。可以通过管理服务器的配置参数 consoleproxy.loadscan.interval.更改。 支持以下网络： 以下服务将是有效的，无论VR是否升级。或者，没有任何服务在VR升级后发送到VR. 在VR中监视下列服务： hypervisors可能会分配很多端口到VNC上，因此可能同时并发多个VNC会话。 刚刚生成的私钥。 二级存储虚拟机会提供后台任务来负责各种二级存储的活动：将新模版的下载到资源域中，多个资源域之间的模版复制，和快照备份。 由原代码的缺点引起的服务冲突。 当此服务的内存空间或者CPU运算出现不足时，OS将终止此服务。 虚拟路由器是一个系统虚拟机。它经常在CloudStack服务方案中被使用；终端用户不能够直接访问虚拟路由器。用户可ping和影响它(比如设置端口转发)但是不能通过ssh访问 不会有任何流量是来宾虚拟IP的，因此不需要打开来宾虚拟机的vnc。 这里没有一种机制使得管理员可以登录虚拟路由器。管理员可以重启虚拟路由器，但是会中断终端用户网络访问和服务。在一个基本的网络故障排错中，尝试在一个虚拟机上ping虚拟路由器。虚拟路由器的一些功能特性是通过系统服务方案配置的。 在下列hypervisor上支持此特性：XenServer,VMware和KVM 这停止了所有正运行的终端代理VM,然后已新的许可和密钥重启。用户可能会注意到对控制台有益的一个简短的打断。 从用户界面和使用下列描述中升级CPVM和SSVM 升级管理服务器 升级VR也是很灵活的。CloudStack管理员将能够控制VR升级序列。该序列基于Infrastructure层，例如Cluster,pod或者Zone,管理层 (账户)，例如Tenan或者Domain.作为管理员，当一个特殊的用户服务,例如VR,在一个短暂的具体升级后的间隔后，你可以终止它。升级操作将允许多个升级操作并行操作促使升级速度增加。 升级中的虚拟路由 使用系统计算服务升级虚拟路由器 用户数据 对控制台代理使用SSL证书。 VPC VR VPC网络不被支持 VPN VR 运行在CloudStack虚拟路由上的不同的各种服务都可以使用服务监视工具监视。工具将确保服务成功运行除非CloudStack被故意损坏。如果一个服务停止，工具将自动重启该服务，如果不能帮助重启该服务，将产生一个导致失败的警报事件。一个全局参数，"network.router.enableservicemonitoring",已经被介绍了它能控制这种特性。默认值是false,也就是说监控不是默认。当你激活后，确保服务管理器和路由被重启。 虚拟路由 警告：从一个虚拟机管理程序控制台重新启动一台虚拟路由器，将删除所有iptables规则。要解决这个问题，从CloudStack用户界面停止虚拟路由器和启动。 当 CloudStack创建一个虚拟路由器，它是按照默认的系统计算服务方案进行的设置。参见 <xref linkend="system-service-offerings" />。所有在单独客户网络中的虚拟路由器都使用相同的系统计算服务方案。可以通过新建和使用自定义的系统计算服务方案来提高虚拟路由器的性能。 当注册模板时，选择路由（routing）。 使用系统虚拟机 Xen tools 包含性能监控 XenServer 你可以设置以下内容： 你可以设置以下内容： http://download.cloud.com/templates/4.2/64bit/systemvmtemplate64-2013-07-15-master-kvm.qcow2.bz2 http://download.cloud.com/templates/4.2/64bit/systemvmtemplate64-2013-07-15-master-xen.vhd.bz2 包含Xen PV 驱动，KVM virtio 驱动和VMware tools的pvops 内核可以使所有hypervisor得到最佳性能。 |update-ssl.png| 