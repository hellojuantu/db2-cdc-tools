echo "Begin to download cdc tools ..."

wget -O cdc_tools.tar.gz 'https://gitee.com/sanbuqu/db2-cdc-tools/raw/master/cdc_tool.tar.gz' --no-check-certificate

echo "Download Success !!!"
echo ""

tar -xzvf cdc_tools.tar.gz -C $HOME

rm cdc_tools.tar.gz
