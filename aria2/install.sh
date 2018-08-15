#! /bin/sh
cd /tmp
cp -rf /tmp/aria2/aria2 /koolshare/
cp -rf /tmp/aria2/res/* /koolshare/res/
cp -rf /tmp/aria2/scripts/* /koolshare/scripts/
cp -rf /tmp/aria2/webs/* /koolshare/webs/
cp -rf /tmp/aria2/perp/aria2 /koolshare/perp/
cp -rf /tmp/aria2/uninstall.sh /koolshare/scripts/uninstall_aria2.sh
rm -rf /tmp/aria2* >/dev/null 2>&1

if [ ! -f /koolshare/aria2/aria2.session ];then
	touch /koolshare/aria2/aria2.session
fi

chmod 755 /koolshare/aria2/*
chmod 755 /koolshare/init.d/*
chmod 755 /koolshare/scripts/aria2*
chmod 755 /koolshare/perp/aria2/*

check_ddnsto_en=`dbus get ddnsto_enable`
if [ "${check_ddnsto_en}"x = "1"x ]; then
  dbus set aria2_ddnsto=true
fi
/koolshare/scripts/aria2_config.sh
