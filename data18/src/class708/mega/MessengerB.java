package class708.mega.com;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class MessengerB extends JFrame {
	private JTextField input;
	JTextArea list;
	DatagramSocket socket; // 받는 용도

	public MessengerB() throws Exception {
		socket = new DatagramSocket(6000);
		setTitle("메신저 B");
		setSize(400, 600);

		list = new JTextArea();
		list.setFont(new Font("Monospaced", Font.PLAIN, 30));
		list.setEditable(false);
		list.setBackground(Color.blue);

		JScrollPane js = new JScrollPane(list);
		getContentPane().add(js, BorderLayout.CENTER);

		input = new JTextField();
		input.setFont(new Font("굴림", Font.PLAIN, 25));
		input.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String data = input.getText();
				System.out.println("입력 데이터: " + data);
				list.append("나>> " + data + "\n");
				input.setText("");

				// 보내자!
				try {
					DatagramSocket sendSocket = new DatagramSocket(); // 보내는 용도
					byte[] data2 = data.getBytes(); // data
					InetAddress ip = InetAddress.getByName("192.168.1.97"); // 주소

					DatagramPacket packet = new DatagramPacket(data2, data2.length, ip, 5000);
					sendSocket.send(packet);
					System.out.println("전송 완료!");
					sendSocket.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		});
		input.setBackground(Color.ORANGE);
		getContentPane().add(input, BorderLayout.SOUTH);
		input.setColumns(10);
		setVisible(true);
	}
	
	public void process() {
		while (true) {
			try {
				byte[] buf = new byte[256];
				DatagramPacket packet = new DatagramPacket(buf, buf.length);
				socket.receive(packet);
				System.out.println("데이터 받음.");
				list.append("상대>> " + new String(buf) + "\n");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) throws Exception {
		MessengerB m = new MessengerB();
		m.process(); // 보내기 전에 받을 준비를 먼저해야한다.
					// 계속 받아야 하기 때문에 무한루프
	}

}
