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
	var chart_a1 = ${c_30_newuser}; 
	var chart_a2 = ${c_30_activeuser};
	var chart_b1 = ${c_timeframe_newuser};
	var chart_c1 = ${c_top_area_1};
	var chart_d1 = [{"province":'北京市1', "population":19612368},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
	                        {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
	                        {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
	//---------------------- c_30_newuser ----------------
	var chart = new G2.Chart({
		id : 'chart_a1', // 指定图表容器 ID
		width : 800, // 指定图表宽度
		height : 375
	// 指定图表高度
	});
	// Step 2: 载入数据源
	chart.source(chart_a1, {
		genre : {
			alias : '游戏种类' // 列定义，定义该属性显示的别名
		},
		sold : {
			alias : '销售量'
		}
	});
	// Step 3：创建图形语法，绘制柱状图，由 genre 和 sold 两个属性决定图形位置，genre 映射至 x 轴，sold 映射至 y 轴
	chart.interval().position('genre*sold').color('genre')
	// Step 4: 渲染图表
	chart.render();
	//---------------------- c_30_newuser ----------------
	
	//---------------------- c_30_activeuser ----------------
	var chart = new G2.Chart({
		id : 'chart_a2',
		width : 800,
		height : 375
	});
	chart.source(chart_a2, {
		'LifeExpectancy' : {
			alias : '人均寿命（年）'
		},
		'Population' : {
			type : 'pow',
			alias : '人口总数'
		},
		'GDP' : {
			alias : '人均国内生产总值($)',
			tickCount : 10
		},
		'Country' : {
			alias : '国家/地区'
		}
	});
	chart.axis('GDP', {
		// 格式化坐标轴的显示
		formatter : function(value) {
			return (value / 1000).toFixed(0) + 'k';
		}
	});
	chart.tooltip({
		title : null
	// 不显示默认标题
	});
	chart.legend('Population', false);
	chart.legend('Country', false);
	chart.point().position('GDP*LifeExpectancy').size('Population', 35, 5)
			.color('continent').opacity(0.65).shape('circle').tooltip(
					'Country*Population*GDP*LifeExpectancy');
	chart.render();
	//---------------------- c_30_activeuser ----------------
	
	//---------------------- c_timeframe_newuser ----------------
	var chart = new G2.Chart({
		id : 'chart_b1',
		width : 800,
		height : 375
	});
	var defs = {
		'month' : {
			type : 'cat',
			values : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月',
					'九月', '十月', '十一月', '十二月' ]
		}
	};
	chart.source(chart_b1, defs);
	chart.line().position('month*tem').color('city').shape('dot').size(3);
	chart.render();
	//---------------------- c_timeframe_newuser ----------------

	//---------------------- c_top_area_1 ----------------
    var Stat = G2.Stat;
    var Frame = G2.Frame;
    var frame = new Frame(chart_c1);
    frame = Frame.sort(frame, 'population'); // 将数据按照population 进行排序，由大到小
    var chart = new G2.Chart({
        id : 'chart_c1',
        width : 800,
        height : 500,
        plotCfg: {
          margin: [20, 60, 80, 120]
        }
    });
    chart.source(frame);
    chart.axis('province',{
      title: null
    });
    chart.coord('rect').transpose();
    chart.interval().position('province*population');
    chart.render();		
	//---------------------- c_top_area_1 ----------------
	
	//---------------------- c_top_platform_1 ----------------
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
	//---------------------- c_top_platform_1 ----------------
	
</script>
