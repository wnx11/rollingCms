<!DOCTYPE html>
<html class="loginHtml">
<head>
	<meta charset="utf-8">
	<title>登录-青山冲智慧碾压管理后台V1.0</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="../../favicon.ico">
	<link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${base}/static/css/public.css" media="all" />
</head>
<body class="loginBody">
	<form id="loginForm" action="${base}/login/index.jhtml" method="post" class="layui-form">
		<div class="login_face"><img src="${base}/static/img/logo.png" class="userAvatar"></div>
		<div class="layui-form-item input-item">
			<label for="userName">用户名</label>
			<input type="text" placeholder="请输入用户名" autocomplete="off" id="username" name="username" class="layui-input" lay-verify="required">
		</div>
		<div class="layui-form-item input-item">
			<label for="password">密码</label>
			<input type="password" placeholder="请输入密码" autocomplete="off" id="password" name="password" class="layui-input" lay-verify="required">
		</div>
		<div class="layui-form-item input-item" id="imgCode">
			<label for="code">验证码</label>
			<input type="text" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input">
			<img src="${base}/static/img/code.jpg">
		</div>
		<div class="layui-form-item">
			<button class="layui-btn layui-block" type="submit">登录</button>
		</div>
		
	</form>
	<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
	<script type="text/javascript" src="${base}/static/js/login.js"></script>
	<script type="text/javascript" src="${base}/static/js/cache.js"></script>
	<script type="text/javascript">
	layui.use('layer',function(){
		var $loginForm = $("#loginForm");
		var $username = $("#username");
		var $password = $("#password");
	    var layer = layui.layer;
	    <#if failureMessage??>
	    	layer.msg("${failureMessage}"); 
		</#if>
	    $loginForm.submit( function() {
	    	if ($username.val() == "") {
	    		layer.msg("用户名不能为空!");
				return false;
			}
			if ($password.val() == "") {
				layer.msg("密码不能为空!");
				return false;
			}
	    })
	})

    </script>
</body>
</html>