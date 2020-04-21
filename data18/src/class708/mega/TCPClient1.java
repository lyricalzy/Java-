package class708.mega.com;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.Socket;

public class TCPClient1 {

	public static void main(String[] args) throws Exception {
		// 1. 전화기로 전화를 걸어보자.!!!
		Socket socket = new Socket("localhost", 9100);
		System.out.println("client1: TCP서버와 연결 성공...!!!");
		// 임시 저장 공간에 모든 문자를 다 집어 넣어놨다가 한줄씩 처리하는 것이 편리
		BufferedReader buffer = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		String result = buffer.readLine();
		System.out.println("받은 데이터: " + result);

	}

}
