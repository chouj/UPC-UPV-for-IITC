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

A txt file contains the coordinates will be generated in the same folder where ```game_log.tsv``` is stored. Copy/Paste its content into your IITC draw tool for visualization. Note: purple marker stands for the portal you've ever captured while red one stands for the portal you've ever visited but have not captured yet.

![UPCpurple_UPVred_Instance](https://github.com/chouj/UPC-UPV-for-IITC/blob/master/ProcedureImages/UPCpurple_UPVred_Instance.png)

Have fun.
