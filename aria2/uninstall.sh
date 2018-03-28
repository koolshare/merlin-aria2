#! /bin/sh

sh /koolshare/aria2/aria2_run.sh stop

rm -rf /koolshare/aria2
rm -rf /koolshare/scripts/aria2*
rm -rf /koolshare/webs/Module_aria2.asp
rm -rf /koolshare/www
rm -rf /koolshare/pere/aria2
rm -rf /koolshare/uninstall_aria2.sh

for r in `dbus list aria2|cut -d"=" -f 1`
do
	dbus remove $r
done