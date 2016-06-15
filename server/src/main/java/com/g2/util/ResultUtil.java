package com.g2.util;

import java.util.HashMap;
import java.util.Map;




public class ResultUtil {
	
	private static final Map<String, String> sResultStatus;

	
	String resultStatus = null;
	String memo = null;
	String result = null;
	boolean isSignOk = false;

	public ResultUtil() {
	}

	static {
		sResultStatus = new HashMap<String, String>();
		sResultStatus.put("9000", "操作成功");
		sResultStatus.put("4000", "系统异常");
		sResultStatus.put("4001", "数据格式不正确");
		sResultStatus.put("4003", "该用户绑定的支付宝账户被冻结或不允许支付");
		sResultStatus.put("4004", "该用户已解除绑定");
		sResultStatus.put("4005", "绑定失败或没有绑定");
		sResultStatus.put("4006", "订单支付失败");
		sResultStatus.put("4010", "重新绑定账户");
		sResultStatus.put("6000", "支付服务正在进行升级操作");
		sResultStatus.put("6001", "用户中途取消支付操作");
		sResultStatus.put("7001", "网页支付失败");
	}

	public  boolean parseResult(String str) {
		try {
			String src = str.replace("{", "");
			src = src.replace("}", "");
			String rs = getContent(src, "resultStatus=", ";memo");
			result = getContent(src, "result=", null);
            String success = getSuccess(result);
            if(rs.equals("9000")){
                if(success.equals("true")){
                    return true;
                }
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return false;
	}
	
	public Map<String,String> parseAlipayStr(String str)
	{
		String src = str.replace("{", "");
		src = src.replace("}", "");
		String rs = getContent(src, "resultStatus=", ";memo");
		result = getContent(src, "result=", null);
        String success = getSuccess(result);
        if(rs.equals("9000")){
            if(success.equals("true")){
            	  return string2JSON(result, "&");
			}
            return null;
        }
        return null;
      
	}
	

    private String getSuccess(String result){
        try {
            Map<String,String> json = string2JSON(result, "&");
            String signType = json.get("success");
            signType = signType.replace("\"", "");
            return signType;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

	private  Map<String,String> string2JSON(String src, String split) {
		Map<String,String> json = new HashMap<String,String>();

		try {
			String[] arr = src.split(split);
			for (int i = 0; i < arr.length; i++) {
				String[] arrKey = arr[i].split("=");
				json.put(arrKey[0], arr[i].substring(arrKey[0].length() + 1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return json;
	}

	private  String getContent(String src, String startTag, String endTag) {
		String content = src;
		int start = src.indexOf(startTag);
		start += startTag.length();

		try {
			if (endTag != null) {
				int end = src.indexOf(endTag);
				content = src.substring(start, end);
			} else {
				content = src.substring(start);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return content;
	}
}
