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
	var chart_a0 =  [0.8446,0.8445,0.8444,0.8451,0.8418,0.8264,0.8258,0.8232,0.8233,0.8258,0.8283,0.8278,0.8256,0.8292,0.8239,0.8239,0.8245,0.8265,0.8261,0.8269,0.8273,0.8244,0.8244,0.8172,0.8139,0.8146,0.8164,0.82,0.8269,0.8269,0.8269,0.8258,0.8247,0.8286,0.8289,0.8316,0.832,0.8333,0.8352,0.8357,0.8355,0.8354,0.8403,0.8403,0.8406,0.8403,0.8396,0.8418,0.8409,0.8384,0.8386,0.8372,0.839,0.84,0.8389,0.84,0.8423,0.8423,0.8435,0.8422,0.838,0.8373,0.8316,0.8303,0.8303,0.8302,0.8369,0.84,0.8385,0.84,0.8401,0.8402,0.8381,0.8351,0.8314,0.8273,0.8213,0.8207,0.8207,0.8215,0.8242,0.8273,0.8301,0.8346,0.8312,0.8312,0.8312,0.8306,0.8327,0.8282,0.824,0.8255,0.8256,0.8273,0.8209,0.8151,0.8149,0.8213,0.8273,0.8273,0.8261,0.8252,0.824,0.8262,0.8258,0.8261,0.826,0.8199,0.8153,0.8097,0.8101,0.8119,0.8107,0.8105,0.8084,0.8069,0.8047,0.8023,0.7965,0.7919,0.7921,0.7922,0.7934,0.7918,0.7915,0.787,0.7861,0.7861,0.7853,0.7867,0.7827,0.7834,0.7766,0.7751,0.7739,0.7767,0.7802,0.7788,0.7828,0.7816,0.7829,0.783,0.7829,0.7781,0.7811,0.7831,0.7826,0.7855,0.7855,0.7845,0.7798,0.7777,0.7822,0.7785,0.7744,0.7743,0.7726,0.7766,0.7806,0.785,0.7907,0.7912,0.7913,0.7931,0.7952,0.7951,0.7928,0.791,0.7913,0.7912,0.7941,0.7953,0.7921,0.7919,0.7968,0.7999,0.7999,0.7974,0.7942,0.796,0.7969,0.7862,0.7821,0.7821,0.7821,0.7811,0.7833,0.7849,0.7819,0.7809,0.7809,0.7827,0.7848,0.785,0.7873,0.7894,0.7907,0.7909,0.7947,0.7987,0.799,0.7927,0.79,0.7878,0.7878,0.7907,0.7922,0.7937,0.786,0.787,0.7838,0.7838,0.7837,0.7836,0.7806,0.7825,0.7798,0.777,0.777,0.7772,0.7793,0.7788,0.7785,0.7832,0.7865,0.7865,0.7853,0.7847,0.7809,0.778,0.7799,0.78,0.7801,0.7765,0.7785,0.7811,0.782,0.7835,0.7845,0.7844,0.782,0.7811,0.7795,0.7794,0.7806,0.7794,0.7794,0.7778,0.7793,0.7808,0.7824,0.787,0.7894,0.7893,0.7882,0.7871,0.7882,0.7871,0.7878,0.79,0.7901,0.7898,0.7879,0.7886,0.7858,0.7814,0.7825,0.7826,0.7826,0.786,0.7878,0.7868,0.7883,0.7893,0.7892,0.7876,0.785,0.787,0.7873,0.7901,0.7936,0.7939,0.7938,0.7956,0.7975,0.7978,0.7972,0.7995,0.7995,0.7994,0.7976,0.7977,0.796,0.7922,0.7928,0.7929,0.7948,0.797,0.7953,0.7907,0.7872,0.7852,0.7852,0.786,0.7862,0.7836,0.7837,0.784,0.7867,0.7867,0.7869,0.7837,0.7827,0.7825,0.7779,0.7791,0.779,0.7787,0.78,0.7807,0.7803,0.7817,0.7799,0.7799,0.7795,0.7801,0.7765,0.7725,0.7683,0.7641,0.7639,0.7616,0.7608,0.759,0.7582,0.7539,0.75,0.75,0.7507,0.7505,0.7516,0.7522,0.7531,0.7577,0.7577,0.7582,0.755,0.7542,0.7576,0.7616,0.7648,0.7648,0.7641,0.7614,0.757,0.7587,0.7588,0.762,0.762,0.7617,0.7618,0.7615,0.7612,0.7596,0.758,0.758,0.758,0.7547,0.7549,0.7613,0.7655,0.7693,0.7694,0.7688,0.7678,0.7708,0.7727,0.7749,0.7741,0.7741,0.7732,0.7727,0.7737,0.7724,0.7712,0.772,0.7721,0.7717,0.7704,0.769,0.7711,0.774,0.7745,0.7745,0.774,0.7716,0.7713,0.7678,0.7688,0.7718,0.7718,0.7728,0.7729,0.7698,0.7685,0.7681,0.769,0.769,0.7698,0.7699,0.7651,0.7613,0.7616,0.7614,0.7614,0.7607,0.7602,0.7611,0.7622,0.7615,0.7598,0.7598,0.7592,0.7573,0.7566,0.7567,0.7591,0.7582,0.7585,0.7613,0.7631,0.7615,0.76,0.7613,0.7627,0.7627,0.7608,0.7583,0.7575,0.7562,0.752,0.7512,0.7512,0.7517,0.752,0.7511,0.748,0.7509,0.7531,0.7531,0.7527,0.7498,0.7493,0.7504,0.75,0.7491,0.7491,0.7485,0.7484,0.7492,0.7471,0.7459,0.7477,0.7477,0.7483,0.7458,0.7448,0.743,0.7399,0.7395,0.7395,0.7378,0.7382,0.7362,0.7355,0.7348,0.7361,0.7361,0.7365,0.7362,0.7331,0.7339,0.7344,0.7327,0.7327,0.7336,0.7333,0.7359,0.7359,0.7372,0.736,0.736,0.735,0.7365,0.7384,0.7395,0.7413,0.7397,0.7396,0.7385,0.7378,0.7366,0.74,0.7411,0.7406,0.7405,0.7414,0.7431,0.7431,0.7438,0.7443,0.7443,0.7443,0.7434,0.7429,0.7442,0.744,0.7439,0.7437,0.7437,0.7429,0.7403,0.7399,0.7418,0.7468,0.748,0.748,0.749,0.7494,0.7522,0.7515,0.7502,0.7472,0.7472,0.7462,0.7455,0.7449,0.7467,0.7458,0.7427,0.7427,0.743,0.7429,0.744,0.743,0.7422,0.7388,0.7388,0.7369,0.7345,0.7345,0.7345,0.7352,0.7341,0.7341,0.734,0.7324,0.7272,0.7264,0.7255,0.7258,0.7258,0.7256,0.7257,0.7247,0.7243,0.7244,0.7235,0.7235,0.7235,0.7235,0.7262,0.7288,0.7301,0.7337,0.7337,0.7324,0.7297,0.7317,0.7315,0.7288,0.7263,0.7263,0.7242,0.7253,0.7264,0.727,0.7312,0.7305,0.7305,0.7318,0.7358,0.7409,0.7454,0.7437,0.7424,0.7424,0.7415,0.7419,0.7414,0.7377,0.7355,0.7315,0.7315,0.732,0.7332,0.7346,0.7328,0.7323,0.734,0.734,0.7336,0.7351,0.7346,0.7321,0.7294,0.7266,0.7266,0.7254,0.7242,0.7213,0.7197,0.7209,0.721,0.721,0.721,0.7209,0.7159,0.7133,0.7105,0.7099,0.7099,0.7093,0.7093,0.7076,0.707,0.7049,0.7012,0.7011,0.7019,0.7046,0.7063,0.7089,0.7077,0.7077,0.7077,0.7091,0.7118,0.7079,0.7053,0.705,0.7055,0.7055,0.7045,0.7051,0.7051,0.7017,0.7,0.6995,0.6994,0.7014,0.7036,0.7021,0.7002,0.6967,0.695,0.695,0.6939,0.694,0.6922,0.6919,0.6914,0.6894,0.6891,0.6904,0.689,0.6834,0.6823,0.6807,0.6815,0.6815,0.6847,0.6859,0.6822,0.6827,0.6837,0.6823,0.6822,0.6822,0.6792,0.6746,0.6735,0.6731,0.6742,0.6744,0.6739,0.6731,0.6761,0.6761,0.6785,0.6818,0.6836,0.6823,0.6805,0.6793,0.6849,0.6833,0.6825,0.6825,0.6816,0.6799,0.6813,0.6809,0.6868,0.6933,0.6933,0.6945,0.6944,0.6946,0.6964,0.6965,0.6956,0.6956,0.695,0.6948,0.6928,0.6887,0.6824,0.6794,0.6794,0.6803,0.6855,0.6824,0.6791,0.6783,0.6785,0.6785,0.6797,0.68,0.6803,0.6805,0.676,0.677,0.677,0.6736,0.6726,0.6764,0.6821,0.6831,0.6842,0.6842,0.6887,0.6903,0.6848,0.6824,0.6788,0.6814,0.6814,0.6797,0.6769,0.6765,0.6733,0.6729,0.6758,0.6758,0.675,0.678,0.6833,0.6856,0.6903,0.6896,0.6896,0.6882,0.6879,0.6862,0.6852,0.6823,0.6813,0.6813,0.6822,0.6802,0.6802,0.6784,0.6748,0.6747,0.6747,0.6748,0.6733,0.665,0.6611,0.6583,0.659,0.659,0.6581,0.6578,0.6574,0.6532,0.6502,0.6514,0.6514,0.6507,0.651,0.6489,0.6424,0.6406,0.6382,0.6382,0.6341,0.6344,0.6378,0.6439,0.6478,0.6481,0.6481,0.6494,0.6438,0.6377,0.6329,0.6336,0.6333,0.6333,0.633,0.6371,0.6403,0.6396,0.6364,0.6356,0.6356,0.6368,0.6357,0.6354,0.632,0.6332,0.6328,0.6331,0.6342,0.6321,0.6302,0.6278,0.6308,0.6324,0.6324,0.6307,0.6277,0.6269,0.6335,0.6392,0.64,0.6401,0.6396,0.6407,0.6423,0.6429,0.6472,0.6485,0.6486,0.6467,0.6444,0.6467,0.6509,0.6478,0.6461,0.6461,0.6468,0.6449,0.647,0.6461,0.6452,0.6422,0.6422,0.6425,0.6414,0.6366,0.6346,0.635,0.6346,0.6346,0.6343,0.6346,0.6379,0.6416,0.6442,0.6431,0.6431,0.6435,0.644,0.6473,0.6469,0.6386,0.6356,0.634,0.6346,0.643,0.6452,0.6467,0.6506,0.6504,0.6503,0.6481,0.6451,0.645,0.6441,0.6414,0.6409,0.6409,0.6428,0.6431,0.6418,0.6371,0.6349,0.6333,0.6334,0.6338,0.6342,0.632,0.6318,0.637,0.6368,0.6368,0.6383,0.6371,0.6371,0.6355,0.632,0.6277,0.6276,0.6291,0.6274,0.6293,0.6311,0.631,0.6312,0.6312,0.6304,0.6294,0.6348,0.6378,0.6368,0.6368,0.6368,0.636,0.637,0.6418,0.6411,0.6435,0.6427,0.6427,0.6419,0.6446,0.6468,0.6487,0.6594,0.6666,0.6666,0.6678,0.6712,0.6705,0.6718,0.6784,0.6811,0.6811,0.6794,0.6804,0.6781,0.6756,0.6735,0.6763,0.6762,0.6777,0.6815,0.6802,0.678,0.6796,0.6817,0.6817,0.6832,0.6877,0.6912,0.6914,0.7009,0.7012,0.701,0.7005,0.7076,0.7087,0.717,0.7105,0.7031,0.7029,0.7006,0.7035,0.7045,0.6956,0.6988,0.6915,0.6914,0.6859,0.6778,0.6815,0.6815,0.6843,0.6846,0.6846,0.6923,0.6997,0.7098,0.7188,0.7232,0.7262,0.7266,0.7359,0.7368,0.7337,0.7317,0.7387,0.7467,0.7461,0.7366,0.7319,0.7361,0.7437,0.7432,0.7461,0.7461,0.7454,0.7549,0.7742,0.7801,0.7903,0.7876,0.7928,0.7991,0.8007,0.7823,0.7661,0.785,0.7863,0.7862,0.7821,0.7858,0.7731,0.7779,0.7844,0.7866,0.7864,0.7788,0.7875,0.7971,0.8004,0.7857,0.7932,0.7938,0.7927,0.7918,0.7919,0.7989,0.7988,0.7949,0.7948,0.7882,0.7745,0.771,0.775,0.7791,0.7882,0.7882,0.7899,0.7905,0.7889,0.7879,0.7855,0.7866,0.7865,0.7795,0.7758,0.7717,0.761,0.7497,0.7471,0.7473,0.7407,0.7288,0.7074,0.6927,0.7083,0.7191,0.719,0.7153,0.7156,0.7158,0.714,0.7119,0.7129,0.7129,0.7049,0.7095];
	
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

	//---------------------- chart_a0 ----------------
	var Stat = G2.Stat;
	var tmpData = [];
	var date = new Date('2015/08/08').getTime();
	for (var i = 0; i < chart_a0.length; i++) {
		var obj = {};
		obj.time = date + 60 * 1000 * i; // 1分钟一条数据
		obj.value = chart_a0[i];
		tmpData.push(obj);
	}
	var chart = new G2.Chart({
		id : 'chart_a0',
		width : 2200,
		height : 300
	});
	var defs = {
		'time' : {
			type : 'time',
			nice : false,
			mask : 'yy-mm-dd HH:MM'
		}
	};
	chart.source(tmpData, defs);
	chart.area().position('time*value').color('l(90) 0:#727cc9 1:#ffffff');
	chart.line().position('time*value').color('#727cc9');
	chart.tooltip({
		crosshairs : true
	// 显示 tooltip 的辅助线
	});
	chart.render();
	//---------------------- chart_a0 ----------------

	//---------------------- chart_a1 ----------------

	var Stat = G2.Stat;
	var chart = new G2.Chart({
		id : 'chart_a1',
		width : 1000,
		height : 300
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
	frame = Frame.combinColumns(frame, [ 'oldPlayer', 'newPlayer' ], 'Profit',
			'用户分类', 'Year');
	var chart = new G2.Chart({
		id : 'chart_a2',
		width : 1000,
		height : 300
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
		height : 300
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
		height : 300
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
		height : 300
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
		width : 1000,
		height : 300
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
