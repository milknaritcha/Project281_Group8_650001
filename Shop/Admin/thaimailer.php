<?php /* ThaiMailer.php v1.0 - Banchar Paseelatesang (banchar_pa@yahoo.com) */
$__tml_fm="";$__tml_to="";$__tml_sb="";$__tml_bd="";$__tml_cc="";$__tml_bc="";$__tml_re="";$__tml_ch="utf-8";$__tml_ct="text/plain";$__tml_ww=70;$__tml_at=array();
function mail_from($email){global $__tml_fm;$__tml_fm=$email;}
function mail_to($email){global $__tml_to;$__tml_to=__clrspc($email);}
function mail_cc($email){global $__tml_cc;$__tml_cc=__clrspc($email);}
function mail_bcc($email){global $__tml_bc;$__tml_bc=__clrspc($email);}
function mail_reply2($email){global $__tml_re;$__tml_re=__clrspc($email);}
function __clrspc($email){return preg_replace("/[ ]*,[ ]*/i",",",$email);}
function mail_subject($s){global $__tml_sb; $__tml_sb=$s;}
function mail_body($text,$is_html=false){global $__tml_bd,$__tml_ct;$__tml_bd=$text;$__tml_ct=($is_html)?"text/html":"text/plain";}function mail_wordwrap($length){global $__tml_ww;$__tml_ww=$length;}
function mail_charset($encode){global $__tml_ch;$__tml_ch=$encode;}
function mail_attach(){global $__tml_at;$n=func_num_args();for($i=0;$i<$n;$i++){$a=func_get_arg($i);array_push($__tml_at,$a);}}function __encnm($e){$m=explode(",",$e);$e=array();	foreach($m as $a){$p=stripos($a,"<");$n=__b64e(substr($a,0,$p));array_push($e,$n.substr($a,$p));}	return implode(",",$e);}
function __b64e($t){global $__tml_ch;return "=?$__tml_ch?B?".base64_encode($t)."?=";}function __hdr($h,$e){return "$h: ".__encnm($e)."\r\n";}
function mail_send(){global $__tml_fm,$__tml_to,$__tml_sb,$__tml_bd,$__tml_cc,$__tml_bc,$__tml_re,$__tml_ch,$__tml_ct,$__tml_ww,$__tml_at;$__tml_to=__encnm($__tml_to);if(!empty($__tml_fm)){$__tml_fm=__hdr("From",$__tml_fm);}if(!empty($__tml_cc)){$__tml_cc=__hdr("Cc",$__tml_cc);}if(!empty($__tml_bc)){$__tml_bc=__hdr("Bcc",$__tml_bc);}if(!empty($__tml_re)){$__tml_re=__hdr("Reply-To",$__tml_re);}$rnd=md5(time());$bnd="==Multipart_Boundary_x{$rnd}x";$h="\r\nMIME-Version: 1.0\r\nContent-Type: multipart/mixed; boundary=\"$bnd\"\r\n$__tml_fm$__tml_cc$__tml_bc{$__tml_re}X-Mailer: PHP/ThaiMailer\r\n";$__tml_bd=($__tml_ww==0)?$__tml_bd:wordwrap($__tml_bd,$__tml_ww,"\r\n");$b="\r\n\r\n--$bnd\r\nContent-Type: $__tml_ct;charset=$__tml_ch\r\nContent-Transfer-Encoding: 7bit\r\n\r\n$__tml_bd\r\n\r\n--$bnd\r\n";foreach($__tml_at as $f){if(!file_exists($f)){continue;}$d=chunk_split(base64_encode(file_get_contents($f)));$b.="Content-Type: application/octet-stream name=\"$f\"\r\nContent-Disposition: attachment; filename=\"$f\"\r\nContent-Transfer-Encoding: base64\r\n\r\n$d\r\n\r\n--$bnd\r\n";}$t=$__tml_to;$s=__b64e($__tml_sb);return mail($t,$s,$b,$h);}
?>