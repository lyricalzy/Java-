package class708.mega.com;

import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UDPReciver {
	// UDP에서는 받아줄 리시버가 먼저 실행되어 있어야 함.
	public static void main(String[] args) throws Exception {
		DatagramSocket socket = new DatagramSocket(9999); // 받는 쪽은 포트를 정해줘야함
		System.out.println("9999 port data 받을 준비 중..");
		byte[] buf = new byte[256]; // 받은 데이터를 넣을 byte 배열
		DatagramPacket p = new DatagramPacket(buf, buf.length);
		socket.receive(p);
		System.out.println("받은 데이터: " + new String(buf));
		socket.close();
	}

}
