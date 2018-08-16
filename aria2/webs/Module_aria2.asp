<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta HTTP-EQUIV="Pragma" CONTENT="no-cache" />
    <meta HTTP-EQUIV="Expires" CONTENT="-1" />
    <link rel="shortcut icon" href="images/favicon.png" />
    <link rel="icon" href="images/favicon.png" />
    <title>软件中心-Aria2</title>
    <link rel="stylesheet" type="text/css" href="index_style.css" />
    <link rel="stylesheet" type="text/css" href="form_style.css" />
    <link rel="stylesheet" type="text/css" href="usp_style.css" />
    <link rel="stylesheet" type="text/css" href="ParentalControl.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <link rel="stylesheet" type="text/css" href="css/element.css">
    <script type="text/javascript" src="/state.js"></script>
    <script type="text/javascript" src="/popup.js"></script>
    <script type="text/javascript" src="/help.js"></script>
    <script type="text/javascript" src="/validator.js"></script>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/general.js"></script>
    <script type="text/javascript" src="/disk_functions.js"></script>
    <script language="JavaScript" type="text/javascript" src="/client_function.js"></script>
    <script type="text/javascript" src="/switcherplugin/jquery.iphone-switch.js"></script>
    <script type="text/javascript" src="/dbconf?p=aria2_&v=<% uptime(); %>"></script>
    <style type="text/css">.mask_bg{position:absolute;margin:auto;top:0;left:0;width:100%;height:100%;z-index:100;background:url(images/popup_bg2.gif);background-repeat:repeat;filter:alpha(opacity=60);-moz-opacity:.6;display:none;overflow:hidden}.mask_floder_bg{position:absolute;margin:auto;top:0;left:0;width:100%;height:100%;z-index:300;background:url(images/popup_bg2.gif);background-repeat:repeat;filter:alpha(opacity=60);-moz-opacity:.6;display:none;overflow:hidden}.folderClicked{color:#569ac7;font-size:14px;cursor:text}.lastfolderClicked{color:#fff;cursor:pointer}.show-btn1,.show-btn2,.show-btn3,.show-btn4{border:1px solid #222;background:#576d73;font-size:10pt;color:#fff;padding:10px 3.75px;border-radius:5px 5px 0 0;width:8.45601%}.aria2_btn{border:1px solid #222;background:linear-gradient(to bottom,#033 0,#000 100%);font-size:10pt;color:#fff;padding:5px 5px;border-radius:5px 5px 5px 5px;width:16%}.aria2_btn:hover{border:1px solid #222;background:linear-gradient(to bottom,#27c9c9 0,#279fd9 100%);font-size:10pt;color:#fff;padding:5px 5px;border-radius:5px 5px 5px 5px;width:16%}.aria2_btn:disabled{border: 1px solid #DDD;background:linear-gradient(to bottom,#2F3A3E 0,#2F3A3E 100%);background-color: #F5F5F5;color:#ACA899;}.active{background:#2f3a3e}input[type=button]:focus{outline:0}</style>
    <script>
jQuery.ajax = (function(_ajax) {
  var protocol = location.protocol,
    hostname = location.hostname,
    exRegex = RegExp(protocol + '//' + hostname),
    YQL = 'http' + (/^https/.test(protocol) ? 's' : '') + '://query.yahooapis.com/v1/public/yql?callback=?',
    query = 'select * from html where url="{URL}" and xpath="*"';

  function isExternal(url) {
    return !exRegex.test(url) && /:\/\//.test(url);
  }

  return function(o) {
    var url = o.url;

    if (/get/i.test(o.type) && !/json/i.test(o.dataType) && isExternal(url)) {

      // Manipulate options so that JSONP-x request is made to YQL

      o.url = YQL;
      o.dataType = 'json';

      o.data = {
        q: query.replace(
          '{URL}',
          url + (o.data ?
            (/\?/.test(url) ? '&' : '?') + jQuery.param(o.data) : '')
        ),
        format: 'xml'
      };

      // Since it's a JSONP request
      // complete === success
      if (!o.success && o.complete) {
        o.success = o.complete;
        delete o.complete;
      }

      o.success = (function(_success) {
        return function(data) {

          if (_success) {
            // Fake XHR callback.
            _success.call(this, {
              responseText: (data.results[0] || '')
                // YQL screws with <script>s
                // Get rid of them
                .replace(/<script[^>]+?\/>|<script(.|\s)*?\/script>/gi, '')
            }, 'success');
          }

        };
      })(o.success);

    }

    return _ajax.apply(this, arguments);

  };
})(jQuery.ajax);

<% get_AiDisk_status(); %>
<% disk_pool_mapping_info(); %>
var PROTOCOL = "cifs";
var _layer_order = "";
var FromObject = "0";
var lastClickedObj = 0;
var disk_flag = 0;
var _responseLen;
window.onresize = cal_panel_block;
var nfsd_enable = '<% nvram_get("nfsd_enable"); %>';
var nfsd_exportlist_array = '<% nvram_get("nfsd_exportlist"); %>';
window.onresize = cal_panel_block;
String.prototype.replaceAll = function(s1, s2) {　　
  return this.replace(new RegExp(s1, "gm"), s2);
}
var $G = function(id) {
  return document.getElementById(id);
};

function init() {
  show_menu(menu_hook);
  get_status();
  buildswitch();
  conf2obj();
  toggle_func();
  update_visibility();
  version_check();
  initial_dir();
  check_dir_path();
  check_ddnsto();
  line_show();
  generate_ariang_link();
  generate_glutton_link();
}

function menu_hook(title, tab) {
  tabtitle[tabtitle.length -1] = new Array("", "aria2");
  tablink[tablink.length -1] = new Array("", "Module_aria2.asp");
}

function done_validating() {
  return true;
}

function check_ddnsto() {
  if ('<% dbus_get_def("ddnsto_enable", "0"); %>' == "1") {
    $G("aria2_ddnsto").disabled=false;
    $G("ddnsto_status").innerHTML = "启用DDNSTO远程连接(自动设置配置Token及控制台)";
  }else{
    $G("aria2_ddnsto").disabled=true;
    $G("aria2_ddnsto").checked = false;
    $G("f_aria2_ddnsto").value = "false";
    $G("ddnsto_status").innerHTML = "<font color=#ffffff>如需远程连接Aria，请正确设置DDNSTO插件并启用！</font>";
    if (validForm()) {
      document.aria2_form.submit();
    }
  }
  if ($G("aria2_ddnsto").checked){
    $G("aria2_rpc_secret").readOnly=true;
    $G("random_btn1").disabled=true;
  }else{
    $G("aria2_rpc_secret").readOnly=false;
    $G("random_btn1").disabled=false;
  }
}

function buildswitch() {
  $("#switch").click(
    function() {
    if (document.getElementById('switch').checked) {
      document.aria2_form.aria2_enable.value = 1;
      document.getElementById('webui').style.display = "";
      document.getElementById('ariang').style.display = "";
      document.getElementById('glutton').style.display = "";
      document.getElementById('aria2_base_table').style.display = "";
      document.getElementById('aria2_rpc_table').style.display = "none";
      document.getElementById('aria2_limit_table').style.display = "none";
      document.getElementById('aria2_bt_table').style.display = "none";
      document.getElementById('aria2_install_table').style.display = "";
      document.getElementById('cmdBtn1').style.display = "";
      document.getElementById('tablet_show').style.display = "";
      $('.show-btn1').addClass('active');
      $('.show-btn2').removeClass('active');
      $('.show-btn3').removeClass('active');
      $('.show-btn4').removeClass('active');
    } else {
      document.aria2_form.aria2_enable.value = 0;
      document.getElementById('webui').style.display = "none";
      document.getElementById('ariang').style.display = "none";
      document.getElementById('glutton').style.display = "none";
      document.getElementById('aria2_base_table').style.display = "none";
      document.getElementById('aria2_rpc_table').style.display = "none";
      document.getElementById('aria2_limit_table').style.display = "none";
      document.getElementById('aria2_bt_table').style.display = "none";
      document.getElementById('cmdBtn1').style.display = "none";
      document.getElementById('tablet_show').style.display = "none";
      document.getElementById('aria2_install_table').style.display = "none";
    }
  });
}

function update_visibility(r) {
  if (r && r.type == "checkbox")
    oncheckclick(r);
  var rrt = document.getElementById("switch");
  if (document.aria2_form.aria2_enable.value !== "1") {
    rrt.checked = false;
    document.getElementById('webui').style.display = "none";
    document.getElementById('ariang').style.display = "none";
    document.getElementById('glutton').style.display = "none";
    document.getElementById('aria2_base_table').style.display = "none";
    document.getElementById('aria2_rpc_table').style.display = "none";
    document.getElementById('aria2_limit_table').style.display = "none";
    document.getElementById('aria2_bt_table').style.display = "none";
    document.getElementById('cmdBtn1').style.display = "none";
    document.getElementById('tablet_show').style.display = "none";
    document.getElementById('aria2_install_table').style.display = "none";
  } else {
    rrt.checked = true;
    document.getElementById('webui').style.display = "";
    document.getElementById('ariang').style.display = "";
    document.getElementById('glutton').style.display = "";
    if($('.show-btn1').hasClass("active")){
      document.getElementById('aria2_base_table').style.display = "";
      document.getElementById('aria2_rpc_table').style.display = "none";
      document.getElementById('aria2_limit_table').style.display = "none";
      document.getElementById('aria2_bt_table').style.display = "none";
    }else if($('.show-btn2').hasClass("active")){
      document.getElementById('aria2_base_table').style.display = "none";
      document.getElementById('aria2_rpc_table').style.display = "";
      document.getElementById('aria2_limit_table').style.display = "none";
      document.getElementById('aria2_bt_table').style.display = "none";
    }else if($('.show-btn3').hasClass("active")){
      document.getElementById('aria2_base_table').style.display = "none";
      document.getElementById('aria2_rpc_table').style.display = "none";
      document.getElementById('aria2_limit_table').style.display = "";
      document.getElementById('aria2_bt_table').style.display = "none";
    }else if($('.show-btn4').hasClass("active")){
      document.getElementById('aria2_base_table').style.display = "none";
      document.getElementById('aria2_rpc_table').style.display = "none";
      document.getElementById('aria2_limit_table').style.display = "none";
      document.getElementById('aria2_bt_table').style.display = "";
    }
    document.getElementById('aria2_install_table').style.display = "";
    document.getElementById('cmdBtn1').style.display = "";
  }
  showhide("aria2_rpc_listen_port_tr", (document.aria2_form.f_aria2_enable_rpc.value !== "false"));
  showhide("aria2_rpc_allow_origin_all_tr", (document.aria2_form.f_aria2_enable_rpc.value !== "false"));
  showhide("aria2_rpc_listen_all_tr", (document.aria2_form.f_aria2_enable_rpc.value !== "false"));
  showhide("aria2_disable_ipv6_tr", (document.aria2_form.f_aria2_enable_rpc.value !== "false"));
  showhide("aria2_event_poll_tr", (document.aria2_form.f_aria2_enable_rpc.value !== "false"));
  showhide("aria2_rpc_secret_tr", (document.aria2_form.f_aria2_enable_rpc.value !== "false"));
  showhide("aria2_save_session_tr", (document.aria2_form.f_aria2_force_save.value !== "false"));
  showhide("aria2_save_session_interval_tr", (document.aria2_form.f_aria2_force_save.value !== "false"));
  showhide("aria2_dht_listen_port_tr", (document.aria2_form.f_aria2_enable_dht.value !== "false"));
  showhide("aria2_cpulimit_value", (document.aria2_form.f_aria2_cpulimit_enable.value !== "false"));
}

function onSubmitCtrl(o, s) {
  alert_custom();
  if (validForm()) {
    document.aria2_form.action_mode.value = s;
    showLoading(5);
    document.aria2_form.submit();
  }
}
function done_validating(action) { //提交操作5秒后刷洗网页
    refreshpage(5);
}
function conf2obj() {
  var params1 = ["aria2_cpulimit_value", "aria2_bt_tracker", "aria2_bt_max_peers", "aria2_custom", "aria2_dht_listen_port", "aria2_dir", "aria2_disk_cache", "aria2_enable", "aria2_event_poll", "aria2_file_allocation", "aria2_force_save", "aria2_install_status", "aria2_listen_port", "aria2_lowest_speed_limit", "aria2_max_concurrent_downloads", "aria2_max_connection_per_server", "aria2_max_download_limit", "aria2_max_overall_download_limit", "aria2_max_overall_upload_limit", "aria2_max_tries", "aria2_max_upload_limit", "aria2_min_split_size", "aria2_peer_id_prefix", "aria2_referer", "aria2_retry_wait", "aria2_rpc_listen_port", "aria2_rpc_secret", "aria2_save_session_interval", "aria2_seed_ratio", "aria2_sleep", "aria2_split", "aria2_user_agent"];
  for (var i = 0; i < params1.length; i++) {
    if (typeof db_aria2_[params1[i]] !== "undefined") {
      $("#" + params1[i]).val(db_aria2_[params1[i]]);
    }
  }
  var params2 = ["aria2_ddnsto", "aria2_cpulimit_enable", "aria2_disable_ipv6", "aria2_continue", "aria2_enable_mmap", "aria2_enable_rpc", "aria2_rpc_allow_origin_all", "aria2_rpc_listen_all", "aria2_bt_enable_lpd", "aria2_enable_dht", "aria2_bt_require_crypto", "aria2_follow_torrent", "aria2_enable_peer_exchange", "aria2_force_save", "aria2_bt_hash_check_seed", "aria2_bt_seed_unverified", "aria2_bt_save_metadata"];
  for (var i = 0; i < params2.length; i++) {
    if (typeof db_aria2_[params2[i]] !== "undefined") {
      $("#f_" + params2[i]).val(db_aria2_[params2[i]]);
      if (db_aria2_[params2[i]] != "true") {
        document.getElementById(params2[i]).checked = false;
        document.getElementById("f_" + params2[i]).value = "false";
      } else {
        document.getElementById(params2[i]).checked = true;
        document.getElementById("f_" + params2[i]).value = "true";
      }
    } else {
      if (document.getElementById(params2[i]).checked) {
        document.getElementById("f_" + params2[i]).value = "true"
      } else {
        document.getElementById("f_" + params2[i]).value = "false"
      }
    }
  }
}

function load_default_value(o, s) {
  document.aria2_form.aria2_enable.value = 5;
  if (validForm()) {
    document.aria2_form.action_mode.value = s;
    showLoading(5);
    document.aria2_form.submit();
    update_visibility();
  }
}

function version_check() {
  $.ajax({
    url: 'https://koolshare.ngrok.wang/aria2/config.json.js',
    type: 'GET',
    dataType: 'jsonp',
    success: function(res) {
      if (typeof(res["version"]) != "undefined" && res["version"].length > 0) {
        if (res["version"] == db_aria2_["aria2_version"]) {
          $("#aria2_version_status").html("插件版本：" + res["version"]);
        } else if (res["version"] != db_aria2_["aria2_version"]) {
          $("#aria2_version_status").html("<font color=\"#66FF66\">有新版本：" + res.version + "</font>");
        }
      }
    }
  });
}

function get_status() {
  $.ajax({
    url: 'apply.cgi?current_page=Module_aria2.asp&next_page=Module_aria2.asp&group_id=&modified=0&action_mode=+Refresh+&action_script=&action_wait=&first_time=&preferred_lang=CN&SystemCmd=aria2_status.sh',
    dataType: 'html',
    error: function(xhr) {
      alert("error");
    },
    success: function(response) {
      //alert("success");
      setTimeout("check_aria2_status();", 1000);
    }
  });
}


function check_aria2_status() {
  $.ajax({
    url: '/res/aria2_check.html',
    dataType: 'html',

    error: function(xhr) {
      setTimeout("check_aria2_status();", 1000);
    },
    success: function(response) {
      var _cmdBtn = $G("cmdBtn");
      if (response.search("XU6J03M6") != -1) {
        aria2_status = response.replace("XU6J03M6", " ");
        //alert(aria2_status);
        $G("status").innerHTML = aria2_status;
        return true;
      }

      if (_responseLen == response.length) {
        noChange_status++;
      } else {
        noChange_status = 0;
      }
      if (noChange_status > 100) {
        noChange_status = 0;
        //refreshpage();
      } else {
        setTimeout("check_aria2_status();", 400);
      }
      _responseLen = response.length;
    }
  });
}

function valid_custom() {
  var s = document.getElementById('aria2_custom').value;
  var ins = ["/enable-rpc=/", "/rpc-allow-origin-all=/", "/rpc-listen-all=/"];
  for (var i = 0; i < ins.length; i++) {
    if (s.search(ins[i]) != -1) {
      alert("不能在此设置选项! 请在图形界面设置");
    }
  }
}

function alert_custom() {
  var s = document.getElementById('aria2_custom').value;
  if (s.search(/enable-rpc=/) != -1) {
    alert("不能在此设置 enable-rpc 选项! 请在图形界面设置");
  }
  if (s.search(/rpc-allow-origin-all=/) != -1) {
    alert("不能在此设置 enable-rpc 选项! 请在图形界面设置");
  }
  if (s.search(/rpc-listen-all=/) != -1) {
    alert("不能在此设置 rpc-listen-all 选项! 请在图形界面设置");
  }
  if (s.search(/rpc-listen-port=/) != -1) {
    alert("不能在此设置 rpc-listen-port 选项! 请在图形界面设置");
  }
  if (s.search(/event-poll=/) != -1) {
    alert("不能在此设置 event-poll 选项! 请在图形界面设置");
  }
  if (s.search(/rpc-user=/) != -1) {
    alert("不能在此设置 rpc-user 选项! 请在图形界面设置");
  }
  if (s.search(/rpc-passwd=/) != -1) {
    alert("不能在此设置 rpc-passwd 选项! 请在图形界面设置");
  }
  if (s.search(/max-concurrent-downloads=/) != -1) {
    alert("不能在此设置 max-concurrent-downloads 选项! 请在图形界面设置");
  }
  if (s.search(/continue=/) != -1) {
    alert("不能在此设置 continue 选项! 请在图形界面设置");
  }
  if (s.search(/max-connection-per-server=/) != -1) {
    alert("不能在此设置 max-connection-per-server 选项! 请在图形界面设置");
  }
  if (s.search(/min-split-size=/) != -1) {
    alert("不能在此设置 min-split-size 选项! 请在图形界面设置");
  }
  if (s.search(/split=/) != -1) {
    alert("不能在此设置 split 选项! 请在图形界面设置");
  }
  if (s.search(/max-overall-download-limit=/) != -1) {
    alert("不能在此设置 max-overall-download-limit 选项! 请在图形界面设置");
  }
  if (s.search(/max-download-limit=/) != -1) {
    alert("不能在此设置 max-download-limit 选项! 请在图形界面设置");
  }
  if (s.search(/max-overall-upload-limit=/) != -1) {
    alert("不能在此设置 max-overall-upload-limit 选项! 请在图形界面设置");
  }
  if (s.search(/max-upload-limit=/) != -1) {
    alert("不能在此设置 max-upload-limit 选项! 请在图形界面设置");
  }
  if (s.search(/lowest-speed-limit=/) != -1) {
    alert("不能在此设置 lowest-speed-limit 选项! 请在图形界面设置");
  }
  if (s.search(/lowest-speed-limit=/) != -1) {
    alert("不能在此设置 referer 选项! 请在图形界面设置");
  }
  if (s.search(/input-file=/) != -1) {
    alert("不能在此设置 input-file 选项! 请在图形界面设置");
  }
  if (s.search(/save-session=/) != -1) {
    alert("不能在此设置 save-session 选项! 请在图形界面设置");
  }
  if (s.search(/dir=/) != -1) {
    alert("不能在此设置 dir 选项! 请在图形界面设置");
  }
  if (s.search(/disk-cache=/) != -1) {
    alert("不能在此设置 disk-cache 选项! 请在图形界面设置");
  }
  if (s.search(/enable-mmap=/) != -1) {
    alert("不能在此设置 enable-mmap 选项! 请在图形界面设置");
  }
  if (s.search(/file-allocation=/) != -1) {
    alert("不能在此设置 file-allocation 选项! 请在图形界面设置");
  }
  if (s.search(/bt-enable-lpd=/) != -1) {
    alert("不能在此设置 bt-enable-lpd 选项! 请在图形界面设置");
  }
  if (s.search(/dir=/) != -1) {
    alert("不能在此设置 dir 选项! 请在图形界面设置");
  }
  if (s.search(/bt-tracker=/) != -1) {
    alert("不能在此设置 bt-tracker 选项! 请在图形界面设置");
  }
  if (s.search(/bt-max-peers=/) != -1) {
    alert("不能在此设置 bt-max-peers 选项! 请在图形界面设置");
  }
  if (s.search(/bt-require-crypto=/) != -1) {
    alert("不能在此设置 bt-require-crypto 选项! 请在图形界面设置");
  }
  if (s.search(/follow-torrent=/) != -1) {
    alert("不能在此设置 follow-torrent 选项! 请在图形界面设置");
  }
  if (s.search(/listen-port=/) != -1) {
    alert("不能在此设置 listen-port 选项! 请在图形界面设置");
  }
  if (s.search(/dir=/) != -1) {
    alert("不能在此设置 dir 选项! 请在图形界面设置");
  }
  if (s.search(/enable-dht=/) != -1) {
    alert("不能在此设置 enable-dht 选项! 请在图形界面设置");
  }
  if (s.search(/enable-peer-exchange=/) != -1) {
    alert("不能在此设置 enable-peer-exchange 选项! 请在图形界面设置");
  }
  if (s.search(/user-agent=/) != -1) {
    alert("不能在此设置 user-agent 选项! 请在图形界面设置");
  }
  if (s.search(/peer-id-prefix=/) != -1) {
    alert("不能在此设置 peer-id-prefix 选项! 请在图形界面设置");
  }
  if (s.search(/seed-ratio=/) != -1) {
    alert("不能在此设置 seed-ratio 选项! 请在图形界面设置");
  }
  if (s.search(/force-save=/) != -1) {
    alert("不能在此设置 force-save 选项! 请在图形界面设置");
  }
  if (s.search(/bt-hash-check-seed=/) != -1) {
    alert("不能在此设置 bt-hash-check-seed 选项! 请在图形界面设置");
  }
  if (s.search(/bt-seed-unverified=/) != -1) {
    alert("不能在此设置 bt-seed-unverified 选项! 请在图形界面设置");
  }
  if (s.search(/bt-save-metadata=/) != -1) {
    alert("不能在此设置 bt-save-metadata 选项! 请在图形界面设置");
  }
  if (s.search(/save-session-interval=/) != -1) {
    alert("不能在此设置 save-session-interval 选项! 请在图形界面设置");
  }
  if (s.search(/disable-ipv6=/) != -1) {
    alert("不能在此设置 save-session-interval 选项! 请在图形界面设置");
  }
}

function randomWord(randomFlag, min, max){
    var str = "",
        range = min,
        arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    // 随机产生
    if(randomFlag){
        range = Math.round(Math.random() * (max-min)) + min;
    }
    for(var i=0; i<range; i++){
        pos = Math.round(Math.random() * (arr.length-1));
        str += arr[pos];
    }
    return str;
}

function oncheckclick(obj) {
  if (obj.checked) {
    if (obj.id == "aria2_ddnsto"){
      $G("aria2_rpc_secret").readOnly=true;
      $G("random_btn1").disabled=true;
    }
    document.getElementById("f_" + obj.id).value = "true";
  } else {
    if (obj.id == "aria2_ddnsto"){
      $G("aria2_rpc_secret").readOnly=false;
      $G("random_btn1").disabled=false;
      $G('aria2_rpc_secret').value=randomWord(true, 16, 32);
    }
    document.getElementById("f_" + obj.id).value = "false";
  }
}

function line_show() {
  var temp_aria2 = ["aria2_custom"];
  for (var i = 0; i < temp_aria2.length; i++) {
    temp_str = document.getElementById(temp_aria2[i]).value;
    document.getElementById(temp_aria2[i]).value = temp_str.replaceAll(",", "\n");
  }
}

function validForm() {
  var temp_aria2 = ["aria2_custom"];
  for (var i = 0; i < temp_aria2.length; i++) {
    var temp_str = document.getElementById(temp_aria2[i]).value;
    if (temp_str == "") {
      continue;
    }
    var lines = temp_str.split("\n");
    var rlt = "";
    for (var j = 0; j < lines.length; j++) {
      var nstr = lines[j].trim();
      if (nstr != "") {
        rlt = rlt + nstr + ",";
      }
    }
    if (rlt.length > 0) {
      rlt = rlt.substring(0, rlt.length - 1);
    }
    if (rlt.length > 10000) {
      alert(temp_aria2[i] + " 不能超过10000个字符");
      return false;
    }
    document.getElementById(temp_aria2[i]).value = rlt;
    return true;
  }

}

function pass_checked(obj) {
  switchType(obj, document.form.show_pass.checked, true);
}

function reload_Soft_Center() {
  location.href = "/Main_Soft_center.asp";
}

function openWeb() {
  window.open("http://yuancheng.xunlei.com/")
}

function initial_dir() {
  var __layer_order = "0_0";
  var url = "/getfoldertree.asp";
  var type = "General";

  url += "?motion=gettree&layer_order=" + __layer_order + "&t=" + Math.random();
  $.get(url, function(data) {
    initial_dir_status(data);
  });
}

function initial_dir_status(data) {
  if (data != "" && data.length != 2) {
    get_layer_items("0");
    //eval("var default_dir=" + data);
  } else {
    //document.getElementById("EditExports").style.display = "none";
    disk_flag = 1;
  }
}

function submit_server(x) {
    var server_type = eval('document.serverForm.nfsd_enable ');

    showLoading();
    if (x == 1)
      server_type.value = 0;
    else
      server_type.value = 1;

    document.serverForm.flag.value = "nodetect";
    document.serverForm.submit();
  }
  // get folder
var dm_dir = new Array();
var WH_INT = 0,
  Floder_WH_INT = 0,
  General_WH_INT = 0;
var folderlist = new Array();

function apply() {
  var rule_num = document.getElementById('nfsd_exportlist_table').rows.length;
  var item_num = document.getElementById('nfsd_exportlist_table').rows[0].cells.length;
  var tmp_value = "";

  for (i = 0; i < rule_num; i++) {
    tmp_value += "<"
    for (j = 0; j < item_num - 1; j++) {
      tmp_value += document.getElementById('nfsd_exportlist_table').rows[i].cells[j].innerHTML;
      if (j != item_num - 2)
        tmp_value += ">";
    }
  }
  if (tmp_value == "<" + "<#IPConnection_VSList_Norule#>" || tmp_value == "<")
    tmp_value = "";

  document.form.nfsd_exportlist.value = tmp_value;

  showLoading();
  FormActions("start_apply.htm", "apply", "restart_nasapps", "5");
  document.form.submit();
}

function get_disk_tree() {
  if (disk_flag == 1) {
    alert('<#no_usb_found#>');
    return false;
  }
  cal_panel_block();
  $("#folderTree_panel").fadeIn(300);
  get_layer_items("0");
}

function get_layer_items(layer_order) {
  $.ajax({
    url: '/gettree.asp?layer_order=' + layer_order,
    dataType: 'script',
    error: function(xhr) {;
    },
    success: function() {
      get_tree_items(treeitems);
    }
  });
}

function get_tree_items(treeitems) {
  document.aidiskForm.test_flag.value = 0;
  this.isLoading = 1;
  var array_temp = new Array();
  var array_temp_split = new Array();
  for (var j = 0; j < treeitems.length; j++) { // To hide folder 'Download2'
    array_temp_split[j] = treeitems[j].split("#");
    if (array_temp_split[j][0].match(/^asusware$/)) {
      continue;
    }

    array_temp.push(treeitems[j]);
  }
  this.Items = array_temp;
  if (this.Items && this.Items.length >= 0) {
    BuildTree();
  }
}

function BuildTree() {
  var ItemText, ItemSub, ItemIcon;
  var vertline, isSubTree;
  var layer;
  var short_ItemText = "";
  var shown_ItemText = "";
  var ItemBarCode = "";
  var TempObject = "";
  for (var i = 0; i < this.Items.length; ++i) {
    this.Items[i] = this.Items[i].split("#");
    var Item_size = 0;
    Item_size = this.Items[i].length;
    if (Item_size > 3) {
      var temp_array = new Array(3);
      temp_array[2] = this.Items[i][Item_size - 1];
      temp_array[1] = this.Items[i][Item_size - 2];
      temp_array[0] = "";
      for (var j = 0; j < Item_size - 2; ++j) {
        if (j != 0)
          temp_array[0] += "#";
        temp_array[0] += this.Items[i][j];
      }
      this.Items[i] = temp_array;
    }
    ItemText = (this.Items[i][0]).replace(/^[\s]+/gi, "").replace(/[\s]+$/gi, "");
    ItemBarCode = this.FromObject + "_" + (this.Items[i][1]).replace(/^[\s]+/gi, "").replace(/[\s]+$/gi, "");
    ItemSub = parseInt((this.Items[i][2]).replace(/^[\s]+/gi, "").replace(/[\s]+$/gi, ""));
    layer = get_layer(ItemBarCode.substring(1));
    if (layer == 3) {
      if (ItemText.length > 21)
        short_ItemText = ItemText.substring(0, 30) + "...";
      else
        short_ItemText = ItemText;
    } else
      short_ItemText = ItemText;

    shown_ItemText = showhtmlspace(short_ItemText);

    if (layer == 1)
      ItemIcon = 'disk';
    else if (layer == 2)
      ItemIcon = 'part';
    else
      ItemIcon = 'folders';

    SubClick = ' onclick="GetFolderItem(this, ';
    if (ItemSub <= 0) {
      SubClick += '0);"';
      isSubTree = 'n';
    } else {
      SubClick += '1);"';
      isSubTree = 's';
    }

    if (i == this.Items.length - 1) {
      vertline = '';
      isSubTree += '1';
    } else {
      vertline = ' background="/images/Tree/vert_line.gif"';
      isSubTree += '0';
    }

    if (layer == 2 && isSubTree == 'n1') { // Uee to rebuild folder tree if disk without folder, Jieming add at 2012/08/29
      document.aidiskForm.test_flag.value = 1;
    }
    TempObject += '<table class="tree_table" id="bug_test">';
    TempObject += '<tr>';
    // the line in the front.
    TempObject += '<td class="vert_line">';
    TempObject += '<img id="a' + ItemBarCode + '" onclick=\'document.getElementById("d' + ItemBarCode + '").onclick();\' class="FdRead" src="/images/Tree/vert_line_' + isSubTree + '0.gif">';
    TempObject += '</td>';

    if (layer == 3) {
      /*a: connect_line b: harddisc+name  c:harddisc  d:name e: next layer forder*/
      TempObject += '<td>';
      TempObject += '<img id="c' + ItemBarCode + '" onclick=\'document.getElementById("d' + ItemBarCode + '").onclick();\' src="/images/New_ui/advancesetting/' + ItemIcon + '.png">';
      TempObject += '</td>';
      TempObject += '<td>';
      TempObject += '<span id="d' + ItemBarCode + '"' + SubClick + ' title="' + ItemText + '">' + shown_ItemText + '</span>\n';
      TempObject += '</td>';
    } else if (layer == 2) {
      TempObject += '<td>';
      TempObject += '<table class="tree_table">';
      TempObject += '<tr>';
      TempObject += '<td class="vert_line">';
      TempObject += '<img id="c' + ItemBarCode + '" onclick=\'document.getElementById("d' + ItemBarCode + '").onclick();\' src="/images/New_ui/advancesetting/' + ItemIcon + '.png">';
      TempObject += '</td>';
      TempObject += '<td class="FdText">';
      TempObject += '<span id="d' + ItemBarCode + '"' + SubClick + ' title="' + ItemText + '">' + shown_ItemText + '</span>';
      TempObject += '</td>';
      TempObject += '<td></td>';
      TempObject += '</tr>';
      TempObject += '</table>';
      TempObject += '</td>';
      TempObject += '</tr>';
      TempObject += '<tr><td></td>';
      TempObject += '<td colspan=2><div id="e' + ItemBarCode + '" ></div></td>';
    } else {
      /*a: connect_line b: harddisc+name  c:harddisc  d:name e: next layer forder*/
      TempObject += '<td>';
      TempObject += '<table><tr><td>';
      TempObject += '<img id="c' + ItemBarCode + '" onclick=\'document.getElementById("d' + ItemBarCode + '").onclick();\' src="/images/New_ui/advancesetting/' + ItemIcon + '.png">';
      TempObject += '</td><td>';
      TempObject += '<span id="d' + ItemBarCode + '"' + SubClick + ' title="' + ItemText + '">' + shown_ItemText + '</span>';
      TempObject += '</td></tr></table>';
      TempObject += '</td>';
      TempObject += '</tr>';
      TempObject += '<tr><td></td>';
      TempObject += '<td><div id="e' + ItemBarCode + '" ></div></td>';
    }

    TempObject += '</tr>';
  }
  TempObject += '</table>';
  document.getElementById("e" + this.FromObject).innerHTML = TempObject;
}

function get_layer(barcode) {
  var tmp, layer;
  layer = 0;
  while (barcode.indexOf('_') != -1) {
    barcode = barcode.substring(barcode.indexOf('_'), barcode.length);
    ++layer;
    barcode = barcode.substring(1);
  }
  return layer;
}

function build_array(obj, layer) {
  var path_temp = "/mnt";
  var layer2_path = "";
  var layer3_path = "";
  if (obj.id.length > 6) {
    if (layer == 3) {
      layer3_path = "/" + obj.title;
      while (layer3_path.indexOf("&nbsp;") != -1)
        layer3_path = layer3_path.replace("&nbsp;", " ");

      if (obj.id.length > 8)
        layer2_path = "/" + document.getElementById(obj.id.substring(0, obj.id.length - 3)).innerHTML;
      else
        layer2_path = "/" + document.getElementById(obj.id.substring(0, obj.id.length - 2)).innerHTML;

      while (layer2_path.indexOf("&nbsp;") != -1)
        layer2_path = layer2_path.replace("&nbsp;", " ");
    }
  }
  if (obj.id.length > 4 && obj.id.length <= 6) {
    if (layer == 2) {
      layer2_path = "/" + obj.title;
      while (layer2_path.indexOf("&nbsp;") != -1)
        layer2_path = layer2_path.replace("&nbsp;", " ");
    }
  }
  path_temp = path_temp + layer2_path + layer3_path;
  return path_temp;
}

function GetFolderItem(selectedObj, haveSubTree) {
  var barcode, layer = 0;
  showClickedObj(selectedObj);
  barcode = selectedObj.id.substring(1);
  layer = get_layer(barcode);

  if (layer == 0)
    alert("Machine: Wrong");
  else if (layer == 1) {
    // chose Disk
    setSelectedDiskOrder(selectedObj.id);
    path_directory = build_array(selectedObj, layer);
    document.getElementById('createFolderBtn').className = "createFolderBtn";
    document.getElementById('deleteFolderBtn').className = "deleteFolderBtn";
    document.getElementById('modifyFolderBtn').className = "modifyFolderBtn";

    document.getElementById('createFolderBtn').onclick = function() {};
    document.getElementById('deleteFolderBtn').onclick = function() {};
    document.getElementById('modifyFolderBtn').onclick = function() {};
  } else if (layer == 2) {
    // chose Partition
    setSelectedPoolOrder(selectedObj.id);
    path_directory = build_array(selectedObj, layer);
    document.getElementById('createFolderBtn').className = "createFolderBtn_add";
    document.getElementById('deleteFolderBtn').className = "deleteFolderBtn";
    document.getElementById('modifyFolderBtn').className = "modifyFolderBtn";

    document.getElementById('createFolderBtn').onclick = function() {
      popupWindow('OverlayMask', '/aidisk/popCreateFolder.asp');
    };
    document.getElementById('deleteFolderBtn').onclick = function() {};
    document.getElementById('modifyFolderBtn').onclick = function() {};
    document.aidiskForm.layer_order.disabled = "disabled";
    document.aidiskForm.layer_order.value = barcode;
  } else if (layer == 3) {
    // chose Shared-Folder
    setSelectedFolderOrder(selectedObj.id);
    path_directory = build_array(selectedObj, layer);
    document.getElementById('createFolderBtn').className = "createFolderBtn";
    document.getElementById('deleteFolderBtn').className = "deleteFolderBtn_add";
    document.getElementById('modifyFolderBtn').className = "modifyFolderBtn_add";

    document.getElementById('createFolderBtn').onclick = function() {};
    document.getElementById('deleteFolderBtn').onclick = function() {
      popupWindow('OverlayMask', '/aidisk/popDeleteFolder.asp');
    };
    document.getElementById('modifyFolderBtn').onclick = function() {
      popupWindow('OverlayMask', '/aidisk/popModifyFolder.asp');
    };
    document.aidiskForm.layer_order.disabled = "disabled";
    document.aidiskForm.layer_order.value = barcode;
  }

  if (haveSubTree)
    GetTree(barcode, 1);
}

function showClickedObj(clickedObj) {
  if (this.lastClickedObj != 0)
    this.lastClickedObj.className = "lastfolderClicked"; //this className set in AiDisk_style.css

  clickedObj.className = "folderClicked";
  this.lastClickedObj = clickedObj;
}

function GetTree(layer_order, v) {
  if (layer_order == "0") {
    this.FromObject = layer_order;
    document.getElementById('d' + layer_order).innerHTML = '<span class="FdWait">. . . . . . . . . .</span>';
    setTimeout('get_layer_items("' + layer_order + '", "gettree")', 1);
    return;
  }

  if (document.getElementById('a' + layer_order).className == "FdRead") {
    document.getElementById('a' + layer_order).className = "FdOpen";
    document.getElementById('a' + layer_order).src = "/images/Tree/vert_line_s" + v + "1.gif";
    this.FromObject = layer_order;
    document.getElementById('e' + layer_order).innerHTML = '<img src="/images/Tree/folder_wait.gif">';
    setTimeout('get_layer_items("' + layer_order + '", "gettree")', 1);
  } else if (document.getElementById('a' + layer_order).className == "FdOpen") {
    document.getElementById('a' + layer_order).className = "FdClose";
    document.getElementById('a' + layer_order).src = "/images/Tree/vert_line_s" + v + "0.gif";
    document.getElementById('e' + layer_order).style.position = "absolute";
    document.getElementById('e' + layer_order).style.visibility = "hidden";
  } else if (document.getElementById('a' + layer_order).className == "FdClose") {
    document.getElementById('a' + layer_order).className = "FdOpen";
    document.getElementById('a' + layer_order).src = "/images/Tree/vert_line_s" + v + "1.gif";
    document.getElementById('e' + layer_order).style.position = "";
    document.getElementById('e' + layer_order).style.visibility = "";
  } else
    alert("Error when show the folder-tree!");
}

function cancel_folderTree() {
  this.FromObject = "0";
  $("#folderTree_panel").fadeOut(300);
}

function confirm_folderTree() {
  document.getElementById('aria2_dir').value = path_directory;
  this.FromObject = "0";
  $("#folderTree_panel").fadeOut(300);
}

function cal_panel_block() {
  var blockmarginLeft;
  if (window.innerWidth)
    winWidth = window.innerWidth;
  else if ((document.body) && (document.body.clientWidth))
    winWidth = document.body.clientWidth;

  if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {
    winWidth = document.documentElement.clientWidth;
  }

  if (winWidth > 1050) {
    winPadding = (winWidth - 1050) / 2;
    winWidth = 1105;
    blockmarginLeft = (winWidth * 0.25) + winPadding;
  } else if (winWidth <= 1050) {
    blockmarginLeft = (winWidth) * 0.25 + document.body.scrollLeft;
  }

  document.getElementById("folderTree_panel").style.marginLeft = blockmarginLeft + "px";
}

function addRow(obj, head) {
  if (head == 1)
    nfsd_exportlist_array += "&#60"
  else
    nfsd_exportlist_array += "&#62"

  nfsd_exportlist_array += obj.value;

  obj.value = "";
}

function check_dir_path() {
  var dir_array = document.getElementById('aria2_dir').value.split("/");
  if (dir_array[dir_array.length - 1].length > 21)
    document.getElementById('aria2_dir').value = "/" + dir_array[1] + "/" + dir_array[2] + "/" + dir_array[dir_array.length - 1].substring(0, 18) + "...";
}

function generate_ariang_link() {
  var link_ariang = window.btoa('<% dbus_get_def("aria2_rpc_secret", ""); %>')
  if ($G("aria2_ddnsto").checked) {
    document.getElementById("link4.1").href = "http://aria2.me/aria-ng/#!/settings/rpc/set/wss/www.ddnsto.com/443/jsonrpc/" + link_ariang;
  }else{
    document.getElementById("link4.1").href = "http://aria2.me/aria-ng/#!/settings/rpc/set/http/" + '<% nvram_get("lan_ipaddr"); %>' + "/" + '<% dbus_get_def("aria2_rpc_listen_port", "6800"); %>' + "/jsonrpc/" + link_ariang;
  }
}
function generate_glutton_link() {
  if ($G("aria2_ddnsto").checked) {
    var link_glutton = window.btoa("https://www.ddnsto.com:443" + "/jsonrpc||" + '<% dbus_get_def("aria2_rpc_secret", "0"); %>')
  }else{
    var link_glutton = window.btoa("http://" + '<% nvram_get("lan_ipaddr", "192.168.50.1"); %>' + ":" + '<% dbus_get_def("aria2_rpc_listen_port", "192.168.1.1"); %>' + "/jsonrpc||" + '<% dbus_get_def("aria2_rpc_secret", ""); %>')
  }
  document.getElementById("link4.2").href = "http://aria2.me/glutton/" + "?s=" + link_glutton;
}

function toggle_func() {
  $G("aria2_base_table").style.display = "";
  $G("aria2_rpc_table").style.display = "none";
  $G("aria2_limit_table").style.display = "none";
  $G("aria2_bt_table").style.display = "none";
  $('.show-btn1').addClass('active');
  $(".show-btn1").click(
    function() {
      $('.show-btn1').addClass('active');
      $('.show-btn2').removeClass('active');
      $('.show-btn3').removeClass('active');
      $('.show-btn4').removeClass('active');
      $G("aria2_base_table").style.display = "";
      $G("aria2_rpc_table").style.display = "none";
      $G("aria2_limit_table").style.display = "none";
      $G("aria2_bt_table").style.display = "none";
    });
  $(".show-btn2").click(
    function() {
      $('.show-btn1').removeClass('active');
      $('.show-btn2').addClass('active');
      $('.show-btn3').removeClass('active');
      $('.show-btn4').removeClass('active');
      $G("aria2_base_table").style.display = "none";
      $G("aria2_rpc_table").style.display = "";
      $G("aria2_limit_table").style.display = "none";
      $G("aria2_bt_table").style.display = "none";
    });
  $(".show-btn3").click(
    function() {
      $('.show-btn1').removeClass('active');
      $('.show-btn2').removeClass('active');
      $('.show-btn3').addClass('active');
      $('.show-btn4').removeClass('active');
      $G("aria2_base_table").style.display = "none";
      $G("aria2_rpc_table").style.display = "none";
      $G("aria2_limit_table").style.display = "";
      $G("aria2_bt_table").style.display = "none";
    });
  $(".show-btn4").click(
    function() {
      $('.show-btn1').removeClass('active');
      $('.show-btn2').removeClass('active');
      $('.show-btn3').removeClass('active');
      $('.show-btn4').addClass('active');
      $G("aria2_base_table").style.display = "none";
      $G("aria2_rpc_table").style.display = "none";
      $G("aria2_limit_table").style.display = "none";
      $G("aria2_bt_table").style.display = "";
    });
}
</script>
 </head>
 <body onload="init();">
  <div id="TopBanner"></div>
  <!-- floder tree-->
  <div id="DM_mask" class="mask_bg"></div>
  <div id="folderTree_panel" class="panel_folder">
   <table>
    <tr>
     <td>
      <div class="machineName" style="width:200px;font-family:Microsoft JhengHei;font-size:12pt;font-weight:bolder; margin-top:15px;margin-left:30px;">选择下载目录</div>
     </td>
     <td>
      <div style="width:240px;margin-top:17px;margin-left:125px;">
       <table>
        <tr>
         <td>
          <div id="createFolderBtn" class="createFolderBtn" title="<#AddFolderTitle#>"></div>
         </td>
         <td>
          <div id="deleteFolderBtn" class="deleteFolderBtn" title="<#DelFolderTitle#>"></div>
         </td>
         <td>
          <div id="modifyFolderBtn" class="modifyFolderBtn" title="<#ModFolderTitle#>"></div>
         </td>
         <tr>
       </table>
      </div>
     </td>
     </tr>
   </table>
   <div id="e0" class="folder_tree"></div>
   <div style="background-image:url(images/Tree/bg_02.png);background-repeat:no-repeat;height:90px;">
    <input class="button_gen" type="button" style="margin-left:27%;margin-top:18px;" onclick="cancel_folderTree();" value="取消">
    <input class="button_gen" type="button" onclick="confirm_folderTree();" value="确认">
   </div>
  </div>
  <div id="DM_mask_floder" class="mask_floder_bg"></div>
  <!-- floder tree-->
  <div id="Loading" class="popup_bg"></div>
  <iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
  <form method="post" name="serverForm" action="/start_apply.htm" target="hidden_frame">
   <input type="hidden" name="action_mode" value="apply">
   <input type="hidden" name="action_script" value="restart_nasapps">
   <input type="hidden" name="action_wait" value="5">
   <input type="hidden" name="current_page" value="/Advanced_AiDisk_NFS.asp">
   <input type="hidden" name="flag" value="">
   <input type="hidden" name="nfsd_enable" value="<% nvram_get(" nfsd_enable "); %>">
  </form>
  <form method="post" name="aidiskForm" action="" target="hidden_frame">
   <input type="hidden" name="motion" id="motion" value="">
   <input type="hidden" name="layer_order" id="layer_order" value="">
   <input type="hidden" name="test_flag" value="" disabled="disabled">
   <input type="hidden" name="protocol" id="protocol" value="">
  </form>
  <form method="POST" name="aria2_form" action="/applydb.cgi?p=aria2_" target="hidden_frame">
   <input type="hidden" name="current_page" value="Module_aria2.asp" />
   <input type="hidden" name="next_page" value="Module_aria2.asp" />
   <input type="hidden" name="group_id" value="" />
   <input type="hidden" name="modified" value="0" />
   <input type="hidden" name="action_mode" value="" />
   <input type="hidden" name="action_script" value="" />
   <input type="hidden" name="action_wait" value="5" />
   <input type="hidden" name="first_time" value="" />
   <input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get(" preferred_lang "); %>"/>
   <input type="hidden" name="SystemCmd" id="SystemCmd" onkeydown="onSubmitCtrl(this, ' Refresh ')" value="aria2_config.sh" />
   <input type="hidden" name="firmver" value="<% nvram_get(" firmver "); %>"/>
   <input type="hidden" id="aria2_enable" name="aria2_enable" value='<% dbus_get_def("aria2_enable", "0"); %>' />
   <input type="hidden" id="aria2_restart" name="aria2_restart" value="1" />
   <table class="content" align="center" cellpadding="0" cellspacing="0">
    <tr>
     <td width="17">&nbsp;</td>
     <td valign="top" width="202">
      <div id="mainMenu"></div>
      <div id="subMenu"></div>
     </td>
     <td valign="top">
      <div id="tabMenu" class="submenuBlock"></div>
      <table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
       <tr>
        <td align="left" valign="top">
         <table width="760px" border="0" cellpadding="5" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle" id="FormTitle">
          <tr>
           <td bgcolor="#4D595D" colspan="3" valign="top">
            <div>&nbsp;</div>
            <div style="float:left;" class="formfonttitle">Aria2</div>
            <div style="float:right; width:15px; height:25px;margin-top:10px">
             <img id="return_btn" onclick="reload_Soft_Center();" align="right" style="cursor:pointer;position:absolute;margin-left:-30px;margin-top:-25px;" title="返回软件中心" src="/images/backprev.png" onMouseOver="this.src='/images/backprevclick.png'" onMouseOut="this.src='/images/backprev.png'"></img>
            </div>
            <div style="margin-left:5px;margin-top:10px;margin-bottom:10px">
             <img src="/images/New_ui/export/line_export.png">
            </div>
            <div class="formfontdesc" id="cmdDesc">在此页面，你能进行Aria2的安装和卸载，以及其他一些简单的设置</div>
            <div class="formfontdesc" id="cmdDesc"></div>
            <table id="aria2_switch" style="margin:10px 0px 0px 0px;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
              <tr>
                <th style="width:25%;">开启Aria2</th>
                <td colspan="2">
                  <div claddnsto="switch_field" style="display:table-cell;float: left;">
                    <label for="switch">
                      <input id="switch" class="switch" type="checkbox" style="display: none;">
                      <div class="switch_container">
                        <div class="switch_bar"></div>
                        <div class="switch_circle transition_style">
                          <div></div>
                        </div>
                      </div>
                    </label>
                  </div>
                  <div id="aria2_version_status" style="padding-top:5px;margin-left:30px;margin-top:0px;float: left;">插件版本：<% dbus_get_def("aria2_version", "0"); %></div>
                  <div id="aria2_changelog_show" style="padding-top:5px;margin-left:30px;margin-top:0px;float: right;">
                    <a type="button" class="aria2_btn" style="cursor:pointer" href="https://raw.githubusercontent.com/koolshare/merlin-aria2/master/Changelog.txt" target="_blank">更新日志</a>
                  </div>
                </td>
              </tr>
            </table>
            <!--beginning of aria2 install table-->
            <table id="aria2_install_table" style="margin:10px 0px 0px 0px;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
             <thead>
              <tr>
               <td colspan="2">Aria2相关信息</td>
              </tr>
             </thead>
             <tr id="aria2_status">
              <th style="width:25%;">运行状态</th>
              <td><span id="status">获取中...</span>
              </td>
             </tr>
             <tr>
              <th style="width:25%;">远程连接</th>
              <td><label><input type="checkbox" id="aria2_ddnsto" checked="checked" onclick="oncheckclick(this);">
                <input type="hidden" id="f_aria2_ddnsto" name="aria2_ddnsto" value="" /><span id="ddnsto_status"></span></label></td>
             </tr>
             <tr id="ariang">
                <th style="width:25%;">AriaNg控制台</th>
                <td>
                 <div style="padding-top:5px;">
                  <a id="link4.1" style="font-size: 16px; "Lucida Grande", "Trebuchet MS", Verdana, sans-serif;" href="http://aria2.me/aria-ng/" target="_blank"><i><u>http://aria2.me/aria-ng/</u></i></a>
                  <span><a style="font-size: 12px;margin-left: 20px;" href="http://koolshare.cn/thread-116500-1-1.html" target="_blank"><i><u>戳我了解</u></i></a>
                 </div>
                </td>
               </tr>
            <tr id="glutton">
                <th style="width:25%;">Glutton控制台</th>
                <td>
                  <div style="padding-top:5px;">
                      <a id="link4.2" style="font-size: 16px;" href="http://aria2.me/glutton/" target="_blank"><i><u>http://aria2.me/glutton/</u></i></a>
                      <span><a style="font-size: 12px;margin-left: 20px;" href="https://koolshare.cn/thread-40938-1-1.html" target="_blank"><i><u>戳我了解</u></i></a>
                  </div>
                </td>
            </tr>
             <tr id="webui">
              <th style="width:25%;">更多控制台</th>
              <td>
               <div style="padding-top:5px;">
                <a style="font-size: 16px; "Lucida Grande", "Trebuchet MS", Verdana, sans-serif;" href="http://aria2.me/" target="_blank"><i><u>http://aria2.me/</u></i></a>
               </div>
              </td>
             </tr>
            </table>
            <div id="tablet_show">
             <table style="margin:10px 0px 0px 0px;border-collapse:collapse"  width="100%" height="37px">
              <tr width="235px">
                <td colspan="4" cellpadding="0" cellspacing="0" style="padding:0" border="1" bordercolor="#000">
                  <input id="show_btn1" class="show-btn1" style="cursor:pointer" type="button" value="基本设置"/>
                  <input id="show_btn2" class="show-btn2" style="cursor:pointer" type="button" value="RPC设定"/>
                  <input id="show_btn3" class="show-btn3" style="cursor:pointer" type="button" value="下载限制"/>
                  <input id="show_btn4" class="show-btn4" style="cursor:pointer" type="button" value="BT设置"/>
                </td>
                </tr>
             </table>
            </div>



            <table id="aria2_base_table" style="margin:-1px 0px 0px 0px;display: none;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用CPU占用限制</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_cpulimit_enable" checked="" onchange="update_visibility(this);">
                              <input type="hidden" id="f_aria2_cpulimit_enable" name="aria2_cpulimit_enable" value="" />
                              <input style="display: none;" type="text" class="input_ss_table" style="width:auto;" name="aria2_cpulimit_value" value="30" maxlength="40" size="40" id="aria2_cpulimit_value">
                              <small>(范围: 1 - 100; 默认: 30)</small>
                            </td>
                          </tr>



                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启动延迟</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_sleep" value="10" maxlength="5" size="7" id="aria2_sleep">
                              <small>秒 (范围: 1 - 60; 默认: 10)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>下载存储目录</label>
                            </td>
                            <td>
                             <input type="text" class="input_ss_table" style="width:auto;" name="aria2_dir" value="downloads" maxlength="50" size="40" ondblClick="get_disk_tree();" id="aria2_dir">
                             <small>双击选择路径，如果没有自定义，将使用第一个USB的根目录.</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用续传</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_continue" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_continue" name="aria2_continue" value="" />
                              <small>*</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>最大重试次数</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_max_tries" value="0" maxlength="16" size="7" id="aria2_max_tries">
                              <small>(范围: 0 - 9999; 默认: 0 - 无限制)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>重试间隔时间</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_retry_wait" value="10" maxlength="16" size="7" id="aria2_retry_wait">
                              <small>秒 (范围: 0 - 3600; 默认: 10)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>Referer (适用于v1.16+)</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_referer" value="*" maxlength="1024" size="15" id="aria2_referer">
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>磁盘缓存大小 (适用于v1.16+)</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_disk_cache" value="0" maxlength="16" size="7" id="aria2_disk_cache">
                              <small>( 以K或M结尾，例如，10K, 5M, 1024K 等等; 缺省: 0 - 无磁盘缓存)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用 MMAP</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_enable_mmap" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_enable_mmap" name="aria2_enable_mmap" value="" />
                              <small>*</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>文件分配方式</label>
                            </td>
                            <td>
                              <select class="input_ss_table" style="width:86px;height:25px;" name="aria2_file_allocation" id="aria2_file_allocation">
                                <option value="prealloc">Prealloc</option>
                                <option value="trunc">Trunc</option>
                                <option value="falloc">Falloc</option>
                                <option value="none" selected="">None*</option>
                              </select>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>Aria2 配置自定义</label>
                            </td>
                            <td>
                              <textarea rows=6 style="width:99%; font-size:11px;background:#475A5F;color:#FFFFFF;border:1px solid gray;height:auto;" name="aria2_custom" id="aria2_custom" title="">ca-certificate=false,check-certificate=false</textarea>
                            </td>
                          </tr>
                        </table>
                        <table id="aria2_rpc_table" style="margin:-1px 0px 0px 0px;display: none;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用 RPC</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_enable_rpc" checked="" onchange="update_visibility(this);">
                              <input type="hidden" id="f_aria2_enable_rpc" name="aria2_enable_rpc" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr id="aria2_rpc_listen_port_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>RPC 监听端口</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_rpc_listen_port" value="6800" maxlength="5" size="7" id="aria2_rpc_listen_port" title=""> <small>*</small>

                            </td>
                          </tr>
                          <tr id="aria2_rpc_allow_origin_all_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>RPC 允许所有来源</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_rpc_allow_origin_all" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_rpc_allow_origin_all" name="aria2_rpc_allow_origin_all" value="" />
                              <small>*</small>
                            </td>
                          </tr>

                          <tr id="aria2_disable_ipv6_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>RPC 不监听IPV6</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_disable_ipv6" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_disable_ipv6" name="aria2_disable_ipv6" value="" />
                              <small>*</small>
                            </td>
                          </tr>

                          <tr id="aria2_rpc_listen_all_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>RPC 监听所有网络接口</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_rpc_listen_all" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_rpc_listen_all" name="aria2_rpc_listen_all" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr id="aria2_event_poll_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>轮询方式</label>
                            </td>
                            <td>
                              <select class="input_ss_table" style="width:86px;height:25px;" name="aria2_event_poll" id="aria2_event_poll">
                                <option value="select" selected="">Select</option>
                                <option value="poll">Poll</option>
                                <option value="port">Port</option>
                                <option value="kqueue">KQueue</option>
                                <option value="epoll">EPoll</option>
                              </select>
                            </td>
                          </tr>
                          <tr id="aria2_rpc_secret_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>RPC密码 / token</label>
                            </td>
                            <td>
                              <input type="password" class="input_ss_table" style="width:auto;" name="aria2_rpc_secret" value="" maxlength="100" size="50" id="aria2_rpc_secret" autocomplete="new-password" autocorrect="off" autocapitalize="off" value="" onBlur="switchType(this, false);" onFocus="switchType(this, true);">
                              <input type="button" class="aria2_btn" name="random_btn1" id="random_btn1" style="cursor:pointer" onclick="javascript:$G('aria2_rpc_secret').value=randomWord(true, 16, 32);" value="随机生成" /><br>
                              <small><i>(如果勾选上方的“启用DDNSTO远程连接”，此处将不能自定义。)</i></small>
                            </td>
                          </tr>
                        </table>
                        <table id="aria2_limit_table" style="margin:-1px 0px 0px 0px;display: none;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>最大同时下载任务数</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_max_concurrent_downloads" value="3" maxlength="10" size="7" id="aria2_max_concurrent_downloads">
                              <small>(范围: 1 - 100; 缺省: 5)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>同服务器最大连接数</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_max_connection_per_server" value="3" maxlength="10" size="7" id="aria2_max_connection_per_server">  <small>(范围: 1 - 16; 缺省: 5)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;" style="background-color: #2F3A3E;width:25%;">
                              <label>最小文件分片大小</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_min_split_size" value="10M" maxlength="20" size="10" id="aria2_min_split_size"> <small>(范围: 1M - 1024M; 缺省: 10M)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>单文件最大线程数</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_split" value="5" maxlength="10" size="10" id="aria2_split"> <small>(范围: 1 - 100; 缺省: 5)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>下载总速度限制</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_max_overall_download_limit" value="0" maxlength="16" size="10" id="aria2_max_overall_download_limit"> <small>( 例如, 10K, 5M, 1024K 等等; 缺省: 0 - 无限制)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>单文件下载速度限制</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_max_download_limit" value="0" maxlength="16" size="10" id="aria2_max_download_limit"> <small>( 例如, 10K, 5M, 1024K 等等; 缺省: 0 - 无限制)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>上传总速度限制</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_max_overall_upload_limit" value="0" maxlength="16" size="10" id="aria2_max_overall_upload_limit"> <small>( 例如, 10K, 5M, 1024K 等等; 缺省: 0 - 无限制)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>单文件上传速度限制</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_max_upload_limit" value="0" maxlength="16" size="10" id="aria2_max_upload_limit"> <small>( 例如, 10K, 5M, 1024K 等等; 缺省: 0 - 无限制)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>断开此速度以下的连接</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:80px;" name="aria2_lowest_speed_limit" value="0" maxlength="16" size="10" id="aria2_lowest_speed_limit"> <small>( 例如, 10K, 5M, 1024K 等等; 缺省: 0 - 无限制)</small>

                            </td>
                          </tr>
                        </table>
                        <table id="aria2_bt_table" style="margin:-1px 0px 0px 0px;display: none;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用本地节点查找(LPD)</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_bt_enable_lpd" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_bt_enable_lpd" name="aria2_bt_enable_lpd" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用 DHT</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_enable_dht" checked="" onchange="update_visibility(this);">
                              <input type="hidden" id="f_aria2_enable_dht" name="aria2_enable_dht" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr id="aria2_dht_listen_port_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>DHT 监听端口</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_dht_listen_port" value="52413" maxlength="50" size="50" id="aria2_dht_listen_port">
                              <small>默认: 52413</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>添加额外的Tracker</label>
                            </td>
                            <td>
                              <textarea rows=6 style="width:99%; font-size:11px;background:#475A5F;color:#FFFFFF;border:1px solid gray;height:auto;" name="aria2_bt_tracker" id="aria2_bt_tracker"></textarea>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>单种子最大连接数</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_bt_max_peers" value="55" maxlength="10" size="7" id="aria2_bt_max_peers">
                              <small>(范围: 1 - 9999; 缺省: 55)</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>强制加密</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_bt_require_crypto" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_bt_require_crypto" name="aria2_bt_require_crypto" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>自动下载.torrent种子</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_follow_torrent" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_follow_torrent" name="aria2_follow_torrent" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>BT 监听端口</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_listen_port" value="6881-6889,51413" maxlength="50" size="50" id="aria2_listen_port">
                              <small>*</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用节点信息交换</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_enable_peer_exchange" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_enable_peer_exchange" name="aria2_enable_peer_exchange" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>用户代理</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_user_agent" value="uTorrent/2210(25130)" maxlength="64" size="50" id="aria2_user_agent">
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>节点ID前缀</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_peer_id_prefix" value="-UT2210-" maxlength="64" size="15" id="aria2_peer_id_prefix">
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>分享比例</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_seed_ratio" value="1.0" maxlength="64" size="15" id="aria2_seed_ratio"> <small>(范围: 0.0 - 9999; 缺省: 1.0)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用会话session强制保存</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_force_save" checked="" onchange="update_visibility(this);">
                              <input type="hidden" id="f_aria2_force_save" name="aria2_force_save" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr id="aria2_save_session_interval_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>&nbsp;&nbsp;&nbsp;&nbsp;会话session保存间隔</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_save_session_interval" value="60" maxlength="20" size="7" id="aria2_save_session_interval"> <small>秒 (范围: 0 - 3600; 缺省: 60)</small>

                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>&nbsp;&nbsp;&nbsp;&nbsp;下载的URIs 文件</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_input_file" value="/koolshare/aria2/aria2.session" maxlength="50" size="50" id="aria2_input_file">
                            </td>
                          </tr>
                          <tr id="aria2_save_session_tr">
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>&nbsp;&nbsp;&nbsp;&nbsp;会话session保存文件</label>
                            </td>
                            <td>
                              <input type="text" class="input_ss_table" style="width:auto;" name="aria2_save_session" value="/koolshare/aria2/aria2.session" maxlength="50" size="50" id="aria2_save_session">
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用哈希检查做种</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_bt_hash_check_seed" checked="" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_bt_hash_check_seed" name="aria2_bt_hash_check_seed" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用无校验做种</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_bt_seed_unverified" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_bt_seed_unverified" name="aria2_bt_seed_unverified" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                          <tr>
                            <td style="background-color: #2F3A3E;width:25%;">
                              <label>启用元数据保存</label>
                            </td>
                            <td>
                              <input type="checkbox" id="aria2_bt_save_metadata" onclick="oncheckclick(this)">
                              <input type="hidden" id="f_aria2_bt_save_metadata" name="aria2_bt_save_metadata" value="" />
                              <small>*</small>
                            </td>
                          </tr>
                        </table>
                        <div id="warn" style="display: none;margin-top: 20px;text-align: center;font-size: 20px;margin-bottom: 20px;" class="formfontdesc" id="cmdDesc">
                          <i>开启双线路负载均衡模式才能进行本页面设置，建议负载均衡设置比例1：1</i>
                        </div>
                        <div class="apply_gen">
                          <button id="cmdBtn" class="button_gen" onclick="onSubmitCtrl(this, ' Refresh ')">提交</button>
                          <button id="cmdBtn1" class="button_gen" onclick="load_default_value(this, ' Refresh ')">恢复默认参数</button>
                        </div>
                        <div style="margin-left:5px;margin-top:10px;margin-bottom:10px">
                          <img src="/images/New_ui/export/line_export.png">
                        </div>
                        <div class="KoolshareBottom">
                          <br/>论坛技术支持：
                          <a href="http://www.koolshare.cn" target="_blank"> <i><u>www.koolshare.cn</u></i>
                          </a>
                          <br/>后台技术支持： <i>Xiaobao</i>
                          <br/>Shell, Web by： <i>fw867</i>
                          <br/>
                        </div>
                      </td>
                    </tr>
                  </table>
                </td>
                <td width="10" align="center" valign="top"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <div id="footer"></div>
      <div id="OverlayMask" class="popup_bg">
        <div align="center">
          <iframe src="" frameborder="0" scrolling="no" id="popupframe" width="400" height="400" allowtransparency="true" style="margin-top:150px;"></iframe>
        </div>
      </div>
    </form>
  </body>
</html>
