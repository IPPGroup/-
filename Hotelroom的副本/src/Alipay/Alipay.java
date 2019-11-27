package Alipay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayOpenPublicTemplateMessageIndustryModifyRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;

public class Alipay {
	AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do","2019090967135513","MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCLRzz3EW7QCVXrEefpDPZoOzeZhcLnCq6/csegB1slMgGzql/wj0kDpk36w75xBxurXzAN6uChEHiT3HFMELK5XGZAlGZ62MnkppOcChBgZnn/UXhhj6YEwtuvI2+gD3KyGeKFs/03I+TcN52XBuMF/52thR2e4BMzH42Reohe+KnqVxcfB4aK7xhep/Jn6c+RSvb9aVd69VKPzTiD7aQstkZFJPV0qZ5Q9on5MdvaorZMJLOkhrZrPOZYUTPLykvERdQoxVAJaMELqsYPFkapWyuKJ6/QVqC0YFfY2GTp9kkUQBLxrNEFwKOOiY4EWDoq9un4rQ6pEnl2/W150L3zAgMBAAECggEAT7/swrPytaCC1+Ua27EWbrxpq7iRz2WohesdLx7HK9ckblICOWZyMmrJf+sRYvrk9w28IFv7X35k7JVvMlTlYYns6tGOlI0JnalcIB8LHYfQF0f5HDP6pgNFc1VhF0+BJ0X3FQPo2+frpcUasV26JLcm/DKasVww4jcRAtoct/Pl67/QHjmUHpfWaTdOB4bGbCkahkH/6JDkqptoACmY/spcuwhT6UJk4h9CZ/PVmx6gGarzWKK0817UeB55IiUdChaDh6IdEi8qp8lDzb6EXoEgfK4MNgrtUc+SKGfdApWw57D0d7/kdKgqAfYBM9UwsWZJ/A7Myx8TQzl18xIXkQKBgQDJ9FQnBTHQTwOpuF3dWuH7PynpHV8uYb/Ersqciau64HwmXfGPauBuA4goNPWSCZ4wdt9ym3phpBJ1Dm0ovXcYsPuAcseDXIQvCUaLghp+FQSBRN6EwtIqPaf6qv/bt1NBVntmgvcwPmIelkNXqoU4ubdARqEerzZMhqQPLDlIBQKBgQCwjQmOWx9w5Qyl8OVhx0OThQmi+tGsfDClzNEXbia5jiGfnSlyHam2Fzya/ow7FpYROwT1CrLfAOh9OHYNJyQ6rjE5kXgcrlZlPL81d+NOPdN/8twJ1FCGXhLBPlBYxct84M6CfIO+oLm84a4PwOMrh5qy8ZSvJA+7rdSNB5ynlwKBgD6Xk11kpsPBOYlosu7gNBoCwaKWj+F4Ok9jPTi3Epqg6NmbVDr3DQgL4C9V+qaAhJ7QuQB0X8HTcEUHa52s2zSz5b8x09RK4E0TuuGSOVPKf9Lw3WaYWzrsURvH0/TtJMijXSuwe5xgOVjxiX2qRBAIv1sUiOtRsqqVMFPjiP1hAoGAGcZ9fqsPDAxkrFVfJ8dPtlnV7lVwBx6ae5pLbIBIZw65GfR3+JEcFdmOn5JKJtZFUn6rWpsVQjl/t8hmc8UjJO4Jgb4bKxTIyD72K3g1V1bvad6rAURd/T/+vPe8AzndW332qFZFZa9RbqIEJ4ihodlKXJWof2lkYqIeRfi2hkECgYAzlzOJBk1b7Hijy9CnQSKFR0NXqjMZwqEmKv0mjq2ugoXSVHWhxqGPrwDoqGTg1gj487Wxb3cBM+IPZzI8Rw5+y8wJJsg0rEIbsoZ1hBVim6WERYmgQhUGiYy4qpNbSG14HthBeUR0UrIOUDIFBTccmHGPcUTd90DoJa9hcoAqYQ==","json","UTF-8","MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi0c89xFu0AlV6xHn6Qz2aDs3mYXC5wquv3LHoAdbJTIBs6pf8I9JA6ZN+sO+cQcbq18wDergoRB4k9xxTBCyuVxmQJRmetjJ5KaTnAoQYGZ5/1F4YY+mBMLbryNvoA9yshnihbP9NyPk3DedlwbjBf+drYUdnuATMx+NkXqIXvip6lcXHweGiu8YXqfyZ+nPkUr2/WlXevVSj804g+2kLLZGRST1dKmeUPaJ+THb2qK2TCSzpIa2azzmWFEzy8pLxEXUKMVQCWjBC6rGDxZGqVsriiev0FagtGBX2Nhk6fZJFEAS8azRBcCjjomOBFg6Kvbp+K0OqRJ5dv1tedC98wIDAQAB","RSA2");
	
	
	public void doPost(HttpServletRequest httpRequest, HttpServletResponse httpResponse) throws ServletException, IOException {
						AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do","2019090967135513","MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCLRzz3EW7QCVXrEefpDPZoOzeZhcLnCq6/csegB1slMgGzql/wj0kDpk36w75xBxurXzAN6uChEHiT3HFMELK5XGZAlGZ62MnkppOcChBgZnn/UXhhj6YEwtuvI2+gD3KyGeKFs/03I+TcN52XBuMF/52thR2e4BMzH42Reohe+KnqVxcfB4aK7xhep/Jn6c+RSvb9aVd69VKPzTiD7aQstkZFJPV0qZ5Q9on5MdvaorZMJLOkhrZrPOZYUTPLykvERdQoxVAJaMELqsYPFkapWyuKJ6/QVqC0YFfY2GTp9kkUQBLxrNEFwKOOiY4EWDoq9un4rQ6pEnl2/W150L3zAgMBAAECggEAT7/swrPytaCC1+Ua27EWbrxpq7iRz2WohesdLx7HK9ckblICOWZyMmrJf+sRYvrk9w28IFv7X35k7JVvMlTlYYns6tGOlI0JnalcIB8LHYfQF0f5HDP6pgNFc1VhF0+BJ0X3FQPo2+frpcUasV26JLcm/DKasVww4jcRAtoct/Pl67/QHjmUHpfWaTdOB4bGbCkahkH/6JDkqptoACmY/spcuwhT6UJk4h9CZ/PVmx6gGarzWKK0817UeB55IiUdChaDh6IdEi8qp8lDzb6EXoEgfK4MNgrtUc+SKGfdApWw57D0d7/kdKgqAfYBM9UwsWZJ/A7Myx8TQzl18xIXkQKBgQDJ9FQnBTHQTwOpuF3dWuH7PynpHV8uYb/Ersqciau64HwmXfGPauBuA4goNPWSCZ4wdt9ym3phpBJ1Dm0ovXcYsPuAcseDXIQvCUaLghp+FQSBRN6EwtIqPaf6qv/bt1NBVntmgvcwPmIelkNXqoU4ubdARqEerzZMhqQPLDlIBQKBgQCwjQmOWx9w5Qyl8OVhx0OThQmi+tGsfDClzNEXbia5jiGfnSlyHam2Fzya/ow7FpYROwT1CrLfAOh9OHYNJyQ6rjE5kXgcrlZlPL81d+NOPdN/8twJ1FCGXhLBPlBYxct84M6CfIO+oLm84a4PwOMrh5qy8ZSvJA+7rdSNB5ynlwKBgD6Xk11kpsPBOYlosu7gNBoCwaKWj+F4Ok9jPTi3Epqg6NmbVDr3DQgL4C9V+qaAhJ7QuQB0X8HTcEUHa52s2zSz5b8x09RK4E0TuuGSOVPKf9Lw3WaYWzrsURvH0/TtJMijXSuwe5xgOVjxiX2qRBAIv1sUiOtRsqqVMFPjiP1hAoGAGcZ9fqsPDAxkrFVfJ8dPtlnV7lVwBx6ae5pLbIBIZw65GfR3+JEcFdmOn5JKJtZFUn6rWpsVQjl/t8hmc8UjJO4Jgb4bKxTIyD72K3g1V1bvad6rAURd/T/+vPe8AzndW332qFZFZa9RbqIEJ4ihodlKXJWof2lkYqIeRfi2hkECgYAzlzOJBk1b7Hijy9CnQSKFR0NXqjMZwqEmKv0mjq2ugoXSVHWhxqGPrwDoqGTg1gj487Wxb3cBM+IPZzI8Rw5+y8wJJsg0rEIbsoZ1hBVim6WERYmgQhUGiYy4qpNbSG14HthBeUR0UrIOUDIFBTccmHGPcUTd90DoJa9hcoAqYQ==","json","UTF-8","MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi0c89xFu0AlV6xHn6Qz2aDs3mYXC5wquv3LHoAdbJTIBs6pf8I9JA6ZN+sO+cQcbq18wDergoRB4k9xxTBCyuVxmQJRmetjJ5KaTnAoQYGZ5/1F4YY+mBMLbryNvoA9yshnihbP9NyPk3DedlwbjBf+drYUdnuATMx+NkXqIXvip6lcXHweGiu8YXqfyZ+nPkUr2/WlXevVSj804g+2kLLZGRST1dKmeUPaJ+THb2qK2TCSzpIa2azzmWFEzy8pLxEXUKMVQCWjBC6rGDxZGqVsriiev0FagtGBX2Nhk6fZJFEAS8azRBcCjjomOBFg6Kvbp+K0OqRJ5dv1tedC98wIDAQAB","RSA2");
						AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();//创建API对应的request
				alipayRequest.setReturnUrl("http://domain.com/CallBack/return_url.jsp");
				alipayRequest.setNotifyUrl("http://domain.com/CallBack/notify_url.jsp");//在公共参数中设置回跳和通知地址
				alipayRequest.setBizContent("{" +
							"    \"out_trade_no\":\"20150320010101001\"," +
							"    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
							"    \"total_amount\":88.88," +
							"    \"subject\":\"Iphone6 16G\"," +
							"    \"body\":\"Iphone6 16G\"," +
							"    \"passback_params\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\"," +
							"    \"extend_params\":{" +
							"    \"sys_service_provider_id\":\"2088511833207846\"" +
							"    }"+
							"  }");//填充业务参数
				String form="";
				try {
					form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
				} 
				catch (AlipayApiException e) {
					e.printStackTrace();
				}
				httpResponse.setContentType("text/html;charset=" + "UTF-8");
				httpResponse.getWriter().write(form);//直接将完整的表单html输出到页面
				httpResponse.getWriter().flush();
				httpResponse.getWriter().close();
				}
}
