package class708.mega.com;

import java.net.InetAddress;

public class DomainToIP {
	public static void main(String[] args) throws Exception {
		String name = "www.daum.net";
		InetAddress ipInfo = InetAddress.getByName(name);
		System.out.println(ipInfo);
	}
}
