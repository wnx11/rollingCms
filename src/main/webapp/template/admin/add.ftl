<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
	<link href="${base}/static/layui/css/layui.css" rel="stylesheet"/>
	<script src="${base}/static/js/jquery.min.js"></script>
	<script src="${base}/static/layui/layui.all.js"></script>
</head>
<body>
<div class="layui-container">  
	<div class="layui-row" style="padding-top: 30px;">
		<form class="layui-form" action="" lay-filter="addRole">
			<div class="layui-tab">
			  <ul class="layui-tab-title">
			    <li class="layui-this">基本信息</li>
			    <li>个人资料</li>
			  </ul>
			  <div class="layui-tab-content">
				    <div class="layui-tab-item layui-show">
				      	<div class="layui-form-item">
						    <label class="layui-form-label">用户名</label>
						    <div class="layui-input-block">
						      <input type="text" name="username" lay-verify="required|username|unique" autocomplete="off" placeholder="请输入用户名" class="layui-input">
						    </div>
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">密码</label>
						    <div class="layui-input-block">
						      <input type="password" id="password" name="password" lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input">
						    </div>
						   
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">确认密码</label>
						    <div class="layui-input-block">
						      <input type="password" id="rePassword" name="rePassword" lay-verify="required|rePassword" placeholder="请确认密码" autocomplete="off" class="layui-input">
						    </div>
						   
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">E-mail</label>
						    <div class="layui-input-block">
						      <input type="text" name="email" lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
						    </div>
						  </div>
						  <div class="layui-form-item">
						    <label class="layui-form-label">角色</label>
						    <div class="layui-input-block">
						      <#list roles as role>
						      	 <input type="checkbox" name="roles" lay-filter="roles" value="${role.id}" title="${role.name}">
						      </#list>
						    </div>
						  </div>
						 <div class="layui-form-item" pane="">
						    <label class="layui-form-label">是否启用</label>
						    <div class="layui-input-block">
						      <input type="checkbox" name="is_enabled"  lay-skin="switch" lay-filter="switchEnable" title="是否启用">
						    </div>
						  </div>
						  
				    </div>
				    <div class="layui-tab-item">
				    	<div class="layui-form-item">
						    <label class="layui-form-label">部门</label>
						    <div class="layui-input-block">
						      <input type="text" name="department"  placeholder="请输入部门" autocomplete="off" class="layui-input">
						    </div>
						 </div>
						 <div class="layui-form-item">
						    <label class="layui-form-label">姓名</label>
						    <div class="layui-input-block">
						      <input type="text" name="name" placeholder="请输入姓名" autocomplete="off" class="layui-input">
						    </div>
						 </div>
				    </div>
			  </div>
		 </div>
		 <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit="" lay-filter="submitAdminForm">立即提交</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
		    </div>
		</form>
	</div>
</div>


<script>
	var form=layui.form;
	form.render();
	var roles=[];
	var is_enable=false;
	form.on('switch(switchEnable)', function(data){
		  console.log(data.elem.checked); 
		  if(data.elem.checked){
		  	is_enable=true;
		  }else{
		  	is_enable=false;
		  }
		  console.log(data.value); 
	
	});  
	form.on('checkbox(roles)', function(data){
		  var isChecked=data.elem.checked;
		  var role=data.value+"";
		  if(isChecked){
		  	roles.push(role);
		  }else{
		  	var index = roles.indexOf(role);
		  	roles.splice(index, 1);
		  }
		  console.log(roles);
	}); 
	form.verify({
	  username: function(value, item){ //value：表单的值、item：表单的DOM对象
	    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
	      return '用户名不能有特殊字符';
	    }
	    if(/(^\_)|(\__)|(\_+$)/.test(value)){
	      return '用户名首尾不能出现下划线\'_\'';
	    }
	    if(/^\d+\d+\d$/.test(value)){
	      return '用户名不能全为数字';
	    }
	  }
    ,unique:function(value, item) {
  			var checkResult='';
			$.ajax({
				url : '${base}/admin/checkUsername.jhtml',
				type : 'GET',
				data : {
					"username" : value
				},
				datatype : 'json',
				async : false,
				success : function(result) {
					if (!result) {
						checkResult='该用户名已经存在'
					}
				},
				error : function() {
					 
				}
			});
			return checkResult
		}
	  ,password: [
	    /^[\S]{6,12}$/
	    ,'密码必须6到12位，且不能出现空格'
	  ]
	  ,rePassword:function(value){
	  	var password=$('#password').val();
	  	if(value!=password){
	  		return '密码不一致'
	  	}
	  }
	  ,email: [/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']  
	
	});  
	
	form.on('submit(submitAdminForm)', function(data){
		var data=data.field;
		delete data['rePassword'];
		data.is_enabled=is_enable;
		data["roles"]=roles+"";
		console.log(JSON.stringify(data));
	   	 $.ajax({
	   	 	url:'${base}/admin/add.jhtml',
	   	 	contentType: "application/json", //必须这样写
	   	 	type:'post',
	   	 	data:JSON.stringify(data),
	   	 	dataType:'json',
    		beforeSend:function (request) {
				loadIndex = layer.load();
			},
    		success:function(jsonObject) {
				layer.close(loadIndex);
				var parentIndex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(parentIndex); //再执行关闭   
			}								
		});
	    return false;
	  });
</script>
</body>
</html>