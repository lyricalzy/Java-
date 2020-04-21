package class708.mega.com;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UDPSender {

	public static void main(String[] args) throws Exception {
		// 전송용 소켓을 만들자.
		DatagramSocket socket = new DatagramSocket();
		String data = "I am Happy..!!!";
		byte[] buf = data.getBytes();
		InetAddress address = InetAddress.getByName("127.0.0.1");
		DatagramPacket packet = new DatagramPacket(buf, buf.length, address, 9999);
		socket.send(packet);
		System.out.println("UDP packet 전송 완료.");
		socket.close();

	}

}
