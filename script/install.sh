echo "Begin to download cdc tools ..."

curl 'https://gitee.com/clougence/db2-cdc-tools/raw/master/cdc_tools.tar.gz' --output cdc_tools.tar.gz

if [ ! -f "./cdc_tools.tar.gz" ];then
    echo "Download Fail !!!"
  else
    echo "Download Success !!!"
    tar -xzvf cdc_tools.tar.gz -C $HOME
fi