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
		var chart_d1 = [{"province":'北京市1', "population":19612368},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
		                        {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
		                        {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
		var chart_c1 = [{"province":'北京市1', "population":88888888},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
		                        {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
		                        {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
		//---------------------- chart_c1 ----------------
		var Stat = G2.Stat;
		var Frame = G2.Frame;
		var frame = new Frame(chart_c1);
		frame = Frame.sort(frame, 'population'); // 将数据按照population 进行排序，由大到小
		var chart = new G2.Chart({
			id : 'chart_c1',
			width : 1000,
			height : 500,
			plotCfg : {
				margin : [ 20, 120, 80 ]
			}
		});
		chart.source(frame);
		chart.axis('province', {
			title : null
		});
		chart.coord('rect').transpose();
		chart.interval().position('province*population').color('province');
		// 使用 chart.guide() 展示文本
		frame.each(function(obj, index) {
			chart.guide().text([ index + 0.3, 1000000 ],
					'人数：' + obj.population, {
						'text-anchor' : 'start'
					});
		});
		chart.render();
		//---------------------- chart_c1 ----------------
		
		//---------------------- chart_d1 ----------------
		var Stat = G2.Stat;
		var Frame = G2.Frame;
		var frame = new Frame(chart_d1);
		frame = Frame.sort(frame, 'population'); // 将数据按照population 进行排序，由大到小
		var chart = new G2.Chart({
			id : 'chart_d1',
			width : 1000,
			height : 500,
			plotCfg : {
				margin : [ 20, 120, 80 ]
			}
		});
		chart.source(frame);
		chart.axis('province', {
			title : null
		});
		chart.coord('rect').transpose();
		chart.interval().position('province*population').color('province');
		// 使用 chart.guide() 展示文本
		frame.each(function(obj, index) {
			chart.guide().text([ index + 0.3, 1000000 ],
					'人数：' + obj.population, {
						'text-anchor' : 'start'
					});
		});
		chart.render();
		//---------------------- chart_d1 ----------------
	</script>
