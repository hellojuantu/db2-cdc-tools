# db2-cdc-tools
- 通过以下脚本，可以一键初始化 Db2 ASN Capture 程序。

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/hellojuantu/db2-cdc-tools/master/script/install.sh)"
```
- 运行脚本，<db_name> 需要替换为数据库名 。
```
bash ./cdc_tools/cdc_setup.sh <db_name>
```
