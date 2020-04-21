package class708.mega.com;

import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServer {
	// 연결을 받아야 하므로 이 프로그램은 먼저 실행되고 있어야 함
	public static void main(String[] args) throws Exception {
		// 1. 승인만 하는 소켓이 있어야 한다.
		ServerSocket server = new ServerSocket(9100); // 9100은 포트번호
		System.out.println("TCP 서버 소켓 시작됨.");
		System.out.println("클라이언트의 연결을 기다리는중.");
		int count = 0; // 연결된 클라이언트의 개수를 세줄 변수, 지역변수라서 자동 초기화 x
		while (true) {
			// 2. 승인이 떨어지면, 통신할 수 있는 별도의 소켓 객체 생성
			Socket socket = server.accept(); // 승인해주는 메소드
			// 소켓의 ip를 가지고 와서,
			InetAddress ip = socket.getInetAddress();
			String ip2 = ip.toString();
			// 해당 ip로 부터 연결 요청이 들어왔음.
			System.out.println(ip + "로부터 연결 요청이 들어왔음.");
			if (ip2.equals("/127.0.0.1")) {
				System.out.println("클라이언트의 요청을 승인함..");
				System.out.println("연결된 클라이언트의 포트 번호: " + socket.getPort());
				System.out.println("연결된 클라이언트의 수: " + ++count);
				PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
				out.println("I am a java programmer!!!");
			} else {
				System.out.println("승인 안함....");
				socket.close();
			}
		}

	}

}
