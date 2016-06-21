<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>新增门店</title>
<style type="text/css"> 
.error{ 
color:Red; 
margin-left:10px;  
} 
</style> 
</head>

<body>

	<div class="page-header">
   		<h2>新增门店</h2>
 	</div>
 	 <c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<form id="inputForm" method="post" Class="form-horizontal" action="${ctx}/manage/store/save"   enctype="multipart/form-data" >
			<div
	class="control-group">
	<label class="control-label" for="name">门店名称：</label>
	<div class="controls">
		<input type="text" name="name" class="input-large " value=""   />
	</div>
</div>

<div
	class="control-group">
	<label class="control-label" for="addr">缩略图：</label>
	<div class="controls">
		<input class='input-file' name='fileInput_thum' id='fileInput' type='file'>
				 <p class="text-success"> 建议640*360，JPEG/PNG格式.</p>
		
	</div>
</div>

<div
	class="control-group">
	<label class="control-label" for="addr">地址：</label>
	<div class="controls">
		<input type="text" name="addr" value=""   class="input-large"  />
		<a id="searchCoordinate" class="btn" target="_blank" href="http://api.map.baidu.com/lbsapi/getpoint/index.html">尝试查询经纬度</a>
	</div>
</div>
<!-- <div
	class="control-group">
	<label class="control-label" for="province">省份：</label>
	<div class="controls">
		<input type="text" name="province" value=""   class="input-large"  />
	</div>
</div>


<div
	class="control-group">
	<label class="control-label" for="city">城市：</label>
	<div class="controls">
		<input type="text" name="city" value=""   class="input-large"  />
	</div>
</div> -->


		<div class="control-group">
			<label class="control-label">所在省份：</label>
			<div class="controls">
				<select id="province" name="province" class="province-select">
					<option value="">请选择省份</option>
					<c:forEach items = "${province}" var="pro">
						<option  value="${pro.id}">${pro.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
	<div class="control-group">
			<label for="city" class="control-label">所在城市：</label>
			<div class="controls" >
				<input type="hidden" value = "${store.city}" id="initCity"/>
				<select  id="cityCode" name="city"  class="city-select"></select> 
			</div>
	</div>



<div class="control-group">
	<label class="control-label" for="longitude">经度：</label>
	<div class="controls">
		<input type="text" name="longitude" value=""    class="input-large"  />
	</div>
</div><div
	class="control-group">
	<label class="control-label" for="latitude">纬度：</label>
	<div class="controls">
		<input type="text" name="latitude" value=""   class="input-large"  />
	</div>
</div><div
	class="control-group">
	<label class="control-label" for="tel">电话：</label>
	<div class="controls">
		<input type="text" name="tel" value=""   class="input-large"  />
	</div>
</div>


<div class="page-header">
   		<h2>支付宝设置</h2>
 	</div>

<div
	class="control-group">
	<label class="control-label" for="tel">合作伙伴ID：</label>
	<div class="controls">
		<input type="text" name="partner" value=""   class="input-large"  />
	</div>
</div>
<div
	class="control-group">
	<label class="control-label" for="tel">支付宝帐号：</label>
	<div class="controls">
		<input type="text" name="seller" value=""   class="input-large"  />
	</div>
</div>
<div
	class="control-group">
	<label class="control-label" for="tel">私钥：</label>
	<div class="controls">
				<textarea rows="5"  name="privateKey " style="width: 400px" ></textarea>

	</div>
</div>
					
 			<div class="form-actions">
  			     <button type="submit" class="btn btn-primary" id="submit">保存</button>
				 <a href="<%=request.getContextPath()%>/manage/store/index" class="btn btn-primary">返回</a>
	        </div>
	</form>
	<script type="text/javascript">

$(function(){
	
	
	
	$("#province").change(function(e){
		var value = $("#province").val();
		$("#cityCode").empty();
		e.preventDefault();
		$.ajax({
			url: '<%=request.getContextPath()%>/manage/store/findCitys?provinceId=' + value, 
			type: 'GET',
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify({name:value}),					
			dataType: 'text',
			success: function(data){
				var parsedJson = $.parseJSON(data);
				$("#cityCode").append("<option value=''>"+"选择下级城市"+"</option>");
				 jQuery.each(parsedJson, function(index, itemData) {
				 $("#cityCode").append("<option value='"+itemData.areaCode+"'>"+itemData.name+"</option>"); 
				 });
			},error:function(xhr){alert('错误了\n\n'+xhr.responseText)}//回调看看是否有出错
		});
	}); 
	
	jQuery.validator.addMethod("validateCity",function(value,element,params)
			{
				var ct=$("#city").val();
				return (ct==''|| ct==null);
			},"请选择城市");
	
	jQuery.validator.addMethod("phone", function(value, element) { 

		var tel = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/; 

		return this.optional(element) || (tel.test(value)); 

		}, "电话号码格式错误");
	
	jQuery.validator.addMethod("longitude", function(value, element) { 
		
		//var reg1 =  /^((\d|[1-9]\d|1[0-7]\d)[°](\d|[0-5]\d)[′](\d|[0-5]\d)(\.\d{1,2})?[\″]?[E]|[W]$)|(180[°]0[′]0[\″]?[E]|[W]$)/; 
		var reg1 =  /^((\d|[1-9]\d|1[0-7]\d)[°](\d|[0-5]\d)[′](\d|[0-5]\d)(\.\d{1,6})?[\″]$)|(180[°]0[′]0[\″]$)/;
		return this.optional(element) || (reg1.test(value)); 

		}, "经度错误");
	jQuery.validator.addMethod("latitude", function(value, element) { 

		var reg2 = /^((\d|[1-8]\d)[°](\d|[0-5]\d)[′](\d|[0-5]\d)(\.\d{1,6})?[\″]$)|(90[°]0[′]0[\″]$)/;
		//var reg2 =  /^((\d|[1-8]\d)[°](\d|[0-5]\d)[′](\d|[0-5]\d)(\.\d{1,2})?[\″]?[N]|[S]$)|(90[°]0[′]0[\″]?[N]|[S]$)/; 

		return this.optional(element) || (reg2.test(value)); 

		}, "纬度错误");
	$("#inputForm").validate({
		rules:{
			name:{
				required:true
			},
			longitude:{
		        required:false,
			    number:true,
			    maxlength:30 
			},
			latitude:{
				required:false,
				number:true,
				maxlength:30 
				
		    },
	     	city:{
	     		required:true
			},
			province:{
	     		required:true
			},
			tel:{
				phone:true
			},
			partner:{
	     		required:true
			},
			seller:{
	     		required:true
			},
			privateKey:{
	     		required:true
			}
			
		},messages:{
			name:{
				required:"必须填写",
			},
			loginName:{
				required:"必须填写",
			}
		}
	});
})


</script> 
</body>