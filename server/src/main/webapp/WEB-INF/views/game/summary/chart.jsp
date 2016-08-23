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
	var chart_a1 =         [{"genre": "Sports","sold": 275}, {"genre": "Strategy","sold": 115 },{"genre": "Action", "sold": 120},{"genre": "Shooter","sold": 350}, {"genre": "Other", "sold": 150}, {"genre": "Test", "sold": 120}]; 
	var chart_a2 =         [{"continent":"Africa","Country":"Algeria","LifeExpectancy":72.301,"GDP":6223.367465,"Population":33333216},{"continent":"Africa","Country":"Angola","LifeExpectancy":42.731,"GDP":4797.231267,"Population":12420476},{"continent":"Africa","Country":"Benin","LifeExpectancy":56.728,"GDP":1441.284873,"Population":8078314},{"continent":"Africa","Country":"Botswana","LifeExpectancy":50.728,"GDP":12569.85177,"Population":1639131},{"continent":"Africa","Country":"Burkina Faso","LifeExpectancy":52.295,"GDP":1217.032994,"Population":14326203},{"continent":"Africa","Country":"Burundi","LifeExpectancy":49.58,"GDP":430.0706916,"Population":8390505},{"continent":"Africa","Country":"Cameroon","LifeExpectancy":50.43,"GDP":2042.09524,"Population":17696293},{"continent":"Africa","Country":"Central African Republic","LifeExpectancy":44.741,"GDP":706.016537,"Population":4369038},{"continent":"Africa","Country":"Chad","LifeExpectancy":50.651,"GDP":1704.063724,"Population":10238807},{"continent":"Africa","Country":"Comoros","LifeExpectancy":65.152,"GDP":986.1478792,"Population":710960},{"continent":"Africa","Country":"Congo, Dem. Rep.","LifeExpectancy":46.462,"GDP":277.5518587,"Population":64606759},{"continent":"Africa","Country":"Congo, Rep.","LifeExpectancy":55.322,"GDP":3632.557798,"Population":3800610},{"continent":"Africa","Country":"Cote d'Ivoire","LifeExpectancy":48.328,"GDP":1544.750112,"Population":18013409},{"continent":"Africa","Country":"Djibouti","LifeExpectancy":54.791,"GDP":2082.481567,"Population":496374},{"continent":"Africa","Country":"Egypt","LifeExpectancy":71.338,"GDP":5581.180998,"Population":80264543},{"continent":"Africa","Country":"Equatorial Guinea","LifeExpectancy":51.579,"GDP":12154.08975,"Population":551201},{"continent":"Africa","Country":"Eritrea","LifeExpectancy":58.04,"GDP":641.3695236,"Population":4906585},{"continent":"Africa","Country":"Ethiopia","LifeExpectancy":52.947,"GDP":690.8055759,"Population":76511887},{"continent":"Africa","Country":"Gabon","LifeExpectancy":56.735,"GDP":13206.48452,"Population":1454867},{"continent":"Africa","Country":"Gambia","LifeExpectancy":59.448,"GDP":752.7497265,"Population":1688359},{"continent":"Africa","Country":"Ghana","LifeExpectancy":60.022,"GDP":1327.60891,"Population":22873338},{"continent":"Africa","Country":"Guinea","LifeExpectancy":56.007,"GDP":942.6542111,"Population":9947814},{"continent":"Africa","Country":"Guinea-Bissau","LifeExpectancy":46.388,"GDP":579.231743,"Population":1472041},{"continent":"Africa","Country":"Kenya","LifeExpectancy":54.11,"GDP":1463.249282,"Population":35610177},{"continent":"Africa","Country":"Lesotho","LifeExpectancy":42.592,"GDP":1569.331442,"Population":2012649},{"continent":"Africa","Country":"Liberia","LifeExpectancy":45.678,"GDP":414.5073415,"Population":3193942},{"continent":"Africa","Country":"Libya","LifeExpectancy":73.952,"GDP":12057.49928,"Population":6036914},{"continent":"Africa","Country":"Madagascar","LifeExpectancy":59.443,"GDP":1044.770126,"Population":19167654},{"continent":"Africa","Country":"Malawi","LifeExpectancy":48.303,"GDP":759.3499101,"Population":13327079},{"continent":"Africa","Country":"Mali","LifeExpectancy":54.467,"GDP":1042.581557,"Population":12031795},{"continent":"Africa","Country":"Mauritania","LifeExpectancy":64.164,"GDP":1803.151496,"Population":3270065},{"continent":"Africa","Country":"Mauritius","LifeExpectancy":72.801,"GDP":10956.99112,"Population":1250882},{"continent":"Africa","Country":"Morocco","LifeExpectancy":71.164,"GDP":3820.17523,"Population":33757175},{"continent":"Africa","Country":"Mozambique","LifeExpectancy":42.082,"GDP":823.6856205,"Population":19951656},{"continent":"Africa","Country":"Namibia","LifeExpectancy":52.906,"GDP":4811.060429,"Population":2055080},{"continent":"Africa","Country":"Niger","LifeExpectancy":56.867,"GDP":619.6768924,"Population":12894865},{"continent":"Africa","Country":"Nigeria","LifeExpectancy":46.859,"GDP":2013.977305,"Population":135031164},{"continent":"Africa","Country":"Reunion","LifeExpectancy":76.442,"GDP":7670.122558,"Population":798094},{"continent":"Africa","Country":"Rwanda","LifeExpectancy":46.242,"GDP":863.0884639,"Population":8860588},{"continent":"Africa","Country":"Sao Tome and Principe","LifeExpectancy":65.528,"GDP":1598.435089,"Population":199579},{"continent":"Africa","Country":"Senegal","LifeExpectancy":63.062,"GDP":1712.472136,"Population":12267493},{"continent":"Africa","Country":"Sierra Leone","LifeExpectancy":42.568,"GDP":862.5407561,"Population":6144562},{"continent":"Africa","Country":"Somalia","LifeExpectancy":48.159,"GDP":926.1410683,"Population":9118773},{"continent":"Africa","Country":"South Africa","LifeExpectancy":49.339,"GDP":9269.657808,"Population":43997828},{"continent":"Africa","Country":"Sudan","LifeExpectancy":58.556,"GDP":2602.394995,"Population":42292929},{"continent":"Africa","Country":"Swaziland","LifeExpectancy":39.613,"GDP":4513.480643,"Population":1133066},{"continent":"Africa","Country":"Tanzania","LifeExpectancy":52.517,"GDP":1107.482182,"Population":38139640},{"continent":"Africa","Country":"Togo","LifeExpectancy":58.42,"GDP":882.9699438,"Population":5701579},{"continent":"Africa","Country":"Tunisia","LifeExpectancy":73.923,"GDP":7092.923025,"Population":10276158},{"continent":"Africa","Country":"Uganda","LifeExpectancy":51.542,"GDP":1056.380121,"Population":29170398},{"continent":"Africa","Country":"Zambia","LifeExpectancy":42.384,"GDP":1271.211593,"Population":11746035},{"continent":"Africa","Country":"Zimbabwe","LifeExpectancy":43.487,"GDP":469.7092981,"Population":12311143},{"continent":"Americas","Country":"Argentina","LifeExpectancy":75.32,"GDP":12779.37964,"Population":40301927},{"continent":"Americas","Country":"Bolivia","LifeExpectancy":65.554,"GDP":3822.137084,"Population":9119152},{"continent":"Americas","Country":"Brazil","LifeExpectancy":72.39,"GDP":9065.800825,"Population":190010647},{"continent":"Americas","Country":"Canada","LifeExpectancy":80.653,"GDP":36319.23501,"Population":33390141},{"continent":"Americas","Country":"Chile","LifeExpectancy":78.553,"GDP":13171.63885,"Population":16284741},{"continent":"Americas","Country":"Colombia","LifeExpectancy":72.889,"GDP":7006.580419,"Population":44227550},{"continent":"Americas","Country":"Costa Rica","LifeExpectancy":78.782,"GDP":9645.06142,"Population":4133884},{"continent":"Americas","Country":"Cuba","LifeExpectancy":78.273,"GDP":8948.102923,"Population":11416987},{"continent":"Americas","Country":"Dominican Republic","LifeExpectancy":72.235,"GDP":6025.374752,"Population":9319622},{"continent":"Americas","Country":"Ecuador","LifeExpectancy":74.994,"GDP":6873.262326,"Population":13755680},{"continent":"Americas","Country":"El Salvador","LifeExpectancy":71.878,"GDP":5728.353514,"Population":6939688},{"continent":"Americas","Country":"Guatemala","LifeExpectancy":70.259,"GDP":5186.050003,"Population":12572928},{"continent":"Americas","Country":"Haiti","LifeExpectancy":60.916,"GDP":1201.637154,"Population":8502814},{"continent":"Americas","Country":"Honduras","LifeExpectancy":70.198,"GDP":3548.330846,"Population":7483763},{"continent":"Americas","Country":"Jamaica","LifeExpectancy":72.567,"GDP":7320.880262,"Population":2780132},{"continent":"Americas","Country":"Mexico","LifeExpectancy":76.195,"GDP":11977.57496,"Population":108700891},{"continent":"Americas","Country":"Nicaragua","LifeExpectancy":72.899,"GDP":2749.320965,"Population":5675356},{"continent":"Americas","Country":"Panama","LifeExpectancy":75.537,"GDP":9809.185636,"Population":3242173},{"continent":"Americas","Country":"Paraguay","LifeExpectancy":71.752,"GDP":4172.838464,"Population":6667147},{"continent":"Americas","Country":"Peru","LifeExpectancy":71.421,"GDP":7408.905561,"Population":28674757},{"continent":"Americas","Country":"Puerto Rico","LifeExpectancy":78.746,"GDP":19328.70901,"Population":3942491},{"continent":"Americas","Country":"Trinidad and Tobago","LifeExpectancy":69.819,"GDP":18008.50924,"Population":1056608},{"continent":"Americas","Country":"United States","LifeExpectancy":78.242,"GDP":42951.65309,"Population":301139947},{"continent":"Americas","Country":"Uruguay","LifeExpectancy":76.384,"GDP":10611.46299,"Population":3447496},{"continent":"Americas","Country":"Venezuela","LifeExpectancy":73.747,"GDP":11415.80569,"Population":26084662},{"continent":"Asia","Country":"Afghanistan","LifeExpectancy":43.828,"GDP":974.5803384,"Population":31889923},{"continent":"Asia","Country":"Bahrain","LifeExpectancy":75.635,"GDP":29796.04834,"Population":708573},{"continent":"Asia","Country":"Bangladesh","LifeExpectancy":64.062,"GDP":1391.253792,"Population":150448339},{"continent":"Asia","Country":"Cambodia","LifeExpectancy":59.723,"GDP":1713.778686,"Population":14131858},{"continent":"Asia","Country":"China","LifeExpectancy":72.961,"GDP":4959.114854,"Population":1318683096},{"continent":"Asia","Country":"India","LifeExpectancy":64.698,"GDP":2452.210407,"Population":1110396331},{"continent":"Asia","Country":"Indonesia","LifeExpectancy":70.65,"GDP":3540.651564,"Population":223547000},{"continent":"Asia","Country":"Iran","LifeExpectancy":70.964,"GDP":11605.71449,"Population":69453570},{"continent":"Asia","Country":"Iraq","LifeExpectancy":59.545,"GDP":4471.061906,"Population":27499638},{"continent":"Asia","Country":"Israel","LifeExpectancy":80.745,"GDP":25523.2771,"Population":6426679},{"continent":"Asia","Country":"Japan","LifeExpectancy":82.603,"GDP":31656.06806,"Population":127467972},{"continent":"Asia","Country":"Jordan","LifeExpectancy":72.535,"GDP":4519.461171,"Population":6053193},{"continent":"Asia","Country":"Korea, Dem. Rep.","LifeExpectancy":67.297,"GDP":1593.06548,"Population":23301725},{"continent":"Asia","Country":"Korea, Rep.","LifeExpectancy":78.623,"GDP":23348.13973,"Population":49044790},{"continent":"Asia","Country":"Lebanon","LifeExpectancy":71.993,"GDP":10461.05868,"Population":3921278},{"continent":"Asia","Country":"Malaysia","LifeExpectancy":74.241,"GDP":12451.6558,"Population":24821286},{"continent":"Asia","Country":"Mongolia","LifeExpectancy":66.803,"GDP":3095.772271,"Population":2874127},{"continent":"Asia","Country":"Myanmar","LifeExpectancy":62.069,"GDP":944,"Population":47761980},{"continent":"Asia","Country":"Nepal","LifeExpectancy":63.785,"GDP":1091.359778,"Population":28901790},{"continent":"Asia","Country":"Oman","LifeExpectancy":75.64,"GDP":22316.19287,"Population":3204897},{"continent":"Asia","Country":"Pakistan","LifeExpectancy":65.483,"GDP":2605.94758,"Population":169270617},{"continent":"Asia","Country":"Philippines","LifeExpectancy":71.688,"GDP":3190.481016,"Population":91077287},{"continent":"Asia","Country":"Saudi Arabia","LifeExpectancy":72.777,"GDP":21654.83194,"Population":27601038},{"continent":"Asia","Country":"Singapore","LifeExpectancy":79.972,"GDP":47143.17964,"Population":4553009},{"continent":"Asia","Country":"Sri Lanka","LifeExpectancy":72.396,"GDP":3970.095407,"Population":20378239},{"continent":"Asia","Country":"Syria","LifeExpectancy":74.143,"GDP":4184.548089,"Population":19314747},{"continent":"Asia","Country":"Thailand","LifeExpectancy":70.616,"GDP":7458.396327,"Population":65068149},{"continent":"Asia","Country":"Vietnam","LifeExpectancy":74.249,"GDP":2441.576404,"Population":85262356},{"continent":"Asia","Country":"West Bank and Gaza","LifeExpectancy":73.422,"GDP":3025.349798,"Population":4018332},{"continent":"Asia","Country":"Yemen, Rep.","LifeExpectancy":62.698,"GDP":2280.769906,"Population":22211743},{"continent":"Europe","Country":"Albania","LifeExpectancy":76.423,"GDP":5937.029526,"Population":3600523},{"continent":"Europe","Country":"Austria","LifeExpectancy":79.829,"GDP":36126.4927,"Population":8199783},{"continent":"Europe","Country":"Belgium","LifeExpectancy":79.441,"GDP":33692.60508,"Population":10392226},{"continent":"Europe","Country":"Bosnia and Herzegovina","LifeExpectancy":74.852,"GDP":7446.298803,"Population":4552198},{"continent":"Europe","Country":"Bulgaria","LifeExpectancy":73.005,"GDP":10680.79282,"Population":7322858},{"continent":"Europe","Country":"Croatia","LifeExpectancy":75.748,"GDP":14619.22272,"Population":4493312},{"continent":"Europe","Country":"Czech Republic","LifeExpectancy":76.486,"GDP":22833.30851,"Population":10228744},{"continent":"Europe","Country":"Denmark","LifeExpectancy":78.332,"GDP":35278.41874,"Population":5468120},{"continent":"Europe","Country":"Finland","LifeExpectancy":79.313,"GDP":33207.0844,"Population":5238460},{"continent":"Europe","Country":"France","LifeExpectancy":80.657,"GDP":30470.0167,"Population":61083916},{"continent":"Europe","Country":"Germany","LifeExpectancy":79.406,"GDP":32170.37442,"Population":82400996},{"continent":"Europe","Country":"Greece","LifeExpectancy":79.483,"GDP":27538.41188,"Population":10706290},{"continent":"Europe","Country":"Hungary","LifeExpectancy":73.338,"GDP":18008.94444,"Population":9956108},{"continent":"Europe","Country":"Iceland","LifeExpectancy":81.757,"GDP":36180.78919,"Population":301931},{"continent":"Europe","Country":"Ireland","LifeExpectancy":78.885,"GDP":40675.99635,"Population":4109086},{"continent":"Europe","Country":"Italy","LifeExpectancy":80.546,"GDP":28569.7197,"Population":58147733},{"continent":"Europe","Country":"Montenegro","LifeExpectancy":74.543,"GDP":9253.896111,"Population":684736},{"continent":"Europe","Country":"Netherlands","LifeExpectancy":79.762,"GDP":36797.93332,"Population":16570613},{"continent":"Europe","Country":"Norway","LifeExpectancy":80.196,"GDP":49357.19017,"Population":4627926},{"continent":"Europe","Country":"Poland","LifeExpectancy":75.563,"GDP":15389.92468,"Population":38518241},{"continent":"Europe","Country":"Portugal","LifeExpectancy":78.098,"GDP":20509.64777,"Population":10642836},{"continent":"Europe","Country":"Romania","LifeExpectancy":72.476,"GDP":10808.47561,"Population":22276056},{"continent":"Europe","Country":"Serbia","LifeExpectancy":74.002,"GDP":9786.534714,"Population":10150265},{"continent":"Europe","Country":"Slovak Republic","LifeExpectancy":74.663,"GDP":18678.31435,"Population":5447502},{"continent":"Europe","Country":"Slovenia","LifeExpectancy":77.926,"GDP":25768.25759,"Population":2009245},{"continent":"Europe","Country":"Spain","LifeExpectancy":80.941,"GDP":28821.0637,"Population":40448191},{"continent":"Europe","Country":"Sweden","LifeExpectancy":80.884,"GDP":33859.74835,"Population":9031088},{"continent":"Europe","Country":"Switzerland","LifeExpectancy":81.701,"GDP":37506.41907,"Population":7554661},{"continent":"Europe","Country":"Turkey","LifeExpectancy":71.777,"GDP":8458.276384,"Population":71158647},{"continent":"Europe","Country":"United Kingdom","LifeExpectancy":79.425,"GDP":33203.26128,"Population":60776238},{"continent":"Oceania","Country":"Australia","LifeExpectancy":81.235,"GDP":34435.36744,"Population":20434176},{"continent":"Oceania","Country":"New Zealand","LifeExpectancy":80.204,"GDP":25185.00911,"Population":4115771}]       ;
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
	var chart_c1 = [
	                {"province":"北京市","population":19612368},
	                {"province":"天津市","population":12938693},
	                {"province":"河北省","population":71854210},
	                {"province":"山西省","population":27500000},
	                {"province":"内蒙古自治区","population":24706291},
	                {"province":"辽宁省","population":43746323},
	                {"province":"吉林省","population":27452815},
	                {"province":"黑龙江省","population":38313991},
	                {"province":"上海市","population":23019196},
	                {"province":"江苏省","population":78660941},
	                {"province":"浙江省","population":54426891}
	            ] ;
	var chart_c2 = [{"type":"series1","x":1732.8871544450521,"y":-80.75603982433677},{"type":"series2","x":1546.589955687523,"y":282.97513956204057},{"type":"series3","x":742.7253536880016,"y":479.4877045787871},{"type":"series4","x":772.9451237246394,"y":-407.76275377720594},{"type":"series1","x":1359.810951165855,"y":297.2723776474595},{"type":"series2","x":650.068512186408,"y":-129.5293727889657},{"type":"series3","x":1730.0641294568777,"y":-240.9555669873953},{"type":"series4","x":502.4238293990493,"y":-342.1307345852256},{"type":"series1","x":1582.250035367906,"y":-45.05145130679011},{"type":"series2","x":1829.3536202982068,"y":-113.36682550609112},{"type":"series3","x":1572.7724805474281,"y":115.85489613935351},{"type":"series4","x":1887.0485508814454,"y":6.104619242250919},{"type":"series1","x":882.0341778919101,"y":401.86547581106424},{"type":"series2","x":1620.0402630493045,"y":267.45478762313724},{"type":"series3","x":1925.4421964287758,"y":369.47823595255613},{"type":"series4","x":1611.9598066434264,"y":-234.8197065293789},{"type":"series1","x":1720.9005448967218,"y":-115.85958395153284},{"type":"series2","x":1862.451889552176,"y":-248.42322198674083},{"type":"series3","x":1283.97127520293,"y":325.95419557765126},{"type":"series4","x":1869.39731054008,"y":383.6600771173835},{"type":"series1","x":1988.1872748956084,"y":-216.48837719112635},{"type":"series2","x":1187.2317604720592,"y":404.27824622020125},{"type":"series3","x":1571.8251904472709,"y":-96.22862562537193},{"type":"series4","x":1826.7804672941566,"y":-477.26183850318193},{"type":"series1","x":1177.1034905686975,"y":-112.32297029346228},{"type":"series2","x":1195.6303780898452,"y":448.2225668616593},{"type":"series3","x":1955.4035440087318,"y":21.227966528385878},{"type":"series4","x":1732.739924453199,"y":368.81575733423233},{"type":"series1","x":806.2865408137441,"y":385.1917199790478},{"type":"series2","x":1556.4921544864774,"y":-420.2395495958626},{"type":"series3","x":1181.5953878685832,"y":-277.57429890334606},{"type":"series4","x":1269.245852716267,"y":242.08716116845608},{"type":"series1","x":1219.9176428839564,"y":346.6071574948728},{"type":"series2","x":746.3413281366229,"y":-89.49963096529245},{"type":"series3","x":432.45446030050516,"y":441.71203626319766},{"type":"series4","x":777.959868311882,"y":66.79431581869721},{"type":"series1","x":918.3598393574357,"y":448.46232794225216},{"type":"series2","x":1436.13195233047,"y":184.53770177438855},{"type":"series3","x":1119.1939394921064,"y":-312.59450083598495},{"type":"series4","x":1998.3739340677857,"y":5.358115769922733},{"type":"series1","x":1069.4813169538975,"y":-106.57294746488333},{"type":"series2","x":275.5963373929262,"y":205.64519427716732},{"type":"series3","x":801.038783043623,"y":7.43780517950654},{"type":"series4","x":213.5445298627019,"y":288.95508078858256},{"type":"series1","x":1697.732014581561,"y":-495.7758020609617},{"type":"series2","x":1940.3524557128549,"y":57.93372122570872},{"type":"series3","x":1365.2942385524511,"y":246.1609710007906},{"type":"series4","x":986.5696644410491,"y":248.502679169178},{"type":"series1","x":1991.1393811926246,"y":-269.05048871412873},{"type":"series2","x":1244.1082932054996,"y":378.08641185984015},{"type":"series3","x":958.6482960730791,"y":-222.58463921025395},{"type":"series4","x":1939.0085907652974,"y":-415.7125297933817},{"type":"series1","x":1097.460888326168,"y":298.815727699548},{"type":"series2","x":1132.0891315117478,"y":-409.8006417043507},{"type":"series3","x":934.7271472215652,"y":78.89576349407434},{"type":"series4","x":632.7374717220664,"y":240.34222541376948},{"type":"series1","x":25.66775120794773,"y":386.65700424462557},{"type":"series2","x":1791.440169326961,"y":-98.93955988809466},{"type":"series3","x":1391.1143569275737,"y":46.02528735995293},{"type":"series4","x":538.8829139992595,"y":-428.8868750445545},{"type":"series1","x":933.5943283513188,"y":327.7888190932572},{"type":"series2","x":1381.4812870696187,"y":-36.58548276871443},{"type":"series3","x":152.31592673808336,"y":-233.14770916476846},{"type":"series4","x":90.16109630465508,"y":-45.90578889474273},{"type":"series1","x":1855.3984118625522,"y":234.1356431134045},{"type":"series2","x":889.7370044142008,"y":-261.737990193069},{"type":"series3","x":344.61341612040997,"y":-13.636548072099686},{"type":"series4","x":588.4585017338395,"y":-5.226874258369207},{"type":"series1","x":1714.1733933240175,"y":-204.88095516338944},{"type":"series2","x":905.8979945257306,"y":-326.66328828781843},{"type":"series3","x":179.5906499028206,"y":-468.77168817445636},{"type":"series4","x":472.5130721926689,"y":-1.9495864398777485},{"type":"series1","x":1275.0087166205049,"y":29.06017890200019},{"type":"series2","x":262.88699731230736,"y":496.59054493531585},{"type":"series3","x":44.90217100828886,"y":-441.4119469001889},{"type":"series4","x":1782.4337324127555,"y":-269.77423299103975},{"type":"series1","x":748.8169632852077,"y":336.41374530270696},{"type":"series2","x":1684.0793499723077,"y":-123.5110298730433},{"type":"series3","x":1109.3289218842983,"y":423.3962232246995},{"type":"series4","x":354.1235653683543,"y":-307.66808334738016},{"type":"series1","x":1329.577681608498,"y":470.3424177132547},{"type":"series2","x":273.0302046984434,"y":-147.08185475319624},{"type":"series3","x":1873.354759067297,"y":415.8988082781434},{"type":"series4","x":1152.5639267638326,"y":-228.8104579783976},{"type":"series1","x":480.6276988238096,"y":-168.55818405747414},{"type":"series2","x":724.2633355781436,"y":-137.24337238818407},{"type":"series3","x":879.4547133147717,"y":-114.34462806209922},{"type":"series4","x":988.7294666841626,"y":-206.20282599702477},{"type":"series1","x":1954.3535728007555,"y":214.61118385195732},{"type":"series2","x":851.2419117614627,"y":420.7796682603657},{"type":"series3","x":953.703748062253,"y":89.70340387895703},{"type":"series4","x":61.40255834907293,"y":-160.9144126996398},{"type":"series1","x":1207.9351842403412,"y":386.9934994727373},{"type":"series2","x":1142.1515522524714,"y":279.29873764514923},{"type":"series3","x":1069.3543190136552,"y":239.56217663362622},{"type":"series4","x":1898.9934483543038,"y":341.7890924029052},{"type":"series1","x":736.7067560553551,"y":-414.1982044093311},{"type":"series2","x":1718.982090242207,"y":83.44200439751148},{"type":"series3","x":814.3314002081752,"y":-484.1634132899344},{"type":"series4","x":346.93830739706755,"y":150.88692586869}];

	var chart_d1 = [{"province":'北京市1', "population":19612368},{"province":"内蒙古自治区1", "population":24706291},{"province":"黑龙江省1", "population":38313991},
	                        {"province":'北京市', "population":19612368},{"province":"内蒙古自治区", "population":24706291},{"province":"黑龙江省", "population":38313991},
	                        {"province":"广西壮族自治区", "population":46023761},{"province":"海南省", "population":8671485},{"province":"西藏自治区", "population":3002165},{"province":"陕西省", "population":37327379}];
	//---------------------- chart_a1 ----------------
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
	//---------------------- chart_a1 ----------------
	
	//---------------------- chart_a2 ----------------
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
	//---------------------- chart_a2 ----------------
	
	//---------------------- chart_b1 ----------------
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
	//---------------------- chart_b1 ----------------

	//---------------------- chart_c1 ----------------
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
