<%@page import="cn.vless.cloud.device.model.DeviceStats"%>
<%@page import="cn.vless.cloud.security.model.SecUser"%>
<%@page import="cn.vless.cloud.device.model.*"%>
<%@page import="cn.vless.cloud.sys.vo.query.SysMsgQuery"%>
<%@page import="cn.vless.cloud.sys.model.*"%>
<%@page import="cn.vless.cloud.common.global.*"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="cn.vless.cloud.project.model.*"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<!-- 主要内容 -->
<html class="no-js" lang="">
<head>
<title>查看位置</title>
<%@ include file="/commons/formlibs.jsp"%>
<script
	src="${pageContext.request.contextPath}/scripts/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/jquery-treetable/stylesheets/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/scripts/jquery-treetable/stylesheets/jquery.treetable.theme.default.css">
<script src="${ctx}/scripts/rest.js"></script>
<script src="${ctx}/scripts/application.js" type="text/javascript"></script>
<link href="<c:url value="/widgets/simpletable/simpletable.css"/>"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>

<script type="text/javascript">
			$(document).ready(function() {
				// 分页需要依赖的初始化动作
				window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
			});
		</script>
		
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;margin:0;font-family:"Î¢ÈíÑÅºÚ";font-size:14px;}
		#l-map{height:80%;width:100%;}
		#r-result{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yCXN0O95digZajmS40o6CNMv7Q1BXQNy"></script>

</head>
<body>
	<div class="wrapper">
		<!-- Main -->
		<div class="container-fluid nav-fixed" id="content">
			<jsp:include page="/commons/ad_sys_left.jsp">
				<jsp:param name="l" value="23" />
			</jsp:include>
			<jsp:include page="/commons/ad_head.jsp">
				<jsp:param name="h" value="13" />
			</jsp:include>
			<div id="main">
				<div class="container-fluid">
					<div class="breadcrumb">
						<a href="${ctx}/admin/deviceinfo">设备管理</a> <span>></span> <span>查看位置</span>
					</div>
					<div class="nav-contents">
						<form id="queryForm" name="queryForm" method="get"
							style="display: inline;">
							<div class="gridTable">
								<c:if test="${empty err }"><div id="l-map"></div></c:if>
								<c:if test="${not empty err }">${err }</c:if>
								<div id="r-result"></div>

							</div>
						</form>

						<script>
				    $(function() {
				        $("#dicTable").treetable({ expandable: true }).treetable("expandNode", 0);
				    });
				    </script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	var map = new BMap.Map("l-map");
	var point = new BMap.Point(113.33765, 23.150435);
	map.centerAndZoom(point, 15);
	


	
var point = new BMap.Point(113.33765, 23.150435);  
map.enableScrollWheelZoom();
map.centerAndZoom(point, 8);                 

	var pt = new BMap.Point(113.33765, 23.150435);
	var pt1 = new BMap.Point(113.357655, 23.170435);
	var myIcon = new BMap.Icon("car-side.png", new BMap.Size(60,38));
	var marker2 = new BMap.Marker(pt,{icon:myIcon});  
	var marker3 = new BMap.Marker(pt1,{icon:myIcon});  
	map.addOverlay(marker2);              
	map.addOverlay(marker3); 

	
	var myArray = new Array(100);            
    var x = 113.33765;
    var y = 23.150435;
	for(var i = 0;i<100;i++){
		myArray[i] = new BMap.Point(x, y);
		x=x+Math.random();
		y=y+Math.random();
		var pt = new BMap.Point(x, y);
		var myIcon = new BMap.Icon("car-side.png", new BMap.Size(60,38));
		var marker2 = new BMap.Marker(pt,{icon:myIcon}); 
		map.addOverlay(marker2); 
		 marker2.addEventListener("click",attribute);		
	
		
	}
		var polyline =  new BMap.Polyline(myArray, {strokeColor: "blue", strokeWeight: 6, strokeOpacity: 0.5}); 
		map.addOverlay(polyline);

		

	var opts = {
		  width : 200,     // 信息窗口宽度
		  height: 100,     // 信息窗口高度
		  title : "vless" , // 信息窗口标题
		  enableMessage:true,//设置允许信息窗发送短息
		  message:""
		}
		var infoWindow = new BMap.InfoWindow("地址：无锡滨湖区锦溪路国家大学科技园", opts);  // 创建信息窗口对象 
		function attribute(){ 
			//alert("1");
			var pts = new BMap.Point(113.33765, 23.150435);         
			map.openInfoWindow(infoWindow,pts); //开启信息窗口
		};
	
	

</script>