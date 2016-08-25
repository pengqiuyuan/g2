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
	var chart_a1 =  [
	                 {"day": '2015/9/1',  "newPlayer": 10},
	                 {"day": '2015/9/2',  "newPlayer": 12},
	                 {"day": '2015/9/3',  "newPlayer": 11},
	                 {"day": '2015/9/4',  "newPlayer": 15},
	                 {"day": '2015/9/5',  "newPlayer": 20},
	                 {"day": '2015/9/6',  "newPlayer": 22},
	                 {"day": '2015/9/7',  "newPlayer": 21},
	                 {"day": '2015/9/8',  "newPlayer": 25},
	                 {"day": '2015/9/9',  "newPlayer": 31},
	                 {"day": '2015/9/10', "newPlayer": 32},
	                 {"day": '2015/9/11', "newPlayer": 28},
	                 {"day": '2015/9/12', "newPlayer": 29},
	                 {"day": '2015/9/13', "newPlayer": 40},
	                 {"day": '2015/9/14', "newPlayer": 41},
	                 {"day": '2015/9/15', "newPlayer": 45},
	                 {"day": '2015/9/16', "newPlayer": 50},
	                 {"day": '2015/9/17', "newPlayer": 65},
	                 {"day": '2015/9/18', "newPlayer": 45},
	                 {"day": '2015/9/19', "newPlayer": 50},
	                 {"day": '2015/9/20', "newPlayer": 51},
	                 {"day": '2015/9/21', "newPlayer": 65},
	                 {"day": '2015/9/22', "newPlayer": 60},
	                 {"day": '2015/9/23', "newPlayer": 62},
	                 {"day": '2015/9/24', "newPlayer": 65},
	                 {"day": '2015/9/25', "newPlayer": 45},
	                 {"day": '2015/9/26', "newPlayer": 55},
	                 {"day": '2015/9/27', "newPlayer": 59},
	                 {"day": '2015/9/28', "newPlayer": 52},
	                 {"day": '2015/9/29', "newPlayer": 53},
	                 {"day": '2015/9/30', "newPlayer": 40}
	               ];
	var chart_a2 =	[
	                 {"Year": "1996", "oldPlayer": 322, "newPlayer": 242},
	                 {"Year": "1997", "oldPlayer": 324, "newPlayer": 254},
	                 {"Year": "1998", "oldPlayer": 329, "newPlayer": 226},
	                 {"Year": "1999", "oldPlayer": 342, "newPlayer": 232},
	                 {"Year": "2000", "oldPlayer": 348, "newPlayer": 268},
	                 {"Year": "2001", "oldPlayer": 334, "newPlayer": 254},
	                 {"Year": "2002", "oldPlayer": 325, "newPlayer": 235},
	                 {"Year": "2003", "oldPlayer": 316, "newPlayer": 266},
	                 {"Year": "2004", "oldPlayer": 318, "newPlayer": 288},
	                 {"Year": "2005", "oldPlayer": 330, "newPlayer": 220},
	                 {"Year": "2006", "oldPlayer": 355, "newPlayer": 215},
	                 {"Year": "2007", "oldPlayer": 366, "newPlayer": 236},
	                 {"Year": "2008", "oldPlayer": 337, "newPlayer": 247},
	                 {"Year": "2009", "oldPlayer": 352, "newPlayer": 172},
	                 {"Year": "2010", "oldPlayer": 377, "newPlayer": 37},
	                 {"Year": "2011", "oldPlayer": 383, "newPlayer": 23},
	                 {"Year": "2012", "oldPlayer": 344, "newPlayer": 34},
	                 {"Year": "2013", "oldPlayer": 366, "newPlayer": 46},
	                 {"Year": "2014", "oldPlayer": 389, "newPlayer": 59},
	                 {"Year": "2015", "oldPlayer": 334, "newPlayer": 444}
	               ];
	var chart_a3 = [
	                 {"day": '2015/9/1',  "newPlayer": 10},
	                 {"day": '2015/9/2',  "newPlayer": 12},
	                 {"day": '2015/9/3',  "newPlayer": 11},
	                 {"day": '2015/9/4',  "newPlayer": 15},
	                 {"day": '2015/9/5',  "newPlayer": 20},
	                 {"day": '2015/9/6',  "newPlayer": 22},
	                 {"day": '2015/9/7',  "newPlayer": 21},
	                 {"day": '2015/9/8',  "newPlayer": 25},
	                 {"day": '2015/9/9',  "newPlayer": 31},
	                 {"day": '2015/9/10', "newPlayer": 32},
	                 {"day": '2015/9/11', "newPlayer": 28},
	                 {"day": '2015/9/12', "newPlayer": 29},
	                 {"day": '2015/9/13', "newPlayer": 40},
	                 {"day": '2015/9/14', "newPlayer": 41},
	                 {"day": '2015/9/15', "newPlayer": 45},
	                 {"day": '2015/9/16', "newPlayer": 50},
	                 {"day": '2015/9/17', "newPlayer": 65},
	                 {"day": '2015/9/18', "newPlayer": 45},
	                 {"day": '2015/9/19', "newPlayer": 50},
	                 {"day": '2015/9/20', "newPlayer": 51},
	                 {"day": '2015/9/21', "newPlayer": 65},
	                 {"day": '2015/9/22', "newPlayer": 60},
	                 {"day": '2015/9/23', "newPlayer": 62},
	                 {"day": '2015/9/24', "newPlayer": 65},
	                 {"day": '2015/9/25', "newPlayer": 45},
	                 {"day": '2015/9/26', "newPlayer": 55},
	                 {"day": '2015/9/27', "newPlayer": 59},
	                 {"day": '2015/9/28', "newPlayer": 52},
	                 {"day": '2015/9/29', "newPlayer": 53},
	                 {"day": '2015/9/30', "newPlayer": 50}
	               ];
	var chart_a4 = [
	                 {"day": '2015/9/1',  "newPlayer": 10},
	                 {"day": '2015/9/2',  "newPlayer": 12},
	                 {"day": '2015/9/3',  "newPlayer": 11},
	                 {"day": '2015/9/4',  "newPlayer": 15},
	                 {"day": '2015/9/5',  "newPlayer": 20},
	                 {"day": '2015/9/6',  "newPlayer": 22},
	                 {"day": '2015/9/7',  "newPlayer": 21},
	                 {"day": '2015/9/8',  "newPlayer": 25},
	                 {"day": '2015/9/9',  "newPlayer": 31},
	                 {"day": '2015/9/10', "newPlayer": 32},
	                 {"day": '2015/9/11', "newPlayer": 28},
	                 {"day": '2015/9/12', "newPlayer": 29},
	                 {"day": '2015/9/13', "newPlayer": 40},
	                 {"day": '2015/9/14', "newPlayer": 41},
	                 {"day": '2015/9/15', "newPlayer": 45},
	                 {"day": '2015/9/16', "newPlayer": 50},
	                 {"day": '2015/9/17', "newPlayer": 65},
	                 {"day": '2015/9/18', "newPlayer": 45},
	                 {"day": '2015/9/19', "newPlayer": 50},
	                 {"day": '2015/9/20', "newPlayer": 51},
	                 {"day": '2015/9/21', "newPlayer": 65},
	                 {"day": '2015/9/22', "newPlayer": 60},
	                 {"day": '2015/9/23', "newPlayer": 62},
	                 {"day": '2015/9/24', "newPlayer": 65},
	                 {"day": '2015/9/25', "newPlayer": 45},
	                 {"day": '2015/9/26', "newPlayer": 55},
	                 {"day": '2015/9/27', "newPlayer": 59},
	                 {"day": '2015/9/28', "newPlayer": 52},
	                 {"day": '2015/9/29', "newPlayer": 53},
	                 {"day": '2015/9/30', "newPlayer": 60}
	               ];
	var chart_a5 = [
	                 {"day": '2015/9/1',  "newPlayer": 10},
	                 {"day": '2015/9/2',  "newPlayer": 12},
	                 {"day": '2015/9/3',  "newPlayer": 11},
	                 {"day": '2015/9/4',  "newPlayer": 15},
	                 {"day": '2015/9/5',  "newPlayer": 20},
	                 {"day": '2015/9/6',  "newPlayer": 22},
	                 {"day": '2015/9/7',  "newPlayer": 21},
	                 {"day": '2015/9/8',  "newPlayer": 25},
	                 {"day": '2015/9/9',  "newPlayer": 31},
	                 {"day": '2015/9/10', "newPlayer": 32},
	                 {"day": '2015/9/11', "newPlayer": 28},
	                 {"day": '2015/9/12', "newPlayer": 29},
	                 {"day": '2015/9/13', "newPlayer": 40},
	                 {"day": '2015/9/14', "newPlayer": 41},
	                 {"day": '2015/9/15', "newPlayer": 45},
	                 {"day": '2015/9/16', "newPlayer": 50},
	                 {"day": '2015/9/17', "newPlayer": 65},
	                 {"day": '2015/9/18', "newPlayer": 45},
	                 {"day": '2015/9/19', "newPlayer": 50},
	                 {"day": '2015/9/20', "newPlayer": 51},
	                 {"day": '2015/9/21', "newPlayer": 65},
	                 {"day": '2015/9/22', "newPlayer": 60},
	                 {"day": '2015/9/23', "newPlayer": 62},
	                 {"day": '2015/9/24', "newPlayer": 65},
	                 {"day": '2015/9/25', "newPlayer": 45},
	                 {"day": '2015/9/26', "newPlayer": 55},
	                 {"day": '2015/9/27', "newPlayer": 59},
	                 {"day": '2015/9/28', "newPlayer": 52},
	                 {"day": '2015/9/29', "newPlayer": 53},
	                 {"day": '2015/9/30', "newPlayer": 70}
	               ];
	var chart_b1 = [
	                {"month":0,"tem":7,"city":"北京"},
	                {"month":1,"tem":6.9,"city":"北京"},
	                {"month":2,"tem":9.5,"city":"北京"},
	                {"month":3,"tem":14.5,"city":"北京"},
	                {"month":4,"tem":18.2,"city":"北京"},
	                {"month":5,"tem":21.5,"city":"北京"},
	                {"month":6,"tem":25.2,"city":"北京"},
	                {"month":7,"tem":26.5,"city":"北京"},
	                {"month":8,"tem":23.3,"city":"北京"},
	                {"month":9,"tem":18.3,"city":"北京"},
	                {"month":10,"tem":13.9,"city":"北京"},
	                {"month":11,"tem":9.6,"city":"北京"},
	                {"month":0,"tem":-0.2,"city":"上海"},
	                {"month":1,"tem":0.8,"city":"上海"},
	                {"month":2,"tem":5.7,"city":"上海"},
	                {"month":3,"tem":11.3,"city":"上海"},
	                {"month":4,"tem":17,"city":"上海"},
	                {"month":5,"tem":22,"city":"上海"},
	                {"month":6,"tem":24.8,"city":"上海"},
	                {"month":7,"tem":24.1,"city":"上海"},
	                {"month":8,"tem":20.1,"city":"上海"},
	                {"month":9,"tem":14.1,"city":"上海"},
	                {"month":10,"tem":8.6,"city":"上海"},
	                {"month":11,"tem":2.5,"city":"上海"},
	                {"month":0,"tem":-0.9,"city":"深圳"},
	                {"month":1,"tem":0.6,"city":"深圳"},
	                {"month":2,"tem":3.5,"city":"深圳"},
	                {"month":3,"tem":8.4,"city":"深圳"},
	                {"month":4,"tem":13.5,"city":"深圳"},
	                {"month":5,"tem":17,"city":"深圳"},
	                {"month":6,"tem":18.6,"city":"深圳"},
	                {"month":7,"tem":17.9,"city":"深圳"},
	                {"month":8,"tem":14.3,"city":"深圳"},
	                {"month":9,"tem":9,"city":"深圳"},
	                {"month":10,"tem":3.9,"city":"深圳"},
	                {"month":11,"tem":1,"city":"深圳"},
	                {"month":0,"tem":3.9,"city":"杭州"},
	                {"month":1,"tem":4.2,"city":"杭州"},
	                {"month":2,"tem":5.7,"city":"杭州"},
	                {"month":3,"tem":8.5,"city":"杭州"},
	                {"month":4,"tem":11.9,"city":"杭州"},
	                {"month":5,"tem":15.2,"city":"杭州"},
	                {"month":6,"tem":17.0,"city":"杭州"},
	                {"month":7,"tem":16.6,"city":"杭州"},
	                {"month":8,"tem":14.2,"city":"杭州"},
	                {"month":9,"tem":10.3,"city":"杭州"},
	                {"month":10,"tem":6.6,"city":"杭州"},
	                {"month":11,"tem":4.8,"city":"杭州"}
	            ];
	var chart_c1 = [{"province":'北京市2', "population":19612368},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
                    {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
                    {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
	
	var chart_c2 = [{"type":"series1","x":1732.8871544450521,"y":-80.75603982433677},{"type":"series2","x":1546.589955687523,"y":282.97513956204057},{"type":"series3","x":742.7253536880016,"y":479.4877045787871},{"type":"series4","x":772.9451237246394,"y":-407.76275377720594},{"type":"series1","x":1359.810951165855,"y":297.2723776474595},{"type":"series2","x":650.068512186408,"y":-129.5293727889657},{"type":"series3","x":1730.0641294568777,"y":-240.9555669873953},{"type":"series4","x":502.4238293990493,"y":-342.1307345852256},{"type":"series1","x":1582.250035367906,"y":-45.05145130679011},{"type":"series2","x":1829.3536202982068,"y":-113.36682550609112},{"type":"series3","x":1572.7724805474281,"y":115.85489613935351},{"type":"series4","x":1887.0485508814454,"y":6.104619242250919},{"type":"series1","x":882.0341778919101,"y":401.86547581106424},{"type":"series2","x":1620.0402630493045,"y":267.45478762313724},{"type":"series3","x":1925.4421964287758,"y":369.47823595255613},{"type":"series4","x":1611.9598066434264,"y":-234.8197065293789},{"type":"series1","x":1720.9005448967218,"y":-115.85958395153284},{"type":"series2","x":1862.451889552176,"y":-248.42322198674083},{"type":"series3","x":1283.97127520293,"y":325.95419557765126},{"type":"series4","x":1869.39731054008,"y":383.6600771173835},{"type":"series1","x":1988.1872748956084,"y":-216.48837719112635},{"type":"series2","x":1187.2317604720592,"y":404.27824622020125},{"type":"series3","x":1571.8251904472709,"y":-96.22862562537193},{"type":"series4","x":1826.7804672941566,"y":-477.26183850318193},{"type":"series1","x":1177.1034905686975,"y":-112.32297029346228},{"type":"series2","x":1195.6303780898452,"y":448.2225668616593},{"type":"series3","x":1955.4035440087318,"y":21.227966528385878},{"type":"series4","x":1732.739924453199,"y":368.81575733423233},{"type":"series1","x":806.2865408137441,"y":385.1917199790478},{"type":"series2","x":1556.4921544864774,"y":-420.2395495958626},{"type":"series3","x":1181.5953878685832,"y":-277.57429890334606},{"type":"series4","x":1269.245852716267,"y":242.08716116845608},{"type":"series1","x":1219.9176428839564,"y":346.6071574948728},{"type":"series2","x":746.3413281366229,"y":-89.49963096529245},{"type":"series3","x":432.45446030050516,"y":441.71203626319766},{"type":"series4","x":777.959868311882,"y":66.79431581869721},{"type":"series1","x":918.3598393574357,"y":448.46232794225216},{"type":"series2","x":1436.13195233047,"y":184.53770177438855},{"type":"series3","x":1119.1939394921064,"y":-312.59450083598495},{"type":"series4","x":1998.3739340677857,"y":5.358115769922733},{"type":"series1","x":1069.4813169538975,"y":-106.57294746488333},{"type":"series2","x":275.5963373929262,"y":205.64519427716732},{"type":"series3","x":801.038783043623,"y":7.43780517950654},{"type":"series4","x":213.5445298627019,"y":288.95508078858256},{"type":"series1","x":1697.732014581561,"y":-495.7758020609617},{"type":"series2","x":1940.3524557128549,"y":57.93372122570872},{"type":"series3","x":1365.2942385524511,"y":246.1609710007906},{"type":"series4","x":986.5696644410491,"y":248.502679169178},{"type":"series1","x":1991.1393811926246,"y":-269.05048871412873},{"type":"series2","x":1244.1082932054996,"y":378.08641185984015},{"type":"series3","x":958.6482960730791,"y":-222.58463921025395},{"type":"series4","x":1939.0085907652974,"y":-415.7125297933817},{"type":"series1","x":1097.460888326168,"y":298.815727699548},{"type":"series2","x":1132.0891315117478,"y":-409.8006417043507},{"type":"series3","x":934.7271472215652,"y":78.89576349407434},{"type":"series4","x":632.7374717220664,"y":240.34222541376948},{"type":"series1","x":25.66775120794773,"y":386.65700424462557},{"type":"series2","x":1791.440169326961,"y":-98.93955988809466},{"type":"series3","x":1391.1143569275737,"y":46.02528735995293},{"type":"series4","x":538.8829139992595,"y":-428.8868750445545},{"type":"series1","x":933.5943283513188,"y":327.7888190932572},{"type":"series2","x":1381.4812870696187,"y":-36.58548276871443},{"type":"series3","x":152.31592673808336,"y":-233.14770916476846},{"type":"series4","x":90.16109630465508,"y":-45.90578889474273},{"type":"series1","x":1855.3984118625522,"y":234.1356431134045},{"type":"series2","x":889.7370044142008,"y":-261.737990193069},{"type":"series3","x":344.61341612040997,"y":-13.636548072099686},{"type":"series4","x":588.4585017338395,"y":-5.226874258369207},{"type":"series1","x":1714.1733933240175,"y":-204.88095516338944},{"type":"series2","x":905.8979945257306,"y":-326.66328828781843},{"type":"series3","x":179.5906499028206,"y":-468.77168817445636},{"type":"series4","x":472.5130721926689,"y":-1.9495864398777485},{"type":"series1","x":1275.0087166205049,"y":29.06017890200019},{"type":"series2","x":262.88699731230736,"y":496.59054493531585},{"type":"series3","x":44.90217100828886,"y":-441.4119469001889},{"type":"series4","x":1782.4337324127555,"y":-269.77423299103975},{"type":"series1","x":748.8169632852077,"y":336.41374530270696},{"type":"series2","x":1684.0793499723077,"y":-123.5110298730433},{"type":"series3","x":1109.3289218842983,"y":423.3962232246995},{"type":"series4","x":354.1235653683543,"y":-307.66808334738016},{"type":"series1","x":1329.577681608498,"y":470.3424177132547},{"type":"series2","x":273.0302046984434,"y":-147.08185475319624},{"type":"series3","x":1873.354759067297,"y":415.8988082781434},{"type":"series4","x":1152.5639267638326,"y":-228.8104579783976},{"type":"series1","x":480.6276988238096,"y":-168.55818405747414},{"type":"series2","x":724.2633355781436,"y":-137.24337238818407},{"type":"series3","x":879.4547133147717,"y":-114.34462806209922},{"type":"series4","x":988.7294666841626,"y":-206.20282599702477},{"type":"series1","x":1954.3535728007555,"y":214.61118385195732},{"type":"series2","x":851.2419117614627,"y":420.7796682603657},{"type":"series3","x":953.703748062253,"y":89.70340387895703},{"type":"series4","x":61.40255834907293,"y":-160.9144126996398},{"type":"series1","x":1207.9351842403412,"y":386.9934994727373},{"type":"series2","x":1142.1515522524714,"y":279.29873764514923},{"type":"series3","x":1069.3543190136552,"y":239.56217663362622},{"type":"series4","x":1898.9934483543038,"y":341.7890924029052},{"type":"series1","x":736.7067560553551,"y":-414.1982044093311},{"type":"series2","x":1718.982090242207,"y":83.44200439751148},{"type":"series3","x":814.3314002081752,"y":-484.1634132899344},{"type":"series4","x":346.93830739706755,"y":150.88692586869}];

	var chart_d1 = [{"province":'北京市1', "population":19612368},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
	                        {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
	                        {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
	//---------------------- chart_a1 ----------------

	var Stat = G2.Stat;
	var chart = new G2.Chart({
		id : 'chart_a1',
		width : 1000,
		height : 375
	});
	chart.source(chart_a1);
	chart.col('day', {
		type : 'timeCat',
		tickCount : 11,
		nice : false,
		mask : 'yyyy/m/d',
		alias : '日期'
	});
	chart.col('newPlayer', {
		alias : '新增用户',
		formatter : function(val) {
			return val + ' 位';
		}
	});
	chart.tooltip({
		crosshairs : true
	});
	chart.area().position('day*newPlayer');
	chart.line().position('day*newPlayer').size(0);
	chart.render();
	//---------------------- chart_a1 ----------------

	//---------------------- chart_a2 ----------------

	var Stat = G2.Stat;
	var Frame = G2.Frame;
	var frame = new Frame(chart_a2);
	frame = Frame.combinColumns(frame, [ 'oldPlayer', 'newPlayer' ],
			'Profit', '用户分类', 'Year');
	var chart = new G2.Chart({
		id : 'chart_a2',
		width : 1000,
		height : 375
	});
	chart.source(frame, {
		'Profit' : {
			alias : '活跃用户',
			formatter : function(val) {
				return val + 'k';
			}
		}
	});
	chart.tooltip({
		crosshairs : true
	});
	chart.area().position('Year*Profit').color('用户分类');
	chart.line().position('Year*Profit').color('用户分类').size(0);
	chart.render();
	//---------------------- chart_a2 ----------------

	//---------------------- chart_a3 ----------------

	var Stat = G2.Stat;
	var chart = new G2.Chart({
		id : 'chart_a3',
		width : 1000,
		height : 375
	});
	chart.source(chart_a3);
	chart.col('day', {
		type : 'timeCat',
		tickCount : 11,
		nice : false,
		mask : 'yyyy/m/d',
		alias : '日期'
	});
	chart.col('newPlayer', {
		alias : '平均使用时长',
		formatter : function(val) {
			return val + ' s';
		}
	});
	chart.tooltip({
		crosshairs : true
	});
	chart.area().position('day*newPlayer');
	chart.line().position('day*newPlayer').size(0);
	chart.render();
	//---------------------- chart_a3 ----------------
		
	//---------------------- chart_a4 ----------------

	var Stat = G2.Stat;
	var chart = new G2.Chart({
		id : 'chart_a4',
		width : 1000,
		height : 375
	});
	chart.source(chart_a4);
	chart.col('day', {
		type : 'timeCat',
		tickCount : 11,
		nice : false,
		mask : 'yyyy/m/d',
		alias : '日期'
	});
	chart.col('newPlayer', {
		alias : '启动次数',
		formatter : function(val) {
			return val + ' 次';
		}
	});
	chart.tooltip({
		crosshairs : true
	});
	chart.area().position('day*newPlayer');
	chart.line().position('day*newPlayer').size(0);
	chart.render();
	//---------------------- chart_a4 ----------------		

	//---------------------- chart_a5 ----------------

	var Stat = G2.Stat;
	var chart = new G2.Chart({
		id : 'chart_a5',
		width : 1000,
		height : 375
	});
	chart.source(chart_a5);
	chart.col('day', {
		type : 'timeCat',
		tickCount : 11,
		nice : false,
		mask : 'yyyy/m/d',
		alias : '日期'
	});
	chart.col('newPlayer', {
		alias : '累计用户',
		formatter : function(val) {
			return val + ' 位';
		}
	});
	chart.tooltip({
		crosshairs : true
	});
	chart.area().position('day*newPlayer');
	chart.line().position('day*newPlayer').size(0);
	chart.render();
	//---------------------- chart_a5 ----------------
	
	//---------------------- chart_b1 ----------------
	var chart = new G2.Chart({
		id : 'chart_b1',
		width : 800,
		height : 375
	});
	var defs = {
		'month' : {
			type : 'cat',
			values : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月',
					'十月', '十一月', '十二月' ]
		}
	};
	chart.source(chart_b1, defs);
	chart.line().position('month*tem').color('city').shape('dot').size(3);
	chart.render();
	//---------------------- chart_b1 ----------------

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
		chart.guide().text([ index + 0.3, 1000000 ], '人数：' + obj.population, {
			'text-anchor' : 'start'
		});
	});
	chart.render();
	//---------------------- chart_c1 ----------------

	//---------------------- chart_c2 ----------------
	var chart = new G2.Chart({
		id : 'chart_c2',
		width : 1000,
		height : 500
	});
	chart.source(chart_c2, {
		x : {
			tickCount : 8
		}
	});
	chart.point().position('x*y').color('type').shape('type',
			[ 'circle', 'triangle-down', 'square', 'diamond' ]).size(6);
	// 添加辅助元素
	chart.guide().text([ 250, 550 ], '0 - 500', {
		'font-size' : '15px'
	});
	chart.guide().text([ 1000, 550 ], '500 - 1500', {
		'font-size' : '15px'
	});
	chart.guide().text([ 1700, 550 ], '1500 - 2000', {
		'font-size' : '15px'
	});
	chart.guide().rect([ 0, -600 ], [ 500, 600 ]);
	chart.guide().rect([ 500, -600 ], [ 1500, 600 ], {
		'fill-opacity' : 0.2
	});
	chart.guide().rect([ 1500, -600 ], [ 2000, 600 ], {
		'fill-opacity' : 0.3
	});
	chart.render();
	//---------------------- chart_c2 ----------------
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
		chart.guide().text([ index + 0.3, 1000000 ], '人数：' + obj.population, {
			'text-anchor' : 'start'
		});
	});
	chart.render();
	//---------------------- chart_d1 ----------------
</script>
