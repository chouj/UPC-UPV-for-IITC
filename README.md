# UPC/UPV for IITC
###### An Windows command line tool for generating coordinate information of UPC / UPV for IITC according to your private Ingress GDPR data.

## Compatibility
#### MATLAB Release Compatibility
Created with R2015a

#### Platform Compatibility
Windows 64 bit

## File Specification
```UPCUPVforIITC.m``` open-source MATLAB script. Packaged execution file is based on this script.

```UPCUPVforIITC.exe``` One can try execute this if MATLAB or [MATLAB Runtime](https://ww2.mathworks.cn/products/compiler/matlab-runtime.html) has been installed already. However, it would fail if the version of MATLAB or MATLAB Runtime is not appropriate.

```UPCUPVforIITC_APPInstaller_web.exe``` Application installer. The [MATLAB Runtime](https://ww2.mathworks.cn/products/compiler/matlab-runtime.html) will be installed alongside. "_The MATLAB Runtime is a standalone set of shared libraries that enables the execution of compiled MATLAB applications or components on computers that do **not** have MATLAB installed._"

## Description

![Command Line Tool User Interface](https://github.com/chouj/UPC-UPV-for-IITC/blob/master/ProcedureImages/CommandLineToolUserInterface.png)

After execute the application, first one needs to input the path of folder where ```game_log.tsv``` (Please open a repository issue to report, if yours is not named ```game_log.tsv``` but something similar, like ```Game_log_public.csv```.) is stored. Then, there will be two menus in the console (Windows command shell) for you to choose what you want to obtain. One for UPC or UPV, the other for global or regional.

A txt file contains the coordinates will be generated in the same folder where ```game_log.tsv``` is stored. Copy/Paste its content into your IITC draw tool for visualization. Note: purple pin stands for the portal you've ever captured while red one stands for the portal you've ever visited but have not captured yet.

![UPCpurple_UPVred_Instance](https://github.com/chouj/UPC-UPV-for-IITC/blob/master/ProcedureImages/UPCpurple_UPVred_Instance.png)

Have fun.

## Inspired by
[IngressDataDumpExplorer](https://github.com/Maxr1998/IngressDataDumpExplorer)

[GDPR 数据分析 | 猩猩究竟保存了你什么数据？](https://bjres.net/2018/09/17/gdpr-%e6%95%b0%e6%8d%ae%e5%88%86%e6%9e%90-%e7%8c%a9%e7%8c%a9%e7%a9%b6%e7%ab%9f%e4%bf%9d%e5%ad%98%e4%ba%86%e4%bd%a0%e4%bb%80%e4%b9%88%e6%95%b0%e6%8d%ae%ef%bc%9f/)

[XMlinkup:如何利用Ingress数据创建UPV地图](https://mp.weixin.qq.com/s/PIG8ck3ycqyRBQOQHSRDgQ)

## For MATLAB Users

Modify and run [ScriptForMatlabUser.m](https://github.com/chouj/UPC-UPV-for-IITC/blob/master/ScriptForMatlabUser.m) to generate map like this:

![Tianhe_Instance](https://github.com/chouj/UPC-UPV-for-IITC/blob/master/ProcedureImages/Tianhe_Instance.png)

#### Denpendencies:

[plot_google_map](https://www.mathworks.com/matlabcentral/fileexchange/27627-zoharby-plot_google_map) / [mars2wgs](https://www.mathworks.com/matlabcentral/fileexchange/65234-adclose-mars2wgs) / [export_fig](https://www.mathworks.com/matlabcentral/fileexchange/23629-export_fig)


[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/Mesoscale)
[![Donate](https://img.shields.io/badge/Donate-WeChat-brightgreen.svg)](https://github.com/chouj/donate-page/blob/master/simple/images/WeChatQR.jpg?raw=true)
[![Donate](https://img.shields.io/badge/Donate-AliPay-blue.svg)](https://github.com/chouj/donate-page/blob/master/simple/images/AlipayQR.jpg?raw=true)
