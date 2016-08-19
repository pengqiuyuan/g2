<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="huake" uri="/huake"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

	<script type="text/javascript">
		// G2 对数据源格式的要求，仅仅是 JSON 数组，数组的每个元素是一个标准 JSON 对象。
		// Step 1: 创建 Chart 对象
		var c_top_platform_1 = [{"province":'北京市1', "population":19612368},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
		                        {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
		                        {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
		var c_top_area_1 = [{"province":'北京市1', "population":19612368},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
		                        {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
		                        {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
		//---------------------- c_top_area_1 ----------------
		var Stat = G2.Stat;
		var Frame = G2.Frame;
		var frame = new Frame(c_top_area_1);
		frame = Frame.sort(frame, 'population'); // 将数据按照population 进行排序，由大到小
		var c_top_area_1 = new G2.Chart({
			id : 'c_top_area_1',
			width : 1000,
			height : 500,
			plotCfg : {
				margin : [ 20, 120, 80 ]
			}
		});
		c_top_area_1.source(frame);
		c_top_area_1.axis('province', {
			title : null
		});
		c_top_area_1.coord('rect').transpose();
		c_top_area_1.interval().position('province*population').color('province');
		// 使用 chart.guide() 展示文本
		frame.each(function(obj, index) {
			c_top_area_1.guide().text([ index + 0.3, 1000000 ],
					'人数：' + obj.population, {
						'text-anchor' : 'start'
					});
		});
		c_top_area_1.render();
		//---------------------- c_top_area_1 ----------------
		
		//---------------------- c_top_platform_1 ----------------
		var Stat = G2.Stat;
		var Frame = G2.Frame;
		var frame = new Frame(c_top_platform_1);
		frame = Frame.sort(frame, 'population'); // 将数据按照population 进行排序，由大到小
		var c_top_platform_1 = new G2.Chart({
			id : 'c_top_platform_1',
			width : 1000,
			height : 500,
			plotCfg : {
				margin : [ 20, 120, 80 ]
			}
		});
		c_top_platform_1.source(frame);
		c_top_platform_1.axis('province', {
			title : null
		});
		c_top_platform_1.coord('rect').transpose();
		c_top_platform_1.interval().position('province*population').color('province');
		// 使用 chart.guide() 展示文本
		frame.each(function(obj, index) {
			c_top_platform_1.guide().text([ index + 0.3, 1000000 ],
					'人数：' + obj.population, {
						'text-anchor' : 'start'
					});
		});
		c_top_platform_1.render();
		//---------------------- c_top_platform_1 ----------------
	</script>
